CREATE PROCEDURE [dbo].[LoginUser]
	@identifier NVARCHAR(255),
	@password NVARCHAR(100)
AS
BEGIN
	DECLARE @userId UNIQUEIDENTIFIER
	DECLARE @storedPassword VARBINARY(64)
	DECLARE @storedSalt VARCHAR(100)

	/*
	* Identification email ou pseudo
	*/
	IF CHARINDEX('@', @identifier) > 0
	-- si email
		BEGIN
			SELECT @userId = UserID, @storedPassword = Pwd, @storedSalt = Salt
			FROM [dbo].[User]
			WHERE Email = @identifier
		END
	ELSE
	-- si pseudo
		BEGIN
			SELECT @userId = UserID, @storedPassword = Pwd, @storedSalt = Salt
			FROM [dbo].[User]
			WHERE Username = @identifier
		END

	/*
	* Control userId
	*/
	IF @userId IS NOT NULL
		BEGIN
			/*
			* HashKey
			* Recup secret key
			*/
			DECLARE @hashKey VARCHAR(100)
			SET @hashKey = dbo.GetSecret()

			/*
			* inputPassword
			* hashage du inputPassword en SHA2_512 avec le @storedSalt, @hashKey, @password, @storedSalt
			*/
			DECLARE @inputPassword VARBINARY(64)
			SET @inputPassword = HASHBYTES('SHA2_512', CONCAT(@storedSalt,@hashKey,@password, @storedSalt))

			/*
			* Control pwd
			*/
			IF @inputPassword = @storedPassword
				BEGIN
					SELECT 'Login successful' AS Message, @userId AS UserID
				END
			ELSE
				BEGIN
					SELECT 'Incorrect Username/Email or password' AS Message, NULL AS UserID
				END
		END
	ELSE
		BEGIN
			SELECT 'Incorrect Username/Email or password' AS Message, NULL AS UserID
		END
END
