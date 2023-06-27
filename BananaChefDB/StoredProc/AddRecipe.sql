CREATE PROCEDURE [dbo].[AddRecipe]
	@Title varchar(100),
    @Description varchar(max),
    @PreparationTime int,
    @CookingTime int,
    @Difficulty varchar(10),
    @Author varchar(50),
    @ImageUrl varchar(500),
    @VideoUrl varchar(500),
    @Score decimal(3,2),
    @CategoryList varchar(MAX),
    @IngredientsJson NVARCHAR(MAX),
    @SetpsJson NVARCHAR(MAX)
AS
BEGIN
    DECLARE @CategoryName varchar(100)
    DECLARE @Message varchar(100)
    DECLARE @IfExist BIT
    DECLARE @TempCategoryID UNIQUEIDENTIFIER
    DECLARE @TempIngredientID UNIQUEIDENTIFIER

    DECLARE @RecipeID UNIQUEIDENTIFIER
    SET @RecipeID = NEWID()

    -- Insert la recette dans la table
    INSERT INTO [dbo].[AddRecipe] (RecipeID,Title,Description,PreparationTime,CookingTime,Difficulty,Author,ImageUrl,VideoUrl,Score,CreatedAt,UpdatedAt)
    VALUES (@RecipeID,@Title,@Description,@PreparationTime,@CookingTime,@Difficulty,@Author,@ImageUrl,@VideoUrl,@Score,GETDATE(), GETDATE())

    -- Créer une table temporaire pour les catégories
    CREATE TABLE #Categories
    (
    CategoryName varchar(100)
    )

    -- Insérer les catégories dans la table temporaire
    INSERT INTO #Categories (CategoryName)
    SELECT value
    FROM STRING_SPLIT(@CategoryList, ',')

    -- Traiter les catégories une par une
    WHILE EXISTS(SELECT TOP 1 CategoryName FROM #Categories)
        BEGIN
            SELECT TOP 1 CategoryName = @CategoryName FROM #Categories

            -- Appeler la procédure AddCategories pour chaque catégorie
            EXEC [dbo].[AddCategories] @CategoryName, @Message OUTPUT, @IfExist OUTPUT, @TempCategoryID OUTPUT

            PRINT @Message

            -- Ajouter l'association entre la recette et la catégorie
            EXEC [dbo].AddRecipeCategories @RecipeID, @TempCategoryID

            -- Supprimer la catégorie traitée de la table temporaire
            DELETE FROM #Categories WHERE CategoryName = @CategoryName
        END

    -- Créer une table temporaire pour les ingrédients
    CREATE TABLE #Ingredients
	(
		Name varchar(50),
		Description varchar(MAX),
		Quantity Decimal(10,2),
		Unit varchar(10)
	)

    -- Insérer les ingrédients dans la table temporaire
    INSERT INTO #Ingredients (Name, Description, Quantity, Unit)
    SELECT [Name], [Description], [Quantity], [Unit]
    FROM OPENJSON(@IngredientsJson)
    WITH (
		Name varchar(50),
		Description varchar(MAX),
		Quantity Decimal(10,2),
		Unit varchar(10)
	)

    -- Traiter les ingrédients un par un
    WHILE EXISTS(SELECT TOP 1 * from #Ingredients)
        BEGIN
            DECLARE @Name varchar(50)
            DECLARE @DescriptionIng varchar(MAX)
            DECLARE @Quantity Decimal(10,2)
            DECLARE @Unit varchar(10)

            SELECT TOP 1 Name=@Name, Description=@DescriptionIng, Quantity=@Quantity, Unit=@Unit from #Ingredients

            -- Appeler la procédure AddIngredients pour chaque ingrédient
            EXEC [dbo].[AddIngredients] @Name, @DescriptionIng, @Message OUTPUT, @IfExist OUTPUT, @TempIngredientID OUTPUT

            PRINT @Message

            -- Ajouter l'association entre la recette et l'ingrédient
            EXEC dbo.AddRecipeIngredients @RecipeID, @TempIngredientID, @Quantity, @Unit

            -- Supprimer l'ingrédient traité de la table temporaire
            DELETE FROM #Ingredients WHERE Name = @Name

        END

    -- Créer une table temporaire pour les étapes
    CREATE TABLE #Setps
    (
        Description varchar(max),
        OrderNumber int,
    )

    -- Insérer les étapes dans la table temporaire
    INSERT INTO #Setps (Description,OrderNumber)
    SELECT [Description],[OrderNumber]
    FROM OPENJSON(@SetpsJson)
    WITH(
        Description varchar(max),
        OrderNumber int
        )

    -- Traiter les étapes une par une
    WHILE EXISTS(SELECT TOP 1 * from #Setps)
        BEGIN
            DECLARE @DescriptionSetps varchar(MAX)
            DECLARE @OrderNumber int
            DECLARE @StepID UNIQUEIDENTIFIER

            SELECT TOP 1 Description=@DescriptionSetps, OrderNumber=@OrderNumber from #Setps

            -- Appeler la procédure AddSteps pour chaque étape
            EXEC dbo.AddSteps @RecipeID,@DescriptionSetps,@OrderNumber,@Message OUTPUT,@IfExist OUTPUT, @StepID OUTPUT

            PRINT @Message

            -- Supprimer l'étape traitée de la table temporaire
            DELETE FROM #Setps WHERE OrderNumber=@OrderNumber
        END

    PRINT 'Recipe '+@Title+' Add to Table'

END
