CREATE TABLE [dbo].[User]
(
	[UserID] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    Username NVARCHAR(30) NOT NULL UNIQUE, 
    Email NVARCHAR(255) NOT NULL UNIQUE,
    Pwd VARBINARY(64) NOT NULL,
    Salt VARCHAR(100) NOT NULL,
    IsAdmin BIT DEFAULT 0,
    ProfileImageURL VARCHAR(255) DEFAULT 'https://firebasestorage.googleapis.com/v0/b/quizermania-f7be1.appspot.com/o/default.png?alt=media&token=f8b1b4b8-121d-4ffa-9e9c-bfbbf190f163',
    CreatedAt DATETIME2 DEFAULT GETDATE(),
    UpdatedAt DATETIME2 DEFAULT GETDATE()
)
