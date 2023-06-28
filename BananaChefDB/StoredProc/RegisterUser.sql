CREATE PROCEDURE RegisterUser
	@username NVARCHAR(30),
	@email NVARCHAR(255),
	@pwd NVARCHAR(100)
AS
BEGIN
	/*
	* Salt
	* UUID + HASH ( email + username ) + UUID
	*/
	DECLARE @salt VARCHAR(100)
	SET @salt = CONVERT(VARCHAR(100),CONCAT(NEWID(), NEWID(), NEWID()))

	/*
	* HashKey
	* Recup secret key
	*/
	DECLARE @hashKey VARCHAR(320) 
	SET @hashKey = dbo.GetSecret()

	/*
	* pwdHash
	* hashage du pwd en SHA2_512 avec le salt, hashkey, pwd, salt
	*/
	DECLARE @pwdHash VARBINARY(64)
	SET @pwdHash = HASHBYTES('SHA2_512', CONCAT(@salt, @hashKey, @pwd, @salt))

	/*
	* userId
	* generation l'id user en UUID
	*/
	DECLARE @userId UNIQUEIDENTIFIER
	SET @userId = NEWID()

	/*
	* Control si l'email et le pseudo existe
	* si ok = insert
	* si ko = erreur
	*/
	IF NOT EXISTS (SELECT 1 FROM [dbo].[User] WHERE Username = @username)
		AND NOT EXISTS (SELECT 1 FROM [dbo].[User] WHERE Email = @email)
		BEGIN
			INSERT INTO [dbo].[User] (UserID, Username, Email, Password, Salt, CreatedAt, UpdatedAt)
			VALUES (@userId,@username,@email,@pwdHash,@salt, GETDATE(), GETDATE())
		END
	ELSE
		BEGIN
			RAISERROR('Username or email already exists.', 16, 1)
			RETURN
		END
END
