CREATE PROCEDURE [dbo].[DeleteSteps]
	@StepID UNIQUEIDENTIFIER
AS
BEGIN
	IF @StepID IS NULL OR @StepID = ''
		BEGIN
			RAISERROR('Invalid @StepID. Please provide a valid value.', 16, 1);
			RETURN;
		END	

	DELETE FROM dbo.Steps WHERE StepID=@StepID

	PRINT 'RECORD WAS DELETE '
END
