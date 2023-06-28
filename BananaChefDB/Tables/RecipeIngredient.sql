CREATE TABLE [dbo].[RecipeIngredient]
(
	[RecipeIngredientID] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	RecipeID UNIQUEIDENTIFIER not null,
	IngredientID UNIQUEIDENTIFIER not null,
	Quantity Decimal(10,2) not null,
	Unit varchar(10) CHECK (Unit IN ('g', 'kg', 'mg', 'L', 'mL', 'cL', 'c. à soupe', 'c. à café', 'Tasse', 'Verre', 'oz', 'lb', 'Pincée', 'Brin', 'Feuille', 'Tranche', 'Gousse', 'CLO', 'Filet', 'Morceau', 'Rondelle', 'Unitée', 'Sachet')),
	CreatedAt DATETIME2 DEFAULT GETDATE(),
    UpdatedAt DATETIME2 DEFAULT GETDATE()
)
