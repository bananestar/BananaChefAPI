CREATE PROCEDURE SearchByNameRecipe
    @RecipeName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Rechercher les recettes par nom
    SELECT RecipeID, Title, Description, PreparationTime, CookingTime, Difficulty, Score, CreatedAt
    FROM Recipes
    WHERE Title LIKE '%' + @RecipeName + '%';

END

--Exemple de la requête
--EXEC SearchRecipesByName @RecipeName = 'Poulet';
