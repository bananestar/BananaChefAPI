CREATE PROCEDURE [dbo].[AddRecipeCategories]
	@RecipeID UNIQUEIDENTIFIER,
	@CategoryID UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @RecipeCategoryID UNIQUEIDENTIFIER
	SET @RecipeCategoryID = NEWID()

	INSERT INTO [dbo].[RecipeCategories](RecipeCategoryID,RecipeID,CategoryID,CreatedAt,UpdatedAt)
	VALUES(@RecipeCategoryID,@RecipeID,@CategoryID,GETDATE(), GETDATE())
END

