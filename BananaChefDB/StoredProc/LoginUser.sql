CREATE PROCEDURE [dbo].[LoginUser]
	@identifier NVARCHAR(255),
	@password NVARCHAR(100),
	@UserID UNIQUEIDENTIFIER OUTPUT,
	@message NVARCHAR(100) OUTPUT
AS
BEGIN
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
					SET @UserID = CONVERT(NVARCHAR(36), @UserID);
				END
			ELSE
				BEGIN
					SET @message = 'Incorrect Username/Email or password 1'
					SET @userId = NULL
				END
		END
	ELSE
		BEGIN
			SET @message = 'Incorrect Username/Email or password 2'
			SET @userId = NULL
		END
END
