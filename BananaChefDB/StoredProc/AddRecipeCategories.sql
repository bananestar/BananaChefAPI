CREATE PROCEDURE AddRecipeCategories
	@RecipeID UNIQUEIDENTIFIER,
	@CategoryID UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @RecipeCategoryID UNIQUEIDENTIFIER
	SET @RecipeCategoryID = NEWID()

	INSERT INTO RecipeCategories(RecipeCategoryID,RecipeID,CategoryID,CreatedAt,UpdatedAt)
	VALUES(@RecipeCategoryID,@RecipeID,@CategoryID,GETDATE(), GETDATE())
END

