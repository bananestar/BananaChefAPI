CREATE PROCEDURE GetByUserComment
    @Identifier NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Variable temporaire pour stocker l'ID de l'utilisateur
    DECLARE @UserID UNIQUEIDENTIFIER

    -- Vérifier si l'identifiant est un ID utilisateur
    IF ISNULL(TRY_CAST(@Identifier AS UNIQUEIDENTIFIER), '') <> ''
    BEGIN
        SET @UserID = @Identifier
    END
    ELSE
    BEGIN
        -- Vérifier si l'identifiant est un nom d'utilisateur
        SELECT @UserID = UserID
        FROM [User]
        WHERE Username = @Identifier

        -- Vérifier si l'identifiant est une adresse e-mail
        IF @UserID IS NULL
        BEGIN
            SELECT @UserID = UserID
            FROM [User]
            WHERE Email = @Identifier
        END
    END

    -- Récupérer tous les commentaires de l'utilisateur
    SELECT c.CommentID, c.RecipeID, c.ArticleID, 
           CASE WHEN c.RecipeID IS NOT NULL THEN r.Title
                WHEN c.ArticleID IS NOT NULL THEN a.Title
           END AS Title,
           c.CommentText, c.CreatedAt, c.UpdatedAt
    FROM Comments c
    LEFT JOIN Recipes r ON c.RecipeID = r.RecipeID
    LEFT JOIN Articles a ON c.ArticleID = a.ArticleID
    WHERE c.UserID = @UserID
    ORDER BY c.CreatedAt DESC

END


--Exemple de la requête
--EXEC GetByUserComment @Identifier = 'user123'
