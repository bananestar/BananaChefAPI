CREATE PROCEDURE [dbo].[DeleteCategory]
	@CategoryID UNIQUEIDENTIFIER
AS
BEGIN
	IF @CategoryID IS NULL OR @CategoryID = ''
		BEGIN
			RAISERROR('Invalid @CategoryID. Please provide a valid value.', 16, 1);
			RETURN;
		END

	DELETE FROM dbo.RecipeCategories WHERE CategoryID=@CategoryID
	DELETE FROM dbo.Categories WHERE CategoryID=@CategoryID

	PRINT 'RECORD WAS DELETE '
END
