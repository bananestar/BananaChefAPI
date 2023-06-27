CREATE PROCEDURE [dbo].[UpdateRecipeIngredientList]
	@RecipeID UNIQUEIDENTIFIER,
	@IngredientsJson NVARCHAR(MAX)
AS
BEGIN
	DECLARE	@Name varchar(50)
	DECLARE	@Description varchar(MAX)
	DECLARE	@Quantity Decimal(10,2)
	DECLARE	@Unit varchar(10)
	DECLARE @IngredientID UNIQUEIDENTIFIER
	DECLARE @RecipeIngredientID UNIQUEIDENTIFIER
	DECLARE @Message varchar(100)
	DECLARE @IfExist BIT = 0
	
	CREATE TABLE #IngredientNew
	(
		Name varchar(50),
		Description varchar(MAX),
		Quantity Decimal(10,2),
		Unit varchar(10)
	)

	INSERT INTO #IngredientNew (Name, Description, Quantity, Unit)
    SELECT [Name], [Description], [Quantity], [Unit]
    FROM OPENJSON(@IngredientsJson)
    WITH (
		Name varchar(50),
		Description varchar(MAX),
		Quantity Decimal(10,2),
		Unit varchar(10)
	)

	CREATE TABLE #IngredientOld
	(
		IngredientID UNIQUEIDENTIFIER
	)

	INSERT INTO #IngredientOld(IngredientID)
	SELECT IngredientID 
	FROM dbo.RecipeIngredient 
	WHERE RecipeID=@RecipeID

	WHILE EXISTS(SELECT TOP 1 Name=@Name, Description=@Description, Quantity=@Quantity, Unit=@Unit FROM #IngredientNew)
		BEGIN
			IF NOT EXISTS(SELECT IngredientID=@IngredientID FROM dbo.Ingredients WHERE Name=@Name)
				BEGIN
					EXEC AddIngredients @Name,@Description,@Message OUTPUT,@IfExist OUTPUT,@IngredientID OUTPUT

					PRINT @Message
				END
			ELSE
				BEGIN
					UPDATE dbo.Ingredients
					SET Name=@Name,
						Description=@Description,
						UpdatedAt=GETDATE()
					WHERE IngredientID=@IngredientID

					PRINT 'Ingredient Updated :' + @Name
				END

			IF NOT EXISTS(SELECT RecipeIngredientID=@RecipeIngredientID FROM dbo.RecipeIngredient WHERE IngredientID=@IngredientID AND RecipeID=@RecipeID)
				BEGIN
					EXEC AddRecipeIngredients @RecipeID,@IngredientID,@Quantity,@Unit
					PRINT 'Add Record RecipeIngredient'
				END
			ELSE
				BEGIN
					UPDATE dbo.RecipeIngredient
					SET Quantity	= @Quantity,
						Unit		= @Unit,
						UpdatedAt	= GETDATE()
					WHERE RecipeIngredientID=@RecipeIngredientID
				END

			DELETE FROM #IngredientNew WHERE Name=@Name
			DELETE FROM #IngredientOld WHERE IngredientID=@IngredientID
		END

	WHILE EXISTS(SELECT TOP 1 IngredientID=@IngredientID FROM #IngredientOld)
		BEGIN
			DELETE FROM dbo.RecipeIngredient WHERE IngredientID=@IngredientID AND RecipeID=@RecipeID
			DELETE FROM #IngredientOld WHERE IngredientID=@IngredientID
		END
END
