-- Spécifier la base de données
USE BananaChefDB;

-- Déclaration des variables
DECLARE @counter INT = 1;
DECLARE @username NVARCHAR(30);
DECLARE @email NVARCHAR(255);
DECLARE @pwd NVARCHAR(100);

-- Boucle pour insérer 20 utilisateurs
WHILE @counter <= 20
BEGIN
    -- Génération des valeurs pour chaque utilisateur
    SET @username = 'User' + CAST(@counter AS NVARCHAR(2));
    SET @email = 'user' + CAST(@counter AS NVARCHAR(2)) + '@example.com';
    SET @pwd = 'password' + CAST(@counter AS NVARCHAR(2));

    -- Exécution de la procédure pour enregistrer l'utilisateur
    EXEC [dbo].[RegisterUser] @username, @email, @pwd;

    -- Incrémentation du compteur
    SET @counter = @counter + 1;
END
