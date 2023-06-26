CREATE PROCEDURE [dbo].[AddIngredients]
	@Name varchar(50),
	@Description varchar(max),
	@Message varchar(100) OUTPUT,
	@IfExist BIT = 0 OUTPUT,
	@IngredientID UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
	SET @IngredientID = NEWID()

	IF NOT EXISTS(SELECT * from [dbo].[Ingredients] WHERE Name = @Name)
	BEGIN
		INSERT INTO [dbo].[Ingredients](IngredientID,Name,Description,CreatedAt,UpdatedAt)
		VALUES (@IngredientID,@Name,@Description,GETDATE(), GETDATE())

		SET @Message = @Name + ' not exist, Add to Ingredients'
	END
	ELSE
	BEGIN
		SELECT IngredientID = @IngredientID FROM [dbo].Ingredients WHERE Name = @Name

		SET @Message = @Name + ' exist'

		SET @IfExist = 1
	END
END
