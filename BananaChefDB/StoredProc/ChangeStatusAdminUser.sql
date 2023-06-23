CREATE PROCEDURE ChangeStatusAdminUser
    @userID UNIQUEIDENTIFIER,
    @isAdmin BIT,
    @adminUserID UNIQUEIDENTIFIER,
    @message NVARCHAR(100) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Vérifier si l'utilisateur exécutant la procédure est un administrateur
    DECLARE @isCallerAdmin BIT
    SELECT @isCallerAdmin = IsAdmin
    FROM [User]
    WHERE UserID = @adminUserID

    IF @isCallerAdmin = 1
    BEGIN
        -- Mettre à jour la valeur IsAdmin de l'utilisateur spécifié
        UPDATE [User]
        SET IsAdmin = @isAdmin
        WHERE UserID = @userID

        SET @message = 'User admin status updated successfully'
    END
    ELSE
    BEGIN
        SET @message = 'Only administrators can change user admin status'
    END

END
