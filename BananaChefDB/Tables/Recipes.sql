CREATE TABLE [dbo].[Recipes]
(
	[RecipeID] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Title varchar(100) not null,
	Description varchar(max) not null,
	PreparationTime int not null,
	CookingTime int not null,
	Difficulty VARCHAR(10) CHECK (Difficulty IN ('Easy', 'Medium', 'Hard')) NOT NULL,
	Author VARCHAR(50) not null,
	ImageUrl VARCHAR(500) not null,
	VideoUrl VARCHAR(500),
	Score decimal(3,2) default 0,
	CreatedAt DATETIME2 DEFAULT GETDATE(),
    UpdatedAt DATETIME2 DEFAULT GETDATE()
)
