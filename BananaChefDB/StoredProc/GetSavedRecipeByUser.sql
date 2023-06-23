CREATE PROCEDURE GetSavedRecipesByUser
    @SearchParameter NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Récupérer les recettes sauvegardées par l'utilisateur
    SELECT r.RecipeID, r.Title
    FROM SavedRecipes sr
    INNER JOIN Recipes r ON sr.RecipeID = r.RecipeID
    INNER JOIN [User] u ON sr.UserID = u.UserID
    WHERE u.Username = @SearchParameter
        OR u.UserID = @SearchParameter
        OR u.Email = @SearchParameter;

END



--Exemple de la requête
--EXEC GetSavedRecipesByUser @SearchParameter = 'username';
-- ou
--EXEC GetSavedRecipesByUser @SearchParameter = 'mail@example.com';
-- ou
--EXEC GetSavedRecipesByUser @SearchParameter = 'userID';
