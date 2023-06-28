CREATE PROCEDURE UpdateSetps
	@StepID UNIQUEIDENTIFIER,
	@RecipeID UNIQUEIDENTIFIER,
	@Description varchar(max),
	@OrderNumber int
AS
BEGIN
	IF @StepID IS NULL
        BEGIN
            RAISERROR('La valeur de @StepID ne peut pas être NULL.', 16, 1);
            RETURN; -- Sortie de la procédure stockée en cas d'erreur
        END

    IF @RecipeID IS NULL
        BEGIN
            RAISERROR('La valeur de @RecipeID ne peut pas être NULL.', 16, 1);
            RETURN; -- Sortie de la procédure stockée en cas d'erreur
        END

    IF @Description = ''
        BEGIN
            RAISERROR('La valeur de @Description ne peut pas être vide.', 16, 1);
            RETURN; -- Sortie de la procédure stockée en cas d'erreur
        END

    IF @OrderNumber <= 0
        BEGIN
            RAISERROR('La valeur de @OrderNumber doit être supérieure à zéro.', 16, 1);
            RETURN; -- Sortie de la procédure stockée en cas d'erreur
        END

    UPDATE dbo.Steps
        SET Description=@Description,
            OrderNumber=@OrderNumber
    WHERE StepID=@StepID

    Print 'Update Record '

END
