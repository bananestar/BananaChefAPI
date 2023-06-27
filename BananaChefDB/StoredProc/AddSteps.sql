CREATE PROCEDURE [dbo].[AddSteps]
	@RecipeID UNIQUEIDENTIFIER,
	@Description varchar(max),
	@OrderNumber int,
	@Message varchar(100) OUTPUT,
	@IfExist BIT = 0 OUTPUT,
	@StepID UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
	SET @StepID = NEWID()

	-- Vérifier si @RecipeID est NULL ou une valeur vide
	IF @RecipeID IS NULL OR @RecipeID = ''
	BEGIN
		RAISERROR('Invalid @RecipeID. Please provide a valid value.', 16, 1);
		RETURN;
	END

	-- Vérifier si @Description est NULL ou une valeur vide
	IF @Description IS NULL OR @Description = ''
	BEGIN
		RAISERROR('Invalid @Description. Please provide a valid value.', 16, 1);
		RETURN;
	END

	-- Vérifier si @OrderNumber est NULL ou une valeur vide
	IF @OrderNumber IS NULL
	BEGIN
		RAISERROR('Invalid @OrderNumber. Please provide a valid value.', 16, 1);
		RETURN;
	END

	-- Vérifier si @OrderNumber avec un WHERE de RecipedID si existe deja 
	IF EXISTS(SELECT * FROM dbo.Steps WHERE RecipeID = @RecipeID AND OrderNumber = OrderNumber)
	BEGIN
		SET @IfExist = 1;
		RAISERROR('Invalid @OrderNumber. Please provide a valid value.', 16, 1);
		RETURN;
	END

	INSERT INTO dbo.Steps (StepID,RecipeID,Description,OrderNumber,CreatedAt,UpdatedAt)
	VALUES(@StepID,@RecipeID,@Description,@OrderNumber,GETDATE(), GETDATE())

	SET @Message = 'Add Setp '+@OrderNumber;

END
