CREATE PROCEDURE AddIngredients
	@Name varchar(50),
	@Description varchar(max),
	@Message varchar(100) OUTPUT,
	@IfExist BIT = 0 OUTPUT,
	@IngredientID UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
	SET @IngredientID = NEWID()

	IF NOT EXISTS(SELECT * FROM Ingredients WHERE Name = @Name)
	BEGIN
		INSERT INTO Ingredients(IngredientID, Name, Description, CreatedAt, UpdatedAt)
		VALUES (@IngredientID, @Name, ISNULL(@Description, ''), GETDATE(), GETDATE())

		SET @Message = @Name + ' does not exist, added to Ingredients'
	END
	ELSE
	BEGIN
		SELECT IngredientID = @IngredientID FROM Ingredients WHERE Name = @Name

		SET @Message = @Name + ' already exists'

		SET @IfExist = 1
	END
END
