CREATE PROCEDURE [dbo].[AddRecipeIngredients]
	@RecipeID UNIQUEIDENTIFIER,
	@IngredientID UNIQUEIDENTIFIER,
	@Quantity Decimal(10,2),
	@Unit varchar(10)
AS
BEGIN
	DECLARE @RecipeIngredientID UNIQUEIDENTIFIER
	SET @RecipeIngredientID = NEWID()

	-- Vérifier si @Unit est NULL ou une valeur vide ou contient pas une unit valide
	IF @Unit NOT IN ('g', 'kg', 'mg', 'L', 'mL', 'cL', 'c. à soupe', 'c. à café', 'Tasse', 'Verre', 'oz', 'lb', 'Pincée', 'Brin', 'Feuille', 'Tranche', 'Gousse', 'CLO', 'Filet', 'Morceau', 'Rondelle')
	BEGIN
		DECLARE @ErrorMessage NVARCHAR(200) = 'The value of @Unit is not valid.';
		RAISERROR(@ErrorMessage, 16, 1);
		RETURN;
	END

	-- Vérifier si @RecipeID est NULL ou une valeur vide
	IF @RecipeID IS NULL OR @RecipeID = ''
	BEGIN
		RAISERROR('Invalid @RecipeID. Please provide a valid value.', 16, 1);
		RETURN;
	END

	-- Vérifier si @IngredientID est NULL ou une valeur vide
	IF @IngredientID IS NULL OR @IngredientID = ''
	BEGIN
		RAISERROR('Invalid @IngredientID. Please provide a valid value.', 16, 1);
		RETURN;
	END

	-- Vérifier si @Quantity est NULL ou une valeur vide
	IF @Quantity IS NULL OR @Quantity = 0
	BEGIN
		RAISERROR('Invalid @Quantity. Please provide a valid value.', 16, 1);
		RETURN;
	END

	INSERT INTO dbo.RecipeIngredient (RecipeIngredientID,RecipeID,IngredientID,Quantity,Unit,CreatedAt,UpdatedAt)
	VALUES (@RecipeIngredientID,@RecipeID,@IngredientID,@Unit,@Quantity,GETDATE(), GETDATE())


END