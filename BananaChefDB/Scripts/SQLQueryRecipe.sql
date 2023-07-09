USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Cookies au Brocoli et au Chocolat',
	@Description = N'Une recette surprenante de cookies alliant la douceur du chocolat et les bienfaits du brocoli.',
	@PreparationTime = 20,
	@CookingTime = 15,
	@Difficulty = N'Easy',
	@Author = N'Jeanne Martin',
	@ImageUrl = N'https://firebasestorage.googleapis.com/v0/b/quizermania-f7be1.appspot.com/o/sssss.PNG?alt=media&token=8b669a9d-d04c-41a9-a3c4-540fcd24b1c5',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.2,
	@CategoryList = N'Desserts',
	@IngredientsJson = N'[	{"Name":"Brocoli","Description":"","Quantity":1,"Unit":"Unitée"},
							{"Name":"Chocolat noir","Description":"haché","Quantity":200,"Unit":"g"},
							{"Name":"Farine","Description":"","Quantity":150,"Unit":"g"},
							{"Name":"Beurre ramolli","Description":"","Quantity":100,"Unit":"g"},
							{"Name":"Sucre","Description":"","Quantity":100,"Unit":"g"},
							{"Name":"Œuf","Description":"","Quantity":1,"Unit":"Unitée"},
							{"Name":"Extrait de vanille","Description":"","Quantity":1,"Unit":"c. à café"},
							{"Name":"Levure chimique","Description":"","Quantity":0.5,"Unit":"c. à café"},
							{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pincée"}]',
	@SetpsJson = N'[{"Description":"Préchauffez le four à 180°C. Tapissez une plaque à pâtisserie de papier sulfurisé.","OrderNumber":1},{"Description":"Faites cuire le brocoli à la vapeur jusqu''à ce qu''il soit tendre. Égouttez-le et écrasez-le avec une fourchette pour obtenir une purée de brocoli.","OrderNumber":2},{"Description":"Dans un grand bol, mélangez le beurre ramolli et le sucre jusqu''à obtenir une consistance crémeuse. Ajoutez l''œuf et l''extrait de vanille, puis mélangez bien.","OrderNumber":3},{"Description":"Ajoutez la purée de brocoli dans le mélange de beurre et de sucre, et mélangez jusqu''à ce que les ingrédients soient bien incorporés.","OrderNumber":4},{"Description":"Dans un autre bol, mélangez la farine, la levure chimique et le sel. Ajoutez ce mélange sec à la pâte à base de brocoli, en remuant jusqu''à ce que tout soit bien mélangé.","OrderNumber":5},{"Description":"Ajoutez le chocolat haché à la pâte et mélangez pour répartir les morceaux de chocolat de manière homogène.","OrderNumber":6},{"Description":"Déposez des cuillerées de pâte sur la plaque à pâtisserie préparée, en les espaçant légèrement.","OrderNumber":7},{"Description":"Enfournez les cookies au brocoli et au chocolat pendant environ 12 à 15 minutes, ou jusqu''à ce qu''ils soient dorés.","OrderNumber":8},{"Description":"Laissez les cookies refroidir sur la plaque pendant quelques minutes, puis transférez-les sur une grille de refroidissement pour qu''ils refroidissent complètement.","OrderNumber":9}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRecipe]
		@Title = N'Pâtes à la Carbonara',
		@Description = N'Voici une recette classique de pâtes à la carbonara, crémeuses et savoureuses.',
		@PreparationTime = 20,
		@CookingTime = 10,
		@Difficulty = N'Easy',
		@Author = N'Jeanne Martin',
		@ImageUrl = N'https://img.cuisineaz.com/660x660/2016/07/29/i113471-pates-a-la-carbonara.jpg',
		@VideoUrl = N'https://exemple.com/video',
		@Score = 4.5,
		@CategoryList = N'Plats principaux',
		@IngredientsJson = N'[	{"Name":"Spaghetti","Description":"","Quantity":300,"Unit":"g"},
								{"Name":"Pancetta ou lardons","Description":"","Quantity":150,"Unit":"g"},
								{"Name":"Œufs","Description":"","Quantity":3,"Unit":"Unitée"},
								{"Name":"Parmesan râpé","Description":"","Quantity":75,"Unit":"g"},
								{"Name":"Poivre noir fraîchement moulu","Description":"","Quantity":1,"Unit":"Pincée"},
								{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pincée"},
								{"Name":"Persil frais","Description":"","Quantity":1,"Unit":"Unitée"}]',
		@SetpsJson = N'[{"Description":"Faites cuire les pâtes dans une grande casserole d''eau bouillante salée selon les instructions sur l''emballage, jusqu''à ce qu''elles soient al dente. Égouttez-les en réservant une petite quantité d''eau de cuisson des pâtes.","OrderNumber":1},
						{"Description":"Pendant ce temps, faites chauffer une poêle à feu moyen. Ajoutez la pancetta ou les lardons et faites-les revenir jusqu''à ce qu''ils soient dorés et croustillants. Retirez-les de la poêle et égouttez-les sur du papier absorbant pour enlever l''excès de graisse.","OrderNumber":2},
						{"Description":"Dans un bol moyen, battez les œufs avec le parmesan râpé. Ajoutez une généreuse quantité de poivre noir fraîchement moulu. Vous n''aurez pas besoin d''ajouter de sel, car la pancetta et le parmesan sont déjà salés.","OrderNumber":3},
						{"Description":"Ajoutez les pâtes cuites et égouttées dans la poêle où vous avez fait cuire la pancetta. Mélangez les pâtes avec la pancetta pour bien les enrober de graisse.","OrderNumber":4},
						{"Description":"Retirez la poêle du feu et ajoutez le mélange d''œufs et de parmesan. Mélangez rapidement et vigoureusement pour que la chaleur des pâtes cuise légèrement les œufs sans les coaguler.","OrderNumber":5},
						{"Description":"Si la sauce est trop épaisse, ajoutez un peu d''eau de cuisson des pâtes réservée, une cuillère à soupe à la fois, en remuant jusqu''à ce que la consistance soit crémeuse et homogène.","OrderNumber":6},
						{"Description":"Servez immédiatement les pâtes à la carbonara dans des assiettes chaudes. Garnissez-les de pancetta croustillante supplémentaire et de persil frais haché, si vous le souhaitez.","OrderNumber":7}]'

