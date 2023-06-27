CREATE PROCEDURE [dbo].[UpdateSetpsList]
	@RecipeID UNIQUEIDENTIFIER,
	@SetpsJson NVARCHAR(MAX)
AS
BEGIN
	DECLARE @Description varchar(max)
	DECLARE @OrderNumber int
	DECLARE @StepID UNIQUEIDENTIFIER
	DECLARE @Message varchar(100)
	DECLARE @IfExist BIT = 0

	CREATE TABLE #SetpsNew
	(
	Description varchar(max),
	OrderNumber int
	)

	INSERT INTO #Setps (Description,OrderNumber)
    SELECT [Description],[OrderNumber]
    FROM OPENJSON(@SetpsJson)
    WITH(
        Description varchar(max),
        OrderNumber int
        )

	CREATE TABLE #SetpsOld
	(
	StepID UNIQUEIDENTIFIER
	)

	INSERT INTO #SetpsOld (StepID)
	SELECT StepID
	FROM dbo.Steps
	WHERE RecipeID=@RecipeID

	WHILE EXISTS(SELECT TOP 1 Description = @Description, OrderNumber=@OrderNumber FROM #SetpsNew)
		BEGIN
			IF NOT EXISTS(SELECT StepID=@StepID FROM dbo.Steps WHERE RecipeID=@RecipeID AND OrderNumber=@OrderNumber)
				BEGIN
					EXEC AddSteps @RecipeID,@Description,@OrderNumber,@Message OUTPUT,@IfExist OUTPUT, @StepID OUTPUT
				END
			ELSE
				BEGIN
					UPDATE dbo.Steps
					SET Description=@Description,
						OrderNumber=@OrderNumber,
						UpdatedAt=GETDATE()
					WHERE StepID=@StepID
				END

			DELETE FROM #SetpsNew WHERE @Description=Description AND @OrderNumber=OrderNumber
			DELETE FROM #SetpsOld WHERE @StepID=StepID
		END

	WHILE EXISTS(SELECT TOP 1 StepID=@StepID FROM #SetpsOld)
		BEGIN
			DELETE FROM dbo.Steps WHERE StepID=@StepID
			DELETE FROM #SetpsOld WHERE StepID=@StepID
		END
END
