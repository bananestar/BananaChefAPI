CREATE PROCEDURE ModifyComment
    @commentID UNIQUEIDENTIFIER,
    @userID UNIQUEIDENTIFIER,
    @newCommentText VARCHAR(MAX),
    @isAdmin BIT = 0,
    @message NVARCHAR(100) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @commentUserID UNIQUEIDENTIFIER

    -- Vérifier si le commentaire existe
    IF EXISTS (SELECT 1 FROM Comments WHERE CommentID = @commentID)
    BEGIN
        -- Récupérer l'ID de l'utilisateur ayant commenté le commentaire
        SELECT @commentUserID = UserID
        FROM Comments
        WHERE CommentID = @commentID

        -- Vérifier si l'utilisateur est le propriétaire du commentaire ou s'il est administrateur
        IF (@commentUserID = @userID OR @isAdmin = 1)
        BEGIN
            -- Modifier le texte du commentaire
            UPDATE Comments
            SET CommentText = @newCommentText,
                UpdatedAt = GETDATE()
            WHERE CommentID = @commentID

            SET @message = 'Comment modified successfully'
        END
        ELSE
        BEGIN
            SET @message = 'You are not authorized to modify this comment'
        END
    END
    ELSE
    BEGIN
        SET @message = 'Comment not found'
    END

END