SELECT	'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRecipe]
		@Title = N'Pizza aux Anchois',
		@Description = N'Voici une délicieuse recette de pizza aux anchois, parfaite pour les amateurs de saveurs salées.',
		@PreparationTime = 60,
		@CookingTime = 15,
		@Difficulty = N'Medium',
		@Author = N'Jeanne Martin',
		@ImageUrl = N'https://www.galbani.fr/wp-content/uploads/2017/07/pizza_blanche.jpg',
		@VideoUrl = N'https://exemple.com/video',
		@Score = 4.8,
		@CategoryList = N'Plats principaux',
		@IngredientsJson = N'[	{"Name":"Farine","Description":"","Quantity":300,"Unit":"g"},
								{"Name":"Levure sèche active","Description":"","Quantity":1,"Unit":"c. à café"},
								{"Name":"Sucre","Description":"","Quantity":1,"Unit":"c. à café"},
								{"Name":"Sel","Description":"","Quantity":0.5,"Unit":"c. à café"},
								{"Name":"Eau tiède","Description":"","Quantity":180,"Unit":"mL"},
								{"Name":"Huile d''olive","Description":"","Quantity":2,"Unit":"c. à soupe"},
								{"Name":"Sauce tomate","Description":"","Quantity":1,"Unit":"Unitée"},
								{"Name":"Mozzarella râpée","Description":"","Quantity":1,"Unit":"Unitée"},
								{"Name":"Anchois à l''huile d''olive","Description":"Égouttés","Quantity":1,"Unit":"Unitée"},
								{"Name":"Olives noires dénoyautées","Description":"","Quantity":1,"Unit":"Unitée"},
								{"Name":"Origan séché","Description":"","Quantity":1,"Unit":"Unitée"},
								{"Name":"Huile d''olive","Description":"Pour arroser (facultatif)","Quantity":1,"Unit":"Unitée"}]',
		@SetpsJson = N'[{"Description":"Préparez d''abord la pâte à pizza. Dans un grand saladier, mélangez la farine, la levure, le sucre et le sel. Faites un puits au centre et versez-y l''eau tiède et l''huile d''olive.","OrderNumber":1},
						{"Description":"Mélangez doucement les ingrédients jusqu''à ce qu''ils commencent à se lier, puis pétrissez la pâte pendant environ 5 minutes jusqu''à ce qu''elle soit souple et élastique.","OrderNumber":2},
						{"Description":"Formez une boule avec la pâte, couvrez le saladier d''un torchon propre et laissez reposer dans un endroit chaud pendant environ 1 heure, ou jusqu''à ce que la pâte double de volume.","OrderNumber":3},
						{"Description":"Préchauffez votre four à la température maximale (généralement autour de 220°C).","OrderNumber":4},
						{"Description":"Une fois que la pâte a levé, déposez-la sur une surface légèrement farinée et étalez-la en un cercle ou un rectangle, selon vos préférences.","OrderNumber":5},
						{"Description":"Transférez la pâte étalée sur une plaque à pizza ou une plaque de cuisson recouverte de papier sulfurisé.","OrderNumber":6},
						{"Description":"Étalez généreusement la sauce tomate sur la pâte, en laissant une bordure libre d''environ 1 cm.","OrderNumber":7},
						{"Description":"Parsemez la mozzarella râpée sur la sauce tomate.","OrderNumber":8},
						{"Description":"Disposez les anchois et les olives noires sur la pizza.","OrderNumber":9},
						{"Description":"Saupoudrez d''origan séché selon votre goût.","OrderNumber":10},
						{"Description":"Enfournez la pizza dans le four préchauffé et faites-la cuire pendant environ 12 à 15 minutes, ou jusqu''à ce que la pâte soit dorée et croustillante.","OrderNumber":11},
						{"Description":"Si désiré, juste après la cuisson, arrosez légèrement la pizza avec un filet d''huile d''olive pour lui donner un éclat supplémentaire.","OrderNumber":12},
						{"Description":"Sortez la pizza du four, laissez-la refroidir légèrement, puis coupez-la en parts et servez-la chaud.","OrderNumber":13}]'

SELECT	'Return Value' = @return_value

GO

--(Unit IN ('g', 'kg', 'mg', 'L', 'mL', 'cL', 'c. à soupe', 'c. à café', 'Tasse', 'Verre', 'oz', 'lb', 'Pincée', 'Brin', 'Feuille', 'Tranche', 'Gousse', 'CLO', 'Filet', 'Morceau', 'Rondelle', 'Unitée', 'Sachet'))

