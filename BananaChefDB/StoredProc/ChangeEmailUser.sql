CREATE PROCEDURE ChangeEmailUser
    @identifier NVARCHAR(255),
    @newEmail NVARCHAR(255),
    @message NVARCHAR(100) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @userID UNIQUEIDENTIFIER

    -- Vérifier si l'identificateur correspond à un ID utilisateur
    IF ISNULL(TRY_CAST(@identifier AS UNIQUEIDENTIFIER), '') <> ''
    BEGIN
        -- Identifier par ID utilisateur
        SET @userID = @identifier
    END
    ELSE
    BEGIN
        -- Identifier par nom d'utilisateur ou adresse e-mail
        SELECT @userID = UserID
        FROM [User]
        WHERE UserID = @identifier OR Username = @identifier OR Email = @identifier
    END

    -- Vérifier si l'utilisateur existe
    IF @userID IS NOT NULL
    BEGIN
        -- Vérifier si le nouvel e-mail existe déjà dans la base de données pour un autre utilisateur
        IF NOT EXISTS (SELECT 1 FROM [User] WHERE Email = @newEmail AND UserID <> @userID)
        BEGIN
            -- Mettre à jour l'e-mail de l'utilisateur
            UPDATE [User]
            SET Email = @newEmail
            WHERE UserID = @userID

            SET @message = 'Email updated successfully'
        END
        ELSE
        BEGIN
            SET @message = 'The new email is already associated with another user'
        END
    END
    ELSE
    BEGIN
        SET @message = 'User not found'
    END

END
