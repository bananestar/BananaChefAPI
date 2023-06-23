CREATE PROCEDURE SearchByIngredientsRecipe
    @IngredientsList NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- Créer une table temporaire pour stocker la liste des ingrédients recherchés
    CREATE TABLE #TempIngredients
    (
        IngredientName NVARCHAR(100)
    )

    -- Insérer les ingrédients recherchés dans la table temporaire
    INSERT INTO #TempIngredients (IngredientName)
    SELECT value
    FROM STRING_SPLIT(@IngredientsList, ',')

    -- Rechercher les recettes qui contiennent tous les ingrédients spécifiés
    SELECT r.RecipeID, r.Title, r.Description, r.PreparationTime, r.CookingTime, r.Difficulty, r.Score, r.CreatedAt
    FROM Recipes r
    INNER JOIN RecipeIngredient ri ON r.RecipeID = ri.RecipeID
    INNER JOIN Ingredients i ON ri.IngredientID = i.IngredientID
    WHERE i.Name IN (SELECT IngredientName FROM #TempIngredients)
    GROUP BY r.RecipeID, r.Title, r.Description, r.PreparationTime, r.CookingTime, r.Difficulty, r.Score, r.CreatedAt
    HAVING COUNT(DISTINCT i.Name) = (SELECT COUNT(*) FROM #TempIngredients)

    -- Supprimer la table temporaire
    DROP TABLE #TempIngredients

END


--Exemple de la requête
--EXEC SearchRecipesByIngredients @IngredientsList = 'Poulet, Oignon, Tomate';
