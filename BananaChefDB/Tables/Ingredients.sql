CREATE TABLE [dbo].[Ingredients]
(
	[IngredientID] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Name varchar(50) not null,
	Description varchar(max),
	CreatedAt DATETIME2 DEFAULT GETDATE(),
    UpdatedAt DATETIME2 DEFAULT GETDATE()
)
