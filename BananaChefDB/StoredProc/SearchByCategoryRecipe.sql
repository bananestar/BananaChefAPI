CREATE PROCEDURE SearchByCategoryRecipe
    @CategoriesList NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- Créer une table temporaire pour stocker la liste des catégories recherchées
    CREATE TABLE #TempCategories
    (
        CategoryName NVARCHAR(100)
    )

    -- Insérer les catégories recherchées dans la table temporaire
    INSERT INTO #TempCategories (CategoryName)
    SELECT value
    FROM STRING_SPLIT(@CategoriesList, ',')

    -- Rechercher les recettes qui appartiennent à au moins une des catégories spécifiées
    SELECT r.RecipeID, r.Title, r.Description, r.PreparationTime, r.CookingTime, r.Difficulty, r.Score, r.CreatedAt
    FROM Recipes r
    INNER JOIN RecipeCategories rc ON r.RecipeID = rc.RecipeID
    INNER JOIN Categories c ON rc.CategoryID = c.CategoryID
    WHERE c.Name IN (SELECT CategoryName FROM #TempCategories)
    GROUP BY r.RecipeID, r.Title, r.Description, r.PreparationTime, r.CookingTime, r.Difficulty, r.Score, r.CreatedAt

    -- Supprimer la table temporaire
    DROP TABLE #TempCategories

END

--Exemple de la requête
--EXEC SearchRecipesByCategories @CategoriesList = 'Desserts, Vegan';
