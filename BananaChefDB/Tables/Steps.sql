CREATE TABLE [dbo].[Steps]
(
	[StepID] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[RecipeID] UNIQUEIDENTIFIER NOT NULL,
	Description varchar(max) not null,
	OrderNumber int not null,
	CreatedAt DATETIME2 DEFAULT GETDATE(),
    UpdatedAt DATETIME2 DEFAULT GETDATE()
)
