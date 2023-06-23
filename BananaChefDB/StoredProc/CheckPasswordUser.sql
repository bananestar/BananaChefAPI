CREATE PROCEDURE CheckPasswordUser
    @userID UNIQUEIDENTIFIER,
    @password NVARCHAR(100),
    @isValidPassword BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @storedPassword VARBINARY(64)
    DECLARE @storedSalt VARCHAR(100)

    -- Vérifier si l'utilisateur existe
    IF EXISTS (SELECT 1 FROM [User] WHERE UserID = @userID)
    BEGIN
        -- Récupérer le mot de passe et le sel stockés pour l'utilisateur
        SELECT @storedPassword = Password, @storedSalt = Salt
        FROM [User]
        WHERE UserID = @userID

        -- Hasher le mot de passe fourni avec le sel stocké
        DECLARE @inputPassword VARBINARY(64)
        SET @inputPassword = HASHBYTES('SHA2_512', CONCAT(@storedSalt, @password, @storedSalt))

        -- Vérifier si les mots de passe correspondent
        IF @inputPassword = @storedPassword
        BEGIN
            SET @isValidPassword = 1
        END
        ELSE
        BEGIN
            SET @isValidPassword = 0
        END
    END
    ELSE
    BEGIN
        SET @isValidPassword = 0
    END

END


--@userID : l'ID de l'utilisateur pour lequel on vérifie le mot de passe
--@password : le mot de passe à vérifier
--@isValidPassword : une sortie booléenne qui indique si le mot de passe est valide pour l'utilisateur