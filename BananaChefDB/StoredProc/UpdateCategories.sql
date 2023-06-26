CREATE PROCEDURE [dbo].[UpdateCategories]
	@Name varchar(100),
	@Message varchar(100) OUTPUT,
	@IfExist BIT = 0 OUTPUT,
	@CategoryID UNIQUEIDENTIFIER OUTPUT
AS
	SELECT @param1, @param2
RETURN 0
