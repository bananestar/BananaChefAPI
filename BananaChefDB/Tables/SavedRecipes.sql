﻿CREATE TABLE [dbo].[SavedRecipes]
(
	[SavedRecipeID] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[UserID] UNIQUEIDENTIFIER NOT NULL,
	[RecipeID] UNIQUEIDENTIFIER NOT NULL,
	SavedAt DATETIME2 DEFAULT GETDATE(),
)
