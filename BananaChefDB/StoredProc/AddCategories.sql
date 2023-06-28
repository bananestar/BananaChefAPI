CREATE PROCEDURE AddCategories
	@Name varchar(100),
	@Message varchar(100) OUTPUT,
	@IfExist BIT = 0 OUTPUT,
	@CategoryID UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
	-- Génère un nouvel ID de catégorie
	SET @CategoryID = NEWID()

	-- Vérifie si la catégorie n'existe pas
	IF NOT EXISTS(SELECT * from Categories WHERE Name = @Name)
	BEGIN
		-- Insère la catégorie dans la table Categories
		INSERT INTO Categories (CategoryID, Name)
		VALUES (@CategoryID, @Name)

		-- Définit le message de sortie comme "Category not exist"
		SET @Message = @Name + ' not exist, Add to Category'
	END
	ELSE
	BEGIN
		-- Sélectionne l'ID de la catégorie existante
		SELECT CategoryID = @CategoryID FROM Categories WHERE Name = @Name

		-- Définit le message de sortie comme "Category exist"
		SET @Message = @Name + ' exist'

		-- Définit la variable de sortie @IfExist à 1 pour indiquer que la catégorie existe
		SET @IfExist = 1
	END
END