USE [BananaChefDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRecipe]
		@Title = N'Bœuf Bourguignon',
		@Description = N'Voici une recette classique de bœuf bourguignon, un plat rustique et savoureux.',
		@PreparationTime = 30,
		@CookingTime = 180,
		@Difficulty = N'Medium',
		@Author = N'Jean Dupont',
		@ImageUrl = N'https://img-3.journaldesfemmes.fr/3q1hdTGIoj2XznsQWzr9V0Cg3KY=/800x600/smart/d6db2baa728b47f8adbf30b99a957dc0/recipe-jdf/10002051.jpg',
		@VideoUrl = N'https://exemple.com/video',
		@Score = 4.9,
		@CategoryList = N'Plats principaux',
		@IngredientsJson = N'[	{"Name":"Viande de bœuf","Description":"Gîte, paleron ou joue de bœuf, coupée en cubes","Quantity":1200,"Unit":"g"},
								{"Name":"Lardons fumés","Description":"","Quantity":200,"Unit":"g"},
								{"Name":"Champignons de Paris","Description":"Coupés en quartiers","Quantity":250,"Unit":"g"},
								{"Name":"Oignons","Description":"Émincés","Quantity":2,"Unit":"Unitée"},
								{"Name":"Carottes","Description":"Coupées en rondelles","Quantity":2,"Unit":"Unitée"},
								{"Name":"Ail","Description":"Émincé","Quantity":3,"Unit":"Gousse"},
								{"Name":"Vin rouge","Description":"De préférence bourgogne","Quantity":750,"Unit":"mL"},
								{"Name":"Bouillon de bœuf","Description":"","Quantity":500,"Unit":"mL"},
								{"Name":"Farine","Description":"","Quantity":2,"Unit":"c. à soupe"},
								{"Name":"Huile d''olive","Description":"","Quantity":2,"Unit":"c. à soupe"},
								{"Name":"Concentré de tomate","Description":"","Quantity":2,"Unit":"c. à soupe"},
								{"Name":"Feuilles de laurier","Description":"","Quantity":2,"Unit":"Feuille"},
								{"Name":"Branches de thym","Description":"","Quantity":4,"Unit":"Unitée"},
								{"Name":"Sel","Description":"","Quantity":1,"Unit":"Unitée"},
								{"Name":"Poivre","Description":"","Quantity":1,"Unit":"Unitée"},
								{"Name":"Persil frais","Description":"Pour la garniture","Quantity":1,"Unit":"Unitée"}]',
		@SetpsJson = N'[{"Description":"Dans une cocotte ou une grande casserole, faites chauffer l''huile d''olive à feu moyen. Ajoutez les lardons et faites-les revenir jusqu''à ce qu''ils soient dorés. Retirez-les de la cocotte et réservez-les.","OrderNumber":1},
						{"Description":"Ajoutez les morceaux de bœuf dans la cocotte et faites-les dorer de tous les côtés. Retirez-les de la cocotte et réservez-les avec les lardons.","OrderNumber":2},
						{"Description":"Dans la même cocotte, ajoutez les oignons, les carottes et l''ail. Faites-les revenir pendant quelques minutes jusqu''à ce qu''ils soient légèrement dorés.","OrderNumber":3},
						{"Description":"Saupoudrez la farine sur les légumes et remuez bien pour les enrober. Ajoutez le concentré de tomate et mélangez.","OrderNumber":4},
						{"Description":"Versez le vin rouge dans la cocotte et portez à ébullition. Laissez mijoter pendant quelques minutes pour réduire légèrement le vin.","OrderNumber":5},
						{"Description":"Ajoutez le bouillon de bœuf, les feuilles de laurier et les branches de thym. Remettez les lardons et les morceaux de bœuf dans la cocotte. Assaisonnez avec du sel et du poivre selon votre goût. Veillez à ce que la viande soit bien immergée dans le liquide. Si nécessaire, ajoutez un peu d''eau ou de bouillon.","OrderNumber":6},{"Description":"Couvrez la cocotte et laissez mijoter à feu doux pendant environ 2 à 3 heures, ou jusqu''à ce que la viande soit tendre et se défasse facilement.","OrderNumber":7},{"Description":"Pendant ce temps, faites revenir les champignons dans une poêle avec un peu d''huile d''olive jusqu''à ce qu''ils soient dorés. Réservez-les.","OrderNumber":8},{"Description":"Une fois que la viande est cuite, ajoutez les champignons dans la cocotte et laissez mijoter encore quelques minutes.","OrderNumber":9},{"Description":"Retirez les feuilles de laurier et les branches de thym de la cocotte. Goûtez et ajustez l''assaisonnement si nécessaire.","OrderNumber":10}]'

SELECT	'Return Value' = @return_value

GO

--(Unit IN ('g', 'kg', 'mg', 'L', 'mL', 'cL', 'c. à soupe', 'c. à café', 'Tasse', 'Verre', 'oz', 'lb', 'Pincée', 'Brin', 'Feuille', 'Tranche', 'Gousse', 'CLO', 'Filet', 'Morceau', 'Rondelle', 'Unitée', 'Sachet'))

USE [BananaChefDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRecipe]
		@Title = N'Gâteau au chocolat',
		@Description = N'Voici une recette simple et délicieuse pour un gâteau au chocolat.',
		@PreparationTime = 20,
		@CookingTime = 30,
		@Difficulty = N'Easy',
		@Author = N'John Doe',
		@ImageUrl = N'https://www.ptitchef.com/imgupl/recipe/gateau-au-chocolat-tout-simple--450953p697432.jpg',
		@VideoUrl = N'https://exemple.com/video',
		@Score = 4.8,
		@CategoryList = N'Desserts',
		@IngredientsJson = N'[	{"Name":"Chocolat noir","Description":"","Quantity":200,"Unit":"g"},
								{"Name":"Beurre","Description":"","Quantity":200,"Unit":"g"},
								{"Name":"Sucre","Description":"","Quantity":200,"Unit":"g"},
								{"Name":"Œufs","Description":"","Quantity":4,"Unit":"Unitée"},
								{"Name":"Farine","Description":"","Quantity":150,"Unit":"g"},
								{"Name":"Levure chimique","Description":"","Quantity":1,"Unit":"c. à café"},
								{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pincée"},
								{"Name":"Sucre glace","Description":"Pour la décoration","Quantity":1,"Unit":"Unitée"}]',
		@SetpsJson = N'[{"Description":"Préchauffez votre four à 180°C (thermostat 6). Beurrez et farinez un moule à gâteau.","OrderNumber":1},
						{"Description":"Cassez le chocolat en morceaux et faites-le fondre au bain-marie ou au micro-ondes. Remuez bien jusqu''à obtenir une consistance lisse.","OrderNumber":2},
						{"Description":"Dans un saladier, battez le beurre ramolli et le sucre jusqu''à obtenir une texture crémeuse. Ajoutez les œufs un par un en mélangeant bien entre chaque ajout.","OrderNumber":3},
						{"Description":"Incorporez ensuite le chocolat fondu à la préparation et mélangez jusqu''à obtenir une pâte homogène.","OrderNumber":4},
						{"Description":"Dans un autre récipient, mélangez la farine, la levure chimique et le sel. Versez ce mélange petit à petit dans la préparation au chocolat, en remuant délicatement pour éviter les grumeaux.","OrderNumber":5},
						{"Description":"Versez la pâte dans le moule préparé et lissez la surface avec une spatule.","OrderNumber":6},
						{"Description":"Enfournez le gâteau pendant environ 25 à 30 minutes, ou jusqu''à ce qu''un couteau inséré au centre en ressorte propre.","OrderNumber":7},
						{"Description":"Laissez le gâteau refroidir dans le moule pendant quelques minutes, puis démoulez-le sur une grille et laissez-le refroidir complètement.","OrderNumber":8},
						{"Description":"Avant de servir, vous pouvez saupoudrer le gâteau de sucre glace pour une touche décorative.","OrderNumber":9}]'

