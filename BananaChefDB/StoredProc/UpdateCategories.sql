﻿CREATE PROCEDURE UpdateCategories
	@CategoryID UNIQUEIDENTIFIER,
	@Name varchar(100)
AS
BEGIN
	IF @CategoryID IS NULL
		BEGIN
			RAISERROR('Invalid @CategoryID. Please provide a valid value.', 16, 1);
			RETURN;
		END

	UPDATE dbo.Categories
		SET Name = @Name
	WHERE CategoryID=@CategoryID

	PRINT 'Update Category'
END
