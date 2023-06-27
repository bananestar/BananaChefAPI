CREATE PROCEDURE [dbo].[DeleteRecipe]
	@RecipeID UNIQUEIDENTIFIER
AS
BEGIN
	IF @RecipeID IS NULL
        BEGIN
            RAISERROR('La valeur de @RecipeID ne peut pas être NULL.', 16, 1);
            RETURN; -- Sortie de la procédure stockée en cas d'erreur
        END

    DELETE FROM dbo.RecipeCategories WHERE RecipeID=@RecipeID
    DELETE FROM dbo.RecipeIngredient WHERE RecipeID=@RecipeID
    DELETE FROM dbo.Steps WHERE RecipeID=@RecipeID
    DELETE FROM dbo.Recipes WHERE RecipeID=@RecipeID

    PRINT 'RECORD WAS DELETE '
END