SELECT	'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRecipe]
		@Title = N'Tarte aux framboises',
		@Description = N'Voici une délicieuse recette de tarte aux framboises.',
		@PreparationTime = 30,
		@CookingTime = 15,
		@Difficulty = N'Easy',
		@Author = N'Jane Doe',
		@ImageUrl = N'https://cdn.lacuisinedannie.com/images/374.jpg',
		@VideoUrl = N'https://exemple.com/video',
		@Score = 4.7,
		@CategoryList = N'Desserts',
		@IngredientsJson = N'[	{"Name":"Farine","Description":"","Quantity":200,"Unit":"g"},
								{"Name":"Beurre","Description":"Froid, coupé en petits morceaux","Quantity":100,"Unit":"g"},
								{"Name":"Sucre","Description":"","Quantity":2,"Unit":"c. à soupe"},
								{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pincée"},
								{"Name":"Œuf","Description":"","Quantity":1,"Unit":"Unitée"},
								{"Name":"Framboises","Description":"","Quantity":500,"Unit":"g"},
								{"Name":"Confiture de framboises","Description":"","Quantity":4,"Unit":"c. à soupe"},
								{"Name":"Sucre glace","Description":"Pour saupoudrer, facultatif","Quantity":1,"Unit":"Unitée"}]',
		@SetpsJson = N'[{"Description":"Préparez d''abord la pâte. Dans un saladier, mélangez la farine, le sucre et le sel. Ajoutez le beurre froid et travaillez rapidement du bout des doigts jusqu''à obtenir une consistance sablée.","OrderNumber":1},
						{"Description":"Ajoutez l''œuf battu à la pâte et mélangez jusqu''à ce qu''elle forme une boule. Enveloppez la pâte dans du film alimentaire et placez-la au réfrigérateur pendant environ 30 minutes.","OrderNumber":2},
						{"Description":"Préchauffez votre four à 180°C (thermostat 6). Sortez la pâte du réfrigérateur et étalez-la sur une surface légèrement farinée jusqu''à obtenir un cercle d''environ 30 cm de diamètre.","OrderNumber":3},
						{"Description":"Transférez la pâte dans un moule à tarte préalablement beurré et piquez le fond à l''aide d''une fourchette. Enfournez la pâte pendant environ 15 minutes, ou jusqu''à ce qu''elle soit légèrement dorée. Laissez-la refroidir complètement.","OrderNumber":4},
						{"Description":"Pendant ce temps, préparez la garniture. Lavez les framboises et égouttez-les délicatement. Réservez quelques framboises pour la décoration.","OrderNumber":5},
						{"Description":"Dans une casserole à feu doux, faites chauffer la confiture de framboises jusqu''à ce qu''elle soit liquide. Retirez du feu et laissez refroidir légèrement.","OrderNumber":6},
						{"Description":"Étalez la confiture de framboises sur le fond de tarte refroidi.","OrderNumber":7},
						{"Description":"Disposez les framboises fraîches sur la confiture, en les enfonçant légèrement pour qu''elles adhèrent à la confiture.","OrderNumber":8},
						{"Description":"Réfrigérez la tarte pendant au moins une heure pour permettre à la garniture de prendre.","OrderNumber":9},
						{"Description":"Avant de servir, vous pouvez saupoudrer la tarte de sucre glace pour une touche décorative. Vous pouvez également ajouter les framboises réservées sur le dessus.","OrderNumber":10}]'

SELECT	'Return Value' = @return_value

GO


USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Gratin Dauphinois au Fromage à Raclette',
	@Description = N'Un délicieux gratin dauphinois revisité avec du fromage à raclette fondant.',
	@PreparationTime = 30,
	@CookingTime = 75,
	@Difficulty = N'Medium',
	@Author = N'Jeanne Martin',
	@ImageUrl = N'https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Ffac.2F2019.2F12.2F17.2Fad01b852-7525-4fa5-a5c1-fcf41ab7d34f.2Ejpeg/410x230/quality/80/crop-from/center/gratin-dauphinois-fromage-blanc.jpeg',
	@VideoUrl = N'https://example.com/video',
	@Score = 4.5,
	@CategoryList = N'Plats principaux',
	@IngredientsJson = N'[	{"Name":"Pommes de terre à chair ferme","Description":"","Quantity":1.5,"Unit":"kg"},
							{"Name":"Fromage à raclette","Description":"","Quantity":200,"Unit":"g"},
							{"Name":"Crème liquide","Description":"","Quantity":500,"Unit":"mL"},
							{"Name":"Gousses d''ail","Description":"","Quantity":2,"Unit":"Unitée"},
							{"Name":"Beurre","Description":"","Quantity":30,"Unit":"g"},
							{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pincée"},
							{"Name":"Poivre","Description":"","Quantity":1,"Unit":"Pincée"},
							{"Name":"Noix de muscade râpée","Description":"facultatif","Quantity":1,"Unit":"Pincée"}]',
	@SetpsJson = N'[{"Description":"Préchauffez votre four à 180°C (thermostat 6).","OrderNumber":1},{"Description":"Épluchez les pommes de terre et lavez-les soigneusement. Coupez-les en tranches fines d''environ 2 à 3 mm d''épaisseur.","OrderNumber":2},{"Description":"Frottez un plat à gratin avec les gousses d''ail pelées. Beurrez généreusement le plat pour éviter que les pommes de terre n''accrochent.","OrderNumber":3},{"Description":"Disposez une première couche de tranches de pommes de terre dans le plat. Assaisonnez avec du sel, du poivre et un peu de noix de muscade râpée, si vous le souhaitez.","OrderNumber":4},{"Description":"Répétez l''opération en superposant les couches de pommes de terre, en assaisonnant chaque couche jusqu''à épuisement des ingrédients.","OrderNumber":5},{"Description":"Versez la crème liquide sur les pommes de terre jusqu''à ce qu''elle atteigne presque le niveau des pommes de terre. Ajoutez un peu plus de crème si nécessaire.","OrderNumber":6},{"Description":"Coupez le fromage à raclette en tranches fines et disposez-les sur le dessus du gratin.","OrderNumber":7},{"Description":"Couvrez le plat à gratin d''une feuille de papier aluminium et placez-le au four préchauffé. Faites cuire pendant environ 45 minutes.","OrderNumber":8},{"Description":"Retirez le papier aluminium et poursuivez la cuisson pendant environ 20 à 30 minutes supplémentaires, ou jusqu''à ce que le dessus soit doré et que les pommes de terre soient tendres.","OrderNumber":9},{"Description":"Laissez reposer le gratin pendant quelques minutes avant de le servir, cela permettra aux saveurs de se mélanger et à la crème de se raffermir légèrement.","OrderNumber":10}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Aumônières Croustillantes au Jambon et aux Poireaux',
	@Description = N'Des aumônières délicieusement croustillantes, garnies d''un mélange savoureux de jambon et de poireaux.',
	@PreparationTime = 20,
	@CookingTime = 20,
	@Difficulty = N'Easy',
	@Author = N'Sophie Dupont',
	@ImageUrl = N'https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/recettes-de-cuisine/aumonieres-de-poireaux-2033320/11023933-11-fre-FR/Aumonieres-de-poireaux.jpg',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.2,
	@CategoryList = N'Plats principaux, Entrées',
	@IngredientsJson = N'[	{"Name":"Feuilles de brick","Description":"","Quantity":4,"Unit":"Feuille"},
							{"Name":"Jambon cuit","Description":"","Quantity":200,"Unit":"g"},
							{"Name":"Poireaux","Description":"lavés et émincés","Quantity":2,"Unit":"Unitée"},
							{"Name":"Oignon","Description":"émincé","Quantity":1,"Unit":"Unitée"},
							{"Name":"Fromage râpé","Description":"","Quantity":100,"Unit":"g"},
							{"Name":"Huile d''olive","Description":"","Quantity":2,"Unit":"c. à soupe"},
							{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pincée"},
							{"Name":"Poivre","Description":"","Quantity":1,"Unit":"Pincée"},
							{"Name":"Beurre fondu","Description":"","Quantity":1,"Unit":"c. à soupe"}]',
	@SetpsJson = N'[{"Description":"Préchauffez votre four à 180°C (thermostat 6) et préparez une plaque de cuisson recouverte de papier sulfurisé.","OrderNumber":1},{"Description":"Dans une poêle, faites chauffer l''huile d''olive à feu moyen. Ajoutez l''oignon émincé et faites-le revenir pendant quelques minutes jusqu''à ce qu''il soit légèrement doré.","OrderNumber":2},{"Description":"Ajoutez les poireaux émincés dans la poêle et faites-les cuire pendant environ 5 minutes, jusqu''à ce qu''ils soient tendres. Assaisonnez avec du sel et du poivre selon votre goût. Retirez du feu et laissez refroidir légèrement.","OrderNumber":3},{"Description":"Dans un bol, mélangez les dés de jambon, les poireaux sautés et le fromage râpé. Assurez-vous que les ingrédients soient bien mélangés.","OrderNumber":4},{"Description":"Prenez une feuille de brick et badigeonnez-la légèrement de beurre fondu à l''aide d''un pinceau de cuisine. Placez une portion du mélange au centre de la feuille de brick.","OrderNumber":5},{"Description":"Repliez les côtés de la feuille de brick pour former une aumônière, en veillant à bien sceller les bords. Répétez l''opération avec les autres feuilles de brick et le reste du mélange.","OrderNumber":6},{"Description":"Disposez les aumônières sur la plaque de cuisson préparée. Badigeonnez-les légèrement de beurre fondu pour qu''elles deviennent bien croustillantes à la cuisson.","OrderNumber":7},{"Description":"Enfournez les aumônières dans le four préchauffé et faites-les cuire pendant environ 15 à 20 minutes, ou jusqu''à ce qu''elles soient dorées et croustillantes.","OrderNumber":8},{"Description":"Retirez les aumônières du four et laissez-les refroidir légèrement avant de les servir. Elles seront chaudes à l''intérieur, alors faites attention en les ouvrant.","OrderNumber":9}]'

SELECT 'Return Value' = @return_value

GO


DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Carpaccio/Tartare de Thon Rouge',
	@Description = N'Une délicieuse recette de carpaccio/tartare de thon rouge frais, mariné dans une vinaigrette citronnée et agrémenté d''échalotes et de câpres.',
	@PreparationTime = 30,
	@CookingTime = 0,
	@Difficulty = N'Easy',
	@Author = N'Marie Dubois',
	@ImageUrl = N'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/3966CCE7-975A-4DC9-821E-123CBA143B74/Derivates/F5073AC1-D189-4D49-8784-99EEC5DBA4FD.jpg',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.5,
	@CategoryList = N'Entrées, Poissons',
	@IngredientsJson = N'[	{"Name":"Filet de thon rouge frais","Description":"très frais","Quantity":400,"Unit":"g"},
							{"Name":"Jus de citron","Description":"de 2 citrons","Quantity":2,"Unit":"Unitée"},
							{"Name":"Huile d''olive extra vierge","Description":"","Quantity":2,"Unit":"c. à soupe"},
							{"Name":"Sauce soja","Description":"","Quantity":1,"Unit":"c. à soupe"},
							{"Name":"Sauce pimentée","Description":"facultatif, selon votre goût","Quantity":1,"Unit":"c. à soupe"},
							{"Name":"Échalotes","Description":"finement hachées","Quantity":2,"Unit":"Unitée"},
							{"Name":"Câpres","Description":"égouttées","Quantity":2,"Unit":"c. à soupe"},
							{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pincée"},
							{"Name":"Poivre","Description":"","Quantity":1,"Unit":"Pincée"},
							{"Name":"Feuilles de coriandre ou de persil frais","Description":"pour la garniture","Quantity":1,"Unit":"Feuille"}]',
	@SetpsJson = N'[{"Description":"Placez le filet de thon au congélateur pendant environ 30 minutes. Cela facilitera la découpe en tranches fines et régulières.","OrderNumber":1},{"Description":"Pendant ce temps, préparez la marinade en mélangeant le jus de citron, l''huile d''olive, la sauce soja et la sauce pimentée dans un bol. Réservez.","OrderNumber":2},{"Description":"Sortez le thon du congélateur et tranchez-le en tranches très fines à l''aide d''un couteau bien aiguisé. Placez les tranches dans un plat peu profond.","OrderNumber":3},{"Description":"Versez la marinade sur le thon, en vous assurant que toutes les tranches sont bien enrobées. Ajoutez les échalotes hachées et les câpres. Mélangez délicatement.","OrderNumber":4},{"Description":"Couvrez le plat de thon et placez-le au réfrigérateur pendant au moins 30 minutes, afin que les saveurs se mélangent et que le thon mariné légèrement.","OrderNumber":5},{"Description":"Juste avant de servir, goûtez le carpaccio/tartare de thon et ajustez l''assaisonnement avec du sel et du poivre selon votre goût.","OrderNumber":6},{"Description":"Disposez les tranches de thon sur des assiettes individuelles. Arrosez-les de marinade supplémentaire si désiré.","OrderNumber":7},{"Description":"Garnissez le carpaccio/tartare de thon de quelques feuilles de coriandre ou de persil frais.","OrderNumber":8}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Carrés aux Dattes Moelleux',
	@Description = N'Délicieux carrés aux dattes moelleux avec une base croquante et une garniture sucrée aux dattes.',
	@PreparationTime = 20,
	@CookingTime = 30,
	@Difficulty = N'Easy',
	@Author = N'Marie Dubois',
	@ImageUrl = N'https://m1.zeste.ca/serdy-m-dia-inc/image/upload/f_auto/fl_lossy/q_auto:eco/x_0,y_269,w_4496,h_2529,c_crop/w_1200,h_630,c_fill/v1548773502/foodlavie/prod/recettes/carres-aux-dattes-b75c3f4f',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.8,
	@CategoryList = N'Desserts',
	@IngredientsJson = N'[	{"Name":"Farine","Description":"","Quantity":200,"Unit":"g"},
							{"Name":"Beurre mou","Description":"","Quantity":100,"Unit":"g"},
							{"Name":"Sucre","Description":"","Quantity":50,"Unit":"g"},
							{"Name":"Pincée de sel","Description":"","Quantity":1,"Unit":"Pincée"},
							{"Name":"Dattes dénoyautées","Description":"coupées en petits morceaux","Quantity":300,"Unit":"g"},
							{"Name":"Eau","Description":"","Quantity":100,"Unit":"mL"},
							{"Name":"Sucre","Description":"","Quantity":50,"Unit":"g"},
							{"Name":"Jus de citron","Description":"1 cuillère à soupe","Quantity":1,"Unit":"c. à soupe"}]',
	@SetpsJson = N'[{"Description":"Préchauffez votre four à 180°C (thermostat 6). Beurrez un moule carré ou rectangulaire de taille moyenne.","OrderNumber":1},{"Description":"Préparez la base en mélangeant la farine, le beurre mou, le sucre et le sel dans un saladier. Utilisez vos mains pour bien mélanger les ingrédients jusqu''à obtenir une texture sableuse.","OrderNumber":2},{"Description":"Étalez la moitié de la pâte à la base du moule préparé. Appuyez fermement pour obtenir une couche uniforme et compacte.","OrderNumber":3},{"Description":"Dans une casserole, combinez les dattes coupées, l''eau, le sucre et le jus de citron. Faites chauffer à feu moyen et laissez mijoter pendant environ 10 minutes, en remuant de temps en temps, jusqu''à ce que les dattes soient bien ramollies et que le mélange ait épaissi.","OrderNumber":4},{"Description":"Étalez la garniture aux dattes sur la base de pâte dans le moule, en veillant à ce qu''elle soit uniforme.","OrderNumber":5},{"Description":"Émiettez le reste de la pâte sur le dessus de la garniture aux dattes, en créant une couche croustillante.","OrderNumber":6},{"Description":"Enfournez le moule dans le four préchauffé et faites cuire pendant environ 25 à 30 minutes, ou jusqu''à ce que le dessus soit doré.","OrderNumber":7},{"Description":"Retirez le moule du four et laissez-le refroidir complètement avant de couper les carrés aux dattes en portions.","OrderNumber":8}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Carrés aux Dattes Moelleux',
	@Description = N'Délicieux carrés aux dattes moelleux avec une base croquante et une garniture sucrée aux dattes.',
	@PreparationTime = 20,
	@CookingTime = 30,
	@Difficulty = N'Easy',
	@Author = N'Marie Dubois',
	@ImageUrl = N'https://m1.zeste.ca/serdy-m-dia-inc/image/upload/f_auto/fl_lossy/q_auto:eco/x_0,y_269,w_4496,h_2529,c_crop/w_1200,h_630,c_fill/v1548773502/foodlavie/prod/recettes/carres-aux-dattes-b75c3f4f',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.8,
	@CategoryList = N'Desserts',
	@IngredientsJson = N'[	{"Name":"Farine","Description":"","Quantity":200,"Unit":"g"},
							{"Name":"Beurre mou","Description":"","Quantity":100,"Unit":"g"},
							{"Name":"Sucre","Description":"","Quantity":50,"Unit":"g"},
							{"Name":"Pincée de sel","Description":"","Quantity":1,"Unit":"Pincée"},
							{"Name":"Dattes dénoyautées","Description":"coupées en petits morceaux","Quantity":300,"Unit":"g"},
							{"Name":"Eau","Description":"","Quantity":100,"Unit":"mL"},
							{"Name":"Sucre","Description":"","Quantity":50,"Unit":"g"},
							{"Name":"Jus de citron","Description":"1 cuillère à soupe","Quantity":1,"Unit":"c. à soupe"}]',
	@SetpsJson = N'[{"Description":"Préchauffez votre four à 180°C (thermostat 6). Beurrez un moule carré ou rectangulaire de taille moyenne.","OrderNumber":1},{"Description":"Préparez la base en mélangeant la farine, le beurre mou, le sucre et le sel dans un saladier. Utilisez vos mains pour bien mélanger les ingrédients jusqu''à obtenir une texture sableuse.","OrderNumber":2},{"Description":"Étalez la moitié de la pâte à la base du moule préparé. Appuyez fermement pour obtenir une couche uniforme et compacte.","OrderNumber":3},{"Description":"Dans une casserole, combinez les dattes coupées, l''eau, le sucre et le jus de citron. Faites chauffer à feu moyen et laissez mijoter pendant environ 10 minutes, en remuant de temps en temps, jusqu''à ce que les dattes soient bien ramollies et que le mélange ait épaissi.","OrderNumber":4},{"Description":"Étalez la garniture aux dattes sur la base de pâte dans le moule, en veillant à ce qu''elle soit uniforme.","OrderNumber":5},{"Description":"Émiettez le reste de la pâte sur le dessus de la garniture aux dattes, en créant une couche croustillante.","OrderNumber":6},{"Description":"Enfournez le moule dans le four préchauffé et faites cuire pendant environ 25 à 30 minutes, ou jusqu''à ce que le dessus soit doré.","OrderNumber":7},{"Description":"Retirez le moule du four et laissez-le refroidir complètement avant de couper les carrés aux dattes en portions.","OrderNumber":8}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Cône de Pizza',
	@Description = N'Délicieux cônes de pizza croustillants et garnis à votre goût.',
	@PreparationTime = 60,
	@CookingTime = 20,
	@Difficulty = N'Medium',
	@Author = N'Marie Dubois',
	@ImageUrl = N'https://resize-elle.ladmedia.fr/r/600,600/alias/original/img/var/plain_site/storage/images/media/images/unecuillerenbois/85546862-1-fre-FR/unecuillerenbois.jpg',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.5,
	@CategoryList = N'Plats principaux',
	@IngredientsJson = N'[	{"Name":"Farine","Description":"","Quantity":300,"Unit":"g"},
							{"Name":"Levure sèche active","Description":"","Quantity":1,"Unit":"c. à café"},
							{"Name":"Sucre","Description":"","Quantity":1,"Unit":"c. à café"},
							{"Name":"Sel","Description":"","Quantity":0.5,"Unit":"c. à café"},
							{"Name":"Eau tiède","Description":"","Quantity":180,"Unit":"mL"},
							{"Name":"Huile d''olive","Description":"","Quantity":2,"Unit":"c. à soupe"},
							{"Name":"Sauce tomate","Description":"","Quantity":1,"Unit":"Unitée"},
							{"Name":"Fromage râpé","Description":"mozzarella, cheddar, etc.","Quantity":100,"Unit":"g"},
							{"Name":"Pepperoni ou autres garnitures","Description":"légumes, viandes, etc.","Quantity":1,"Unit":"Unitée"},
							{"Name":"Basilic frais","Description":"","Quantity":1,"Unit":"Brin"}]',
	@SetpsJson = N'[{"Description":"Préparez la pâte en mélangeant la farine, la levure, le sucre et le sel dans un grand saladier. Faites un puits au centre et versez-y l''eau tiède et l''huile d''olive.","OrderNumber":1},{"Description":"Mélangez doucement les ingrédients jusqu''à ce qu''ils commencent à se lier, puis pétrissez la pâte pendant environ 5 minutes jusqu''à ce qu''elle soit souple et élastique.","OrderNumber":2},{"Description":"Formez une boule avec la pâte, couvrez le saladier d''un torchon propre et laissez reposer dans un endroit chaud pendant environ 1 heure, ou jusqu''à ce que la pâte double de volume.","OrderNumber":3},{"Description":"Préchauffez votre four à 220°C (thermostat 7-8) et préparez des cônes en papier aluminium. Vous pouvez les fabriquer en roulant du papier aluminium en forme de cône, en veillant à ce qu''ils soient bien fermes.","OrderNumber":4},{"Description":"Une fois que la pâte a levé, divisez-la en portions égales. Prenez une portion de pâte et étalez-la sur une surface légèrement farinée pour former un cercle d''environ 15 cm de diamètre.","OrderNumber":5},{"Description":"Enroulez délicatement le cercle de pâte autour d''un cône en papier aluminium, en commençant par la pointe du cône. Appuyez légèrement pour sceller les bords de la pâte. Répétez l''opération avec le reste de la pâte.","OrderNumber":6},{"Description":"Placez les cônes de pâte sur une plaque de cuisson recouverte de papier sulfurisé. Enfournez-les dans le four préchauffé et faites-les cuire pendant environ 10 minutes, ou jusqu''à ce qu''ils soient dorés et croustillants.","OrderNumber":7},{"Description":"Retirez les cônes de pâte du four et laissez-les refroidir légèrement. Une fois refroidis, retirez délicatement les cônes en papier aluminium pour révéler les cônes de pizza.","OrderNumber":8},{"Description":"Remplissez les cônes de pâte avec la sauce tomate, le fromage râpé et les garnitures de votre choix. Assurez-vous de bien tasser les ingrédients à l''intérieur des cônes.","OrderNumber":9},{"Description":"Replacez les cônes de pizza garnis sur la plaque de cuisson et enfournez-les à nouveau pendant environ 10 minutes, ou jusqu''à ce que le fromage soit fondu et légèrement doré.","OrderNumber":10},{"Description":"Sortez les cônes de pizza du four, garnissez-les de basilic frais haché si vous le souhaitez, et servez-les chauds.","OrderNumber":11}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Dessert Glacé au Café Meringué',
	@Description = N'Délicieux dessert glacé au café meringué, idéal pour les amateurs de café et de douceurs sucrées.',
	@PreparationTime = 30,
	@CookingTime = 240,
	@Difficulty = N'Medium',
	@Author = N'Marie Dubois',
	@ImageUrl = N'https://assets.afcdn.com/recipe/20150923/33229_origin.jpg',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.8,
	@CategoryList = N'Desserts',
	@IngredientsJson = N'[	{"Name":"Jaunes d''œufs","Description":"","Quantity":4,"Unit":"Unitée"},
							{"Name":"Sucre","Description":"","Quantity":120,"Unit":"g"},
							{"Name":"Lait","Description":"","Quantity":250,"Unit":"mL"},
							{"Name":"Crème liquide","Description":"","Quantity":250,"Unit":"mL"},
							{"Name":"Café instantané","Description":"","Quantity":2,"Unit":"c. à soupe"},
							{"Name":"Blancs d''œufs","Description":"","Quantity":4,"Unit":"Unitée"},
							{"Name":"Sucre","Description":"","Quantity":200,"Unit":"g"},
							{"Name":"Extrait de vanille","Description":"","Quantity":1,"Unit":"c. à café"}]',
	@SetpsJson = N'[{"Description":"Préparez la glace au café. Dans un grand bol, fouettez les jaunes d''œufs avec le sucre jusqu''à ce que le mélange blanchisse et devienne mousseux.","OrderNumber":1},{"Description":"Dans une casserole, faites chauffer le lait et la crème liquide à feu moyen jusqu''à ce que le mélange commence à frémir. Retirez du feu.","OrderNumber":2},{"Description":"Versez lentement le mélange de lait chaud sur le mélange d''œufs en remuant constamment pour éviter que les œufs ne cuisent.","OrderNumber":3},{"Description":"Remettez le mélange dans la casserole et faites cuire à feu doux en remuant constamment jusqu''à ce qu''il épaississe légèrement et nappe le dos d''une cuillère.","OrderNumber":4},{"Description":"Ajoutez le café instantané dans la casserole et mélangez jusqu''à ce qu''il soit bien incorporé.","OrderNumber":5},{"Description":"Retirez la casserole du feu et laissez refroidir complètement. Une fois refroidie, placez la préparation au café au réfrigérateur pendant au moins 2 heures, ou jusqu''à ce qu''elle soit bien froide.","OrderNumber":6},{"Description":"Préparez la meringue. Dans un grand bol, fouettez les blancs d''œufs jusqu''à ce qu''ils commencent à mousser. Ajoutez progressivement le sucre tout en continuant de fouetter jusqu''à ce que la meringue forme des pics fermes et brillants. Incorporez l''extrait de vanille et mélangez délicatement.","OrderNumber":7},{"Description":"Sortez la préparation au café du réfrigérateur et ajoutez-y environ la moitié de la meringue. Mélangez délicatement pour bien incorporer la meringue à la préparation.","OrderNumber":8},{"Description":"Versez la préparation au café dans un moule à cake ou un contenant adapté, puis garnissez le dessus avec le reste de la meringue.","OrderNumber":9},{"Description":"Placez le moule au congélateur et laissez le dessert glacé prendre pendant au moins 4 heures, voire toute une nuit.","OrderNumber":10},{"Description":"Pour servir, sortez le dessert glacé au café meringué du congélateur quelques minutes avant de le découper en tranches. Vous pouvez le déguster tel quel ou le garnir de crème chantilly, de copeaux de chocolat ou de grains de café.","OrderNumber":11}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Dessert Glacé au Café Meringué',
	@Description = N'Délicieux dessert glacé au café meringué, idéal pour les amateurs de café et de douceurs sucrées.',
	@PreparationTime = 30,
	@CookingTime = 240,
	@Difficulty = N'Medium',
	@Author = N'Marie Dubois',
	@ImageUrl = N'https://assets.afcdn.com/recipe/20150923/33229_origin.jpg',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.8,
	@CategoryList = N'Desserts',
	@IngredientsJson = N'[	{"Name":"Jaunes d''œufs","Description":"","Quantity":4,"Unit":"Unitée"},
							{"Name":"Sucre","Description":"","Quantity":120,"Unit":"g"},
							{"Name":"Lait","Description":"","Quantity":250,"Unit":"mL"},
							{"Name":"Crème liquide","Description":"","Quantity":250,"Unit":"mL"},
							{"Name":"Café instantané","Description":"","Quantity":2,"Unit":"c. à soupe"},
							{"Name":"Blancs d''œufs","Description":"","Quantity":4,"Unit":"Unitée"},
							{"Name":"Sucre","Description":"","Quantity":200,"Unit":"g"},
							{"Name":"Extrait de vanille","Description":"","Quantity":1,"Unit":"c. à café"}]',
	@SetpsJson = N'[{"Description":"Préparez la glace au café. Dans un grand bol, fouettez les jaunes d''œufs avec le sucre jusqu''à ce que le mélange blanchisse et devienne mousseux.","OrderNumber":1},{"Description":"Dans une casserole, faites chauffer le lait et la crème liquide à feu moyen jusqu''à ce que le mélange commence à frémir. Retirez du feu.","OrderNumber":2},{"Description":"Versez lentement le mélange de lait chaud sur le mélange d''œufs en remuant constamment pour éviter que les œufs ne cuisent.","OrderNumber":3},{"Description":"Remettez le mélange dans la casserole et faites cuire à feu doux en remuant constamment jusqu''à ce qu''il épaississe légèrement et nappe le dos d''une cuillère.","OrderNumber":4},{"Description":"Ajoutez le café instantané dans la casserole et mélangez jusqu''à ce qu''il soit bien incorporé.","OrderNumber":5},{"Description":"Retirez la casserole du feu et laissez refroidir complètement. Une fois refroidie, placez la préparation au café au réfrigérateur pendant au moins 2 heures, ou jusqu''à ce qu''elle soit bien froide.","OrderNumber":6},{"Description":"Préparez la meringue. Dans un grand bol, fouettez les blancs d''œufs jusqu''à ce qu''ils commencent à mousser. Ajoutez progressivement le sucre tout en continuant de fouetter jusqu''à ce que la meringue forme des pics fermes et brillants. Incorporez l''extrait de vanille et mélangez délicatement.","OrderNumber":7},{"Description":"Sortez la préparation au café du réfrigérateur et ajoutez-y environ la moitié de la meringue. Mélangez délicatement pour bien incorporer la meringue à la préparation.","OrderNumber":8},{"Description":"Versez la préparation au café dans un moule à cake ou un contenant adapté, puis garnissez le dessus avec le reste de la meringue.","OrderNumber":9},{"Description":"Placez le moule au congélateur et laissez le dessert glacé prendre pendant au moins 4 heures, voire toute une nuit.","OrderNumber":10},{"Description":"Pour servir, sortez le dessert glacé au café meringué du congélateur quelques minutes avant de le découper en tranches. Vous pouvez le déguster tel quel ou le garnir de crème chantilly, de copeaux de chocolat ou de grains de café.","OrderNumber":11}]'

SELECT 'Return Value' = @return_value

GO
