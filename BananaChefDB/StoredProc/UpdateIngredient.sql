CREATE PROCEDURE UpdateIngredient
	@IngredientID UNIQUEIDENTIFIER,
	@Name varchar(50),
	@Description varchar(max)
AS
BEGIN
	IF @IngredientID IS NULL
		BEGIN
			RAISERROR('Invalid @IngredientID. Please provide a valid value.', 16, 1);
			RETURN;
		END

	UPDATE dbo.Ingredients
		SET Name		= @Name,
			Description = @Description,
			UpdatedAt	= GETDATE()
	WHERE IngredientID=@IngredientID

	PRINT 'Update Ingredient'
END