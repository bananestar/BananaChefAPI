CREATE PROCEDURE [dbo].[GetUserByID]
	@UserID UNIQUEIDENTIFIER,
	@User NVARCHAR(MAX) OUTPUT
AS
BEGIN
	IF @UserID IS NULL
        BEGIN
            RAISERROR('La valeur de @UserID ne peut pas être NULL.', 16, 1);
            RETURN; -- Sortie de la procédure stockée en cas d'erreur
        END

    SET @User = (
					SELECT *, CONVERT(NVARCHAR(MAX), Password) AS Password
					FROM [User]
					WHERE UserID = @UserID
					FOR JSON AUTO
				)
	IF @User IS NULL
		BEGIN
			RAISERROR('La valeur de @User est NULL.', 16, 1);
			RETURN;
		END
END
