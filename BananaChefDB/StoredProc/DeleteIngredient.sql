CREATE PROCEDURE [dbo].[DeleteIngredient]
	@IngredientID UNIQUEIDENTIFIER
AS
BEGIN
	IF @IngredientID IS NULL
		BEGIN
			RAISERROR('Invalid @IngredientID. Please provide a valid value.', 16, 1);
			RETURN;
		END

	DELETE FROM dbo.RecipeIngredient WHERE IngredientID=@IngredientID
	DELETE FROM dbo.Ingredients WHERE IngredientID=@IngredientID

	PRINT 'RECORD WAS DELETE '
END
