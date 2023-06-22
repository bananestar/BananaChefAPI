CREATE TABLE [dbo].[Articles]
(
	[ArticleID] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Title varchar(100),
	Content varchar(max),
	CreatedAt DATETIME2 DEFAULT GETDATE(),
    UpdatedAt DATETIME2 DEFAULT GETDATE()
)
