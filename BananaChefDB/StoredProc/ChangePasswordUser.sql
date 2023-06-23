CREATE PROCEDURE ChangePasswordUser
    @password NVARCHAR(100),
    @newPassword NVARCHAR(100),
    @userID UNIQUEIDENTIFIER,
    @message NVARCHAR(100) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Variables pour stocker le mot de passe actuel et le nouveau mot de passe hashés et le sel actuel stocker
    DECLARE @storedPassword VARBINARY(64)
    DECLARE @storedSalt VARCHAR(100)
    DECLARE @newPasswordHash VARBINARY(64)

    -- Récupérer le mot de passe actuel de l'utilisateur
    SELECT @storedPassword = Password,
           @storedSalt = Salt
    FROM [User]
    WHERE UserID = @userID

    -- Générer un nouveau sel pour l'utilisateur
    DECLARE @newSalt VARCHAR(100)
    SET @newSalt = CONVERT(VARCHAR(100), CONCAT(NEWID(), NEWID(), NEWID()))

    -- Hasher le nouveau mot de passe avec le nouveau sel et la méthode de hashage appropriés
    DECLARE @hashKey VARCHAR(320)
    SET @hashKey = dbo.GetSecret()

    -- Hashage du nouveau mot de passe
    SET @newPasswordHash = HASHBYTES('SHA2_512', CONCAT(@newSalt, @hashKey, @newPassword, @newSalt))

    -- Vérifier si le mot de passe actuel correspond au mot de passe stocké
    IF @storedPassword = HASHBYTES('SHA2_512', CONCAT(@storedSalt, @hashKey, @password, @storedSalt))
    BEGIN
        -- Mettre à jour le mot de passe et le sel de l'utilisateur avec les nouvelles valeurs
        UPDATE [User]
        SET Password = @newPasswordHash,
            Salt = @newSalt
        WHERE UserID = @userID

        SET @message = 'Password changed successfully'
    END
    ELSE
    BEGIN
        SET @message = 'Incorrect current password'
    END

END
