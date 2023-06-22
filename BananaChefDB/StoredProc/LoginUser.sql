CREATE PROCEDURE [dbo].[LoginUser]
	@identifier NVARCHAR(255),
	@password NVARCHAR(100),
	@message NVARCHAR(100) OUTPUT,
	@UserResult NVARCHAR(MAX) OUTPUT
AS
BEGIN
	DECLARE @UserID UNIQUEIDENTIFIER
	DECLARE @storedPassword VARBINARY(64)
	DECLARE @storedSalt VARCHAR(100)

	/*
	* Identification email ou pseudo
	*/
	IF CHARINDEX('@', @identifier) > 0
	-- si email
		BEGIN
			SELECT @UserID = UserID, @storedPassword = Password, @storedSalt = Salt
			FROM [dbo].[User]
			WHERE Email = @identifier
		END
	ELSE
	-- si pseudo
		BEGIN
			SELECT @UserID = UserID, @storedPassword = Password, @storedSalt = Salt
			FROM [dbo].[User]
			WHERE Username = @identifier
		END

	/*
	* Control userId
	*/
	IF @UserID IS NOT NULL
		BEGIN
			/*
			* HashKey
			* Recup secret key
			*/
			DECLARE @hashKey VARCHAR(320)
			SET @hashKey = dbo.GetSecret()

			/*
			* inputPassword
			* hashage du inputPassword en SHA2_512 avec le @storedSalt, @hashKey, @password, @storedSalt
			*/
			DECLARE @inputPassword VARBINARY(64)
			SET @inputPassword = HASHBYTES('SHA2_512', CONCAT(@storedSalt, @hashKey, @password, @storedSalt))

			/*
			* Control pwd
			*/
			IF @inputPassword = @storedPassword
				BEGIN
					SET @message = 'Login successful'

					-- Sélectionner toutes les colonnes de l'utilisateur correspondant
					SET @UserResult = (
						SELECT *, CONVERT(NVARCHAR(MAX), Password) AS Password
						FROM [User]
						WHERE UserID = @UserID
						FOR JSON AUTO
					)
				END
			ELSE
				BEGIN
					SET @message = 'Incorrect Username/Email or password'
				END
		END
	ELSE
		BEGIN
			SET @message = 'Incorrect Username/Email or password'
		END
END
