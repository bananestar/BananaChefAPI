CREATE PROCEDURE [dbo].[UpdateRecipe]
    @RecipeID UNIQUEIDENTIFIER,
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
    @SetpsJson NVARCHAR(MAX),
    @Message varchar(50) OUTPUT,
    @IfExist BIT = 0 OUTPUT
AS
BEGIN
    DECLARE @CategoryName varchar(100)
    DECLARE @Message varchar(100)
    DECLARE @IfExist BIT

    -- Vérification de la valeur de @RecipeID
	IF NOT EXISTS (SELECT 1 FROM Recipe WHERE RecipeID = @RecipeID)
	BEGIN
		-- La valeur de @RecipeID n'existe pas dans la table Recipe
		SET @Message = 'Recipe not found';
		SET @IfExist = 0;
		RETURN;
	END

	-- Autres contrôles pour les paramètres
	IF @Title IS NULL OR @Title = ''
	BEGIN
		SET @Message = 'Title is required';
		SET @IfExist = 0;
		RETURN;
	END

	IF @Description IS NULL OR @Description = ''
	BEGIN
		SET @Message = 'Description is required';
		SET @IfExist = 0;
		RETURN;
	END

	IF @PreparationTime <= 0
	BEGIN
		SET @Message = 'PreparationTime must be greater than zero';
		SET @IfExist = 0;
		RETURN;
	END

    -- Vérification de la valeur de @RecipeID
    IF EXISTS (SELECT 1 FROM Recipe WHERE RecipeID = @RecipeID)
    BEGIN
    -- La valeur de @RecipeID existe dans la table Recipe
    -- Effectuer la mise à jour de l'enregistrement
    UPDATE Recipe
        SET Title = @Title,
            Description = @Description,
            PreparationTime = @PreparationTime,
            CookingTime = @CookingTime,
            Difficulty = @Difficulty,
            Author = @Author,
            ImageUrl = @ImageUrl,
            VideoUrl = @VideoUrl,
            Score = @Score,
            UpdatedAt = GETDATE()
        WHERE RecipeID = @RecipeID;

    
        SET @Message = 'Recipe updated';
        SET @IfExist = 1;
    END
    ELSE
        BEGIN
            SET @Message = 'Recipe not found';
            SET @IfExist = 0;  
        END

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


        END
END
