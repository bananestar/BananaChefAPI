CREATE PROCEDURE UpdateRecipeCategoryList
	@RecipeID UNIQUEIDENTIFIER,
	@CategoryList varchar(MAX)
AS
BEGIN
	DECLARE @Name varchar(100)
	DECLARE @CategoryID UNIQUEIDENTIFIER
	DECLARE @Message varchar(100)
	DECLARE @IfExist BIT = 0

	-- New Data
	CREATE TABLE #CategoriesNew
    (
    CategoryName varchar(100)
    )

	-- Old Data
	CREATE TABLE #CategoriesOld
	(
    CategoryID UNIQUEIDENTIFIER
	)
	 
    --- Vérifier si @CategoryList contient plusieurs catégories ou une seule catégorie
    IF CHARINDEX(',', @CategoryList) = 0
    BEGIN
        -- Si @CategoryList ne contient qu'une seule catégorie, l'insérer directement dans la table temporaire
        INSERT INTO #Categories (CategoryName) VALUES (@CategoryList)
    END
    ELSE
    BEGIN
        -- Si @CategoryList contient plusieurs catégories, utiliser STRING_SPLIT pour les diviser
        INSERT INTO #CategoriesNew (CategoryName)
        SELECT value
        FROM STRING_SPLIT(@CategoryList, ',')
    END

	INSERT INTO #CategoriesOld (CategoryID)
	SELECT CategoryID
	FROM dbo.RecipeCategories
	WHERE RecipeID = @RecipeID

	WHILE EXISTS(SELECT TOP 1 CategoryName=@Name FROM #CategoriesNew)
		BEGIN
			-- Recherche l'id category
			SELECT CategoryID=@CategoryID FROM dbo.Categories WHERE Name=@Name

			-- Si la category n'existe pas => AddCategories
			IF @CategoryID IS NULL
				BEGIN
					EXEC AddCategories @Name,@Message OUTPUT,@IfExist OUTPUT,@CategoryID OUTPUT
					PRINT @Message
				END

			-- Vérification si cat + recipe existe dans RecipeCategories
			DECLARE @RecipeCategoryID UNIQUEIDENTIFIER
			IF EXISTS(SELECT RecipeCategoryID=@RecipeCategoryID FROM dbo.RecipeCategories WHERE RecipeID = @RecipeID AND CategoryID = @CategoryID)
				BEGIN
					UPDATE dbo.RecipeCategories
						SET UpdatedAt = GETDATE()
					WHERE RecipeCategoryID=@RecipeCategoryID
				END
			ELSE
			-- Cas si il n'existe pas
				BEGIN
					EXEC AddRecipeCategories @RecipeID, @CategoryID
					PRINT 'Add Record RecipeCategories '
				END

			-- Delete Record New Data & Old Data
			DELETE FROM #CategoriesNew WHERE CategoryName = @Name
			DELETE FROM #CategoriesOld WHERE CategoryID = @CategoryID
		END

		-- Cas si il reste du old data
		WHILE EXISTS(SELECT TOP 1 CategoryID=@CategoryID FROM #CategoriesOld)
			BEGIN
				DELETE FROM dbo.RecipeCategories WHERE CategoryID = @CategoryID AND RecipeID = @RecipeID
				DELETE FROM #CategoriesOld WHERE CategoryID=@CategoryID
			END

END
