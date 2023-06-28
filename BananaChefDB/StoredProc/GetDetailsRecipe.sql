CREATE PROCEDURE GetDetailsRecipe
    @RecipeID UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    -- Récupérer les informations de base de la recette
    SELECT RecipeID, Title, Description, PreparationTime, CookingTime, Difficulty, Score, CreatedAt
    FROM Recipes
    WHERE RecipeID = @RecipeID;

    -- Récupérer la liste des ingrédients de la recette
    SELECT i.Name, i.Description, ri.Quantity, ri.Unit
    FROM RecipeIngredient ri
    INNER JOIN Ingredients i ON ri.IngredientID = i.IngredientID
    WHERE ri.RecipeID = @RecipeID;

    -- Récupérer la liste des étapes de la recette
    SELECT Description, OrderNumber
    FROM Steps
    WHERE RecipeID = @RecipeID
    ORDER BY OrderNumber ASC;

    -- Récupérer la liste des catégories de la recette
    SELECT c.Name
    FROM RecipeCategories rc
    INNER JOIN Categories c ON rc.CategoryID = c.CategoryID
    WHERE rc.RecipeID = @RecipeID;

END



--Exemple de la requête
--EXEC GetDetailsRecipe @RecipeID = 'recipeID';
