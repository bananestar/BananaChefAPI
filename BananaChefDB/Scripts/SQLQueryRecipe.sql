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
	@IngredientsJson = N'[	{"Name":"Brocoli","Description":"","Quantity":1,"Unit":"Unit�e"},
							{"Name":"Chocolat noir","Description":"hach�","Quantity":200,"Unit":"g"},
							{"Name":"Farine","Description":"","Quantity":150,"Unit":"g"},
							{"Name":"Beurre ramolli","Description":"","Quantity":100,"Unit":"g"},
							{"Name":"Sucre","Description":"","Quantity":100,"Unit":"g"},
							{"Name":"�uf","Description":"","Quantity":1,"Unit":"Unit�e"},
							{"Name":"Extrait de vanille","Description":"","Quantity":1,"Unit":"c. � caf�"},
							{"Name":"Levure chimique","Description":"","Quantity":0.5,"Unit":"c. � caf�"},
							{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pinc�e"}]',
	@SetpsJson = N'[{"Description":"Pr�chauffez le four � 180�C. Tapissez une plaque � p�tisserie de papier sulfuris�.","OrderNumber":1},{"Description":"Faites cuire le brocoli � la vapeur jusqu''� ce qu''il soit tendre. �gouttez-le et �crasez-le avec une fourchette pour obtenir une pur�e de brocoli.","OrderNumber":2},{"Description":"Dans un grand bol, m�langez le beurre ramolli et le sucre jusqu''� obtenir une consistance cr�meuse. Ajoutez l''�uf et l''extrait de vanille, puis m�langez bien.","OrderNumber":3},{"Description":"Ajoutez la pur�e de brocoli dans le m�lange de beurre et de sucre, et m�langez jusqu''� ce que les ingr�dients soient bien incorpor�s.","OrderNumber":4},{"Description":"Dans un autre bol, m�langez la farine, la levure chimique et le sel. Ajoutez ce m�lange sec � la p�te � base de brocoli, en remuant jusqu''� ce que tout soit bien m�lang�.","OrderNumber":5},{"Description":"Ajoutez le chocolat hach� � la p�te et m�langez pour r�partir les morceaux de chocolat de mani�re homog�ne.","OrderNumber":6},{"Description":"D�posez des cuiller�es de p�te sur la plaque � p�tisserie pr�par�e, en les espa�ant l�g�rement.","OrderNumber":7},{"Description":"Enfournez les cookies au brocoli et au chocolat pendant environ 12 � 15 minutes, ou jusqu''� ce qu''ils soient dor�s.","OrderNumber":8},{"Description":"Laissez les cookies refroidir sur la plaque pendant quelques minutes, puis transf�rez-les sur une grille de refroidissement pour qu''ils refroidissent compl�tement.","OrderNumber":9}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRecipe]
		@Title = N'P�tes � la Carbonara',
		@Description = N'Voici une recette classique de p�tes � la carbonara, cr�meuses et savoureuses.',
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
								{"Name":"�ufs","Description":"","Quantity":3,"Unit":"Unit�e"},
								{"Name":"Parmesan r�p�","Description":"","Quantity":75,"Unit":"g"},
								{"Name":"Poivre noir fra�chement moulu","Description":"","Quantity":1,"Unit":"Pinc�e"},
								{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pinc�e"},
								{"Name":"Persil frais","Description":"","Quantity":1,"Unit":"Unit�e"}]',
		@SetpsJson = N'[{"Description":"Faites cuire les p�tes dans une grande casserole d''eau bouillante sal�e selon les instructions sur l''emballage, jusqu''� ce qu''elles soient al dente. �gouttez-les en r�servant une petite quantit� d''eau de cuisson des p�tes.","OrderNumber":1},
						{"Description":"Pendant ce temps, faites chauffer une po�le � feu moyen. Ajoutez la pancetta ou les lardons et faites-les revenir jusqu''� ce qu''ils soient dor�s et croustillants. Retirez-les de la po�le et �gouttez-les sur du papier absorbant pour enlever l''exc�s de graisse.","OrderNumber":2},
						{"Description":"Dans un bol moyen, battez les �ufs avec le parmesan r�p�. Ajoutez une g�n�reuse quantit� de poivre noir fra�chement moulu. Vous n''aurez pas besoin d''ajouter de sel, car la pancetta et le parmesan sont d�j� sal�s.","OrderNumber":3},
						{"Description":"Ajoutez les p�tes cuites et �goutt�es dans la po�le o� vous avez fait cuire la pancetta. M�langez les p�tes avec la pancetta pour bien les enrober de graisse.","OrderNumber":4},
						{"Description":"Retirez la po�le du feu et ajoutez le m�lange d''�ufs et de parmesan. M�langez rapidement et vigoureusement pour que la chaleur des p�tes cuise l�g�rement les �ufs sans les coaguler.","OrderNumber":5},
						{"Description":"Si la sauce est trop �paisse, ajoutez un peu d''eau de cuisson des p�tes r�serv�e, une cuill�re � soupe � la fois, en remuant jusqu''� ce que la consistance soit cr�meuse et homog�ne.","OrderNumber":6},
						{"Description":"Servez imm�diatement les p�tes � la carbonara dans des assiettes chaudes. Garnissez-les de pancetta croustillante suppl�mentaire et de persil frais hach�, si vous le souhaitez.","OrderNumber":7}]'

SELECT	'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRecipe]
		@Title = N'Pizza aux Anchois',
		@Description = N'Voici une d�licieuse recette de pizza aux anchois, parfaite pour les amateurs de saveurs sal�es.',
		@PreparationTime = 60,
		@CookingTime = 15,
		@Difficulty = N'Medium',
		@Author = N'Jeanne Martin',
		@ImageUrl = N'https://www.galbani.fr/wp-content/uploads/2017/07/pizza_blanche.jpg',
		@VideoUrl = N'https://exemple.com/video',
		@Score = 4.8,
		@CategoryList = N'Plats principaux',
		@IngredientsJson = N'[	{"Name":"Farine","Description":"","Quantity":300,"Unit":"g"},
								{"Name":"Levure s�che active","Description":"","Quantity":1,"Unit":"c. � caf�"},
								{"Name":"Sucre","Description":"","Quantity":1,"Unit":"c. � caf�"},
								{"Name":"Sel","Description":"","Quantity":0.5,"Unit":"c. � caf�"},
								{"Name":"Eau ti�de","Description":"","Quantity":180,"Unit":"mL"},
								{"Name":"Huile d''olive","Description":"","Quantity":2,"Unit":"c. � soupe"},
								{"Name":"Sauce tomate","Description":"","Quantity":1,"Unit":"Unit�e"},
								{"Name":"Mozzarella r�p�e","Description":"","Quantity":1,"Unit":"Unit�e"},
								{"Name":"Anchois � l''huile d''olive","Description":"�goutt�s","Quantity":1,"Unit":"Unit�e"},
								{"Name":"Olives noires d�noyaut�es","Description":"","Quantity":1,"Unit":"Unit�e"},
								{"Name":"Origan s�ch�","Description":"","Quantity":1,"Unit":"Unit�e"},
								{"Name":"Huile d''olive","Description":"Pour arroser (facultatif)","Quantity":1,"Unit":"Unit�e"}]',
		@SetpsJson = N'[{"Description":"Pr�parez d''abord la p�te � pizza. Dans un grand saladier, m�langez la farine, la levure, le sucre et le sel. Faites un puits au centre et versez-y l''eau ti�de et l''huile d''olive.","OrderNumber":1},
						{"Description":"M�langez doucement les ingr�dients jusqu''� ce qu''ils commencent � se lier, puis p�trissez la p�te pendant environ 5 minutes jusqu''� ce qu''elle soit souple et �lastique.","OrderNumber":2},
						{"Description":"Formez une boule avec la p�te, couvrez le saladier d''un torchon propre et laissez reposer dans un endroit chaud pendant environ 1 heure, ou jusqu''� ce que la p�te double de volume.","OrderNumber":3},
						{"Description":"Pr�chauffez votre four � la temp�rature maximale (g�n�ralement autour de 220�C).","OrderNumber":4},
						{"Description":"Une fois que la p�te a lev�, d�posez-la sur une surface l�g�rement farin�e et �talez-la en un cercle ou un rectangle, selon vos pr�f�rences.","OrderNumber":5},
						{"Description":"Transf�rez la p�te �tal�e sur une plaque � pizza ou une plaque de cuisson recouverte de papier sulfuris�.","OrderNumber":6},
						{"Description":"�talez g�n�reusement la sauce tomate sur la p�te, en laissant une bordure libre d''environ 1 cm.","OrderNumber":7},
						{"Description":"Parsemez la mozzarella r�p�e sur la sauce tomate.","OrderNumber":8},
						{"Description":"Disposez les anchois et les olives noires sur la pizza.","OrderNumber":9},
						{"Description":"Saupoudrez d''origan s�ch� selon votre go�t.","OrderNumber":10},
						{"Description":"Enfournez la pizza dans le four pr�chauff� et faites-la cuire pendant environ 12 � 15 minutes, ou jusqu''� ce que la p�te soit dor�e et croustillante.","OrderNumber":11},
						{"Description":"Si d�sir�, juste apr�s la cuisson, arrosez l�g�rement la pizza avec un filet d''huile d''olive pour lui donner un �clat suppl�mentaire.","OrderNumber":12},
						{"Description":"Sortez la pizza du four, laissez-la refroidir l�g�rement, puis coupez-la en parts et servez-la chaud.","OrderNumber":13}]'

SELECT	'Return Value' = @return_value

GO

--(Unit IN ('g', 'kg', 'mg', 'L', 'mL', 'cL', 'c. � soupe', 'c. � caf�', 'Tasse', 'Verre', 'oz', 'lb', 'Pinc�e', 'Brin', 'Feuille', 'Tranche', 'Gousse', 'CLO', 'Filet', 'Morceau', 'Rondelle', 'Unit�e', 'Sachet'))

USE [BananaChefDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRecipe]
		@Title = N'B�uf Bourguignon',
		@Description = N'Voici une recette classique de b�uf bourguignon, un plat rustique et savoureux.',
		@PreparationTime = 30,
		@CookingTime = 180,
		@Difficulty = N'Medium',
		@Author = N'Jean Dupont',
		@ImageUrl = N'https://img-3.journaldesfemmes.fr/3q1hdTGIoj2XznsQWzr9V0Cg3KY=/800x600/smart/d6db2baa728b47f8adbf30b99a957dc0/recipe-jdf/10002051.jpg',
		@VideoUrl = N'https://exemple.com/video',
		@Score = 4.9,
		@CategoryList = N'Plats principaux',
		@IngredientsJson = N'[	{"Name":"Viande de b�uf","Description":"G�te, paleron ou joue de b�uf, coup�e en cubes","Quantity":1200,"Unit":"g"},
								{"Name":"Lardons fum�s","Description":"","Quantity":200,"Unit":"g"},
								{"Name":"Champignons de Paris","Description":"Coup�s en quartiers","Quantity":250,"Unit":"g"},
								{"Name":"Oignons","Description":"�minc�s","Quantity":2,"Unit":"Unit�e"},
								{"Name":"Carottes","Description":"Coup�es en rondelles","Quantity":2,"Unit":"Unit�e"},
								{"Name":"Ail","Description":"�minc�","Quantity":3,"Unit":"Gousse"},
								{"Name":"Vin rouge","Description":"De pr�f�rence bourgogne","Quantity":750,"Unit":"mL"},
								{"Name":"Bouillon de b�uf","Description":"","Quantity":500,"Unit":"mL"},
								{"Name":"Farine","Description":"","Quantity":2,"Unit":"c. � soupe"},
								{"Name":"Huile d''olive","Description":"","Quantity":2,"Unit":"c. � soupe"},
								{"Name":"Concentr� de tomate","Description":"","Quantity":2,"Unit":"c. � soupe"},
								{"Name":"Feuilles de laurier","Description":"","Quantity":2,"Unit":"Feuille"},
								{"Name":"Branches de thym","Description":"","Quantity":4,"Unit":"Unit�e"},
								{"Name":"Sel","Description":"","Quantity":1,"Unit":"Unit�e"},
								{"Name":"Poivre","Description":"","Quantity":1,"Unit":"Unit�e"},
								{"Name":"Persil frais","Description":"Pour la garniture","Quantity":1,"Unit":"Unit�e"}]',
		@SetpsJson = N'[{"Description":"Dans une cocotte ou une grande casserole, faites chauffer l''huile d''olive � feu moyen. Ajoutez les lardons et faites-les revenir jusqu''� ce qu''ils soient dor�s. Retirez-les de la cocotte et r�servez-les.","OrderNumber":1},
						{"Description":"Ajoutez les morceaux de b�uf dans la cocotte et faites-les dorer de tous les c�t�s. Retirez-les de la cocotte et r�servez-les avec les lardons.","OrderNumber":2},
						{"Description":"Dans la m�me cocotte, ajoutez les oignons, les carottes et l''ail. Faites-les revenir pendant quelques minutes jusqu''� ce qu''ils soient l�g�rement dor�s.","OrderNumber":3},
						{"Description":"Saupoudrez la farine sur les l�gumes et remuez bien pour les enrober. Ajoutez le concentr� de tomate et m�langez.","OrderNumber":4},
						{"Description":"Versez le vin rouge dans la cocotte et portez � �bullition. Laissez mijoter pendant quelques minutes pour r�duire l�g�rement le vin.","OrderNumber":5},
						{"Description":"Ajoutez le bouillon de b�uf, les feuilles de laurier et les branches de thym. Remettez les lardons et les morceaux de b�uf dans la cocotte. Assaisonnez avec du sel et du poivre selon votre go�t. Veillez � ce que la viande soit bien immerg�e dans le liquide. Si n�cessaire, ajoutez un peu d''eau ou de bouillon.","OrderNumber":6},{"Description":"Couvrez la cocotte et laissez mijoter � feu doux pendant environ 2 � 3 heures, ou jusqu''� ce que la viande soit tendre et se d�fasse facilement.","OrderNumber":7},{"Description":"Pendant ce temps, faites revenir les champignons dans une po�le avec un peu d''huile d''olive jusqu''� ce qu''ils soient dor�s. R�servez-les.","OrderNumber":8},{"Description":"Une fois que la viande est cuite, ajoutez les champignons dans la cocotte et laissez mijoter encore quelques minutes.","OrderNumber":9},{"Description":"Retirez les feuilles de laurier et les branches de thym de la cocotte. Go�tez et ajustez l''assaisonnement si n�cessaire.","OrderNumber":10}]'

SELECT	'Return Value' = @return_value

GO

--(Unit IN ('g', 'kg', 'mg', 'L', 'mL', 'cL', 'c. � soupe', 'c. � caf�', 'Tasse', 'Verre', 'oz', 'lb', 'Pinc�e', 'Brin', 'Feuille', 'Tranche', 'Gousse', 'CLO', 'Filet', 'Morceau', 'Rondelle', 'Unit�e', 'Sachet'))

USE [BananaChefDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRecipe]
		@Title = N'G�teau au chocolat',
		@Description = N'Voici une recette simple et d�licieuse pour un g�teau au chocolat.',
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
								{"Name":"�ufs","Description":"","Quantity":4,"Unit":"Unit�e"},
								{"Name":"Farine","Description":"","Quantity":150,"Unit":"g"},
								{"Name":"Levure chimique","Description":"","Quantity":1,"Unit":"c. � caf�"},
								{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pinc�e"},
								{"Name":"Sucre glace","Description":"Pour la d�coration","Quantity":1,"Unit":"Unit�e"}]',
		@SetpsJson = N'[{"Description":"Pr�chauffez votre four � 180�C (thermostat 6). Beurrez et farinez un moule � g�teau.","OrderNumber":1},
						{"Description":"Cassez le chocolat en morceaux et faites-le fondre au bain-marie ou au micro-ondes. Remuez bien jusqu''� obtenir une consistance lisse.","OrderNumber":2},
						{"Description":"Dans un saladier, battez le beurre ramolli et le sucre jusqu''� obtenir une texture cr�meuse. Ajoutez les �ufs un par un en m�langeant bien entre chaque ajout.","OrderNumber":3},
						{"Description":"Incorporez ensuite le chocolat fondu � la pr�paration et m�langez jusqu''� obtenir une p�te homog�ne.","OrderNumber":4},
						{"Description":"Dans un autre r�cipient, m�langez la farine, la levure chimique et le sel. Versez ce m�lange petit � petit dans la pr�paration au chocolat, en remuant d�licatement pour �viter les grumeaux.","OrderNumber":5},
						{"Description":"Versez la p�te dans le moule pr�par� et lissez la surface avec une spatule.","OrderNumber":6},
						{"Description":"Enfournez le g�teau pendant environ 25 � 30 minutes, ou jusqu''� ce qu''un couteau ins�r� au centre en ressorte propre.","OrderNumber":7},
						{"Description":"Laissez le g�teau refroidir dans le moule pendant quelques minutes, puis d�moulez-le sur une grille et laissez-le refroidir compl�tement.","OrderNumber":8},
						{"Description":"Avant de servir, vous pouvez saupoudrer le g�teau de sucre glace pour une touche d�corative.","OrderNumber":9}]'

SELECT	'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRecipe]
		@Title = N'Tarte aux framboises',
		@Description = N'Voici une d�licieuse recette de tarte aux framboises.',
		@PreparationTime = 30,
		@CookingTime = 15,
		@Difficulty = N'Easy',
		@Author = N'Jane Doe',
		@ImageUrl = N'https://cdn.lacuisinedannie.com/images/374.jpg',
		@VideoUrl = N'https://exemple.com/video',
		@Score = 4.7,
		@CategoryList = N'Desserts',
		@IngredientsJson = N'[	{"Name":"Farine","Description":"","Quantity":200,"Unit":"g"},
								{"Name":"Beurre","Description":"Froid, coup� en petits morceaux","Quantity":100,"Unit":"g"},
								{"Name":"Sucre","Description":"","Quantity":2,"Unit":"c. � soupe"},
								{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pinc�e"},
								{"Name":"�uf","Description":"","Quantity":1,"Unit":"Unit�e"},
								{"Name":"Framboises","Description":"","Quantity":500,"Unit":"g"},
								{"Name":"Confiture de framboises","Description":"","Quantity":4,"Unit":"c. � soupe"},
								{"Name":"Sucre glace","Description":"Pour saupoudrer, facultatif","Quantity":1,"Unit":"Unit�e"}]',
		@SetpsJson = N'[{"Description":"Pr�parez d''abord la p�te. Dans un saladier, m�langez la farine, le sucre et le sel. Ajoutez le beurre froid et travaillez rapidement du bout des doigts jusqu''� obtenir une consistance sabl�e.","OrderNumber":1},
						{"Description":"Ajoutez l''�uf battu � la p�te et m�langez jusqu''� ce qu''elle forme une boule. Enveloppez la p�te dans du film alimentaire et placez-la au r�frig�rateur pendant environ 30 minutes.","OrderNumber":2},
						{"Description":"Pr�chauffez votre four � 180�C (thermostat 6). Sortez la p�te du r�frig�rateur et �talez-la sur une surface l�g�rement farin�e jusqu''� obtenir un cercle d''environ 30 cm de diam�tre.","OrderNumber":3},
						{"Description":"Transf�rez la p�te dans un moule � tarte pr�alablement beurr� et piquez le fond � l''aide d''une fourchette. Enfournez la p�te pendant environ 15 minutes, ou jusqu''� ce qu''elle soit l�g�rement dor�e. Laissez-la refroidir compl�tement.","OrderNumber":4},
						{"Description":"Pendant ce temps, pr�parez la garniture. Lavez les framboises et �gouttez-les d�licatement. R�servez quelques framboises pour la d�coration.","OrderNumber":5},
						{"Description":"Dans une casserole � feu doux, faites chauffer la confiture de framboises jusqu''� ce qu''elle soit liquide. Retirez du feu et laissez refroidir l�g�rement.","OrderNumber":6},
						{"Description":"�talez la confiture de framboises sur le fond de tarte refroidi.","OrderNumber":7},
						{"Description":"Disposez les framboises fra�ches sur la confiture, en les enfon�ant l�g�rement pour qu''elles adh�rent � la confiture.","OrderNumber":8},
						{"Description":"R�frig�rez la tarte pendant au moins une heure pour permettre � la garniture de prendre.","OrderNumber":9},
						{"Description":"Avant de servir, vous pouvez saupoudrer la tarte de sucre glace pour une touche d�corative. Vous pouvez �galement ajouter les framboises r�serv�es sur le dessus.","OrderNumber":10}]'

SELECT	'Return Value' = @return_value

GO


USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Gratin Dauphinois au Fromage � Raclette',
	@Description = N'Un d�licieux gratin dauphinois revisit� avec du fromage � raclette fondant.',
	@PreparationTime = 30,
	@CookingTime = 75,
	@Difficulty = N'Medium',
	@Author = N'Jeanne Martin',
	@ImageUrl = N'https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Ffac.2F2019.2F12.2F17.2Fad01b852-7525-4fa5-a5c1-fcf41ab7d34f.2Ejpeg/410x230/quality/80/crop-from/center/gratin-dauphinois-fromage-blanc.jpeg',
	@VideoUrl = N'https://example.com/video',
	@Score = 4.5,
	@CategoryList = N'Plats principaux',
	@IngredientsJson = N'[	{"Name":"Pommes de terre � chair ferme","Description":"","Quantity":1.5,"Unit":"kg"},
							{"Name":"Fromage � raclette","Description":"","Quantity":200,"Unit":"g"},
							{"Name":"Cr�me liquide","Description":"","Quantity":500,"Unit":"mL"},
							{"Name":"Gousses d''ail","Description":"","Quantity":2,"Unit":"Unit�e"},
							{"Name":"Beurre","Description":"","Quantity":30,"Unit":"g"},
							{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pinc�e"},
							{"Name":"Poivre","Description":"","Quantity":1,"Unit":"Pinc�e"},
							{"Name":"Noix de muscade r�p�e","Description":"facultatif","Quantity":1,"Unit":"Pinc�e"}]',
	@SetpsJson = N'[{"Description":"Pr�chauffez votre four � 180�C (thermostat 6).","OrderNumber":1},{"Description":"�pluchez les pommes de terre et lavez-les soigneusement. Coupez-les en tranches fines d''environ 2 � 3 mm d''�paisseur.","OrderNumber":2},{"Description":"Frottez un plat � gratin avec les gousses d''ail pel�es. Beurrez g�n�reusement le plat pour �viter que les pommes de terre n''accrochent.","OrderNumber":3},{"Description":"Disposez une premi�re couche de tranches de pommes de terre dans le plat. Assaisonnez avec du sel, du poivre et un peu de noix de muscade r�p�e, si vous le souhaitez.","OrderNumber":4},{"Description":"R�p�tez l''op�ration en superposant les couches de pommes de terre, en assaisonnant chaque couche jusqu''� �puisement des ingr�dients.","OrderNumber":5},{"Description":"Versez la cr�me liquide sur les pommes de terre jusqu''� ce qu''elle atteigne presque le niveau des pommes de terre. Ajoutez un peu plus de cr�me si n�cessaire.","OrderNumber":6},{"Description":"Coupez le fromage � raclette en tranches fines et disposez-les sur le dessus du gratin.","OrderNumber":7},{"Description":"Couvrez le plat � gratin d''une feuille de papier aluminium et placez-le au four pr�chauff�. Faites cuire pendant environ 45 minutes.","OrderNumber":8},{"Description":"Retirez le papier aluminium et poursuivez la cuisson pendant environ 20 � 30 minutes suppl�mentaires, ou jusqu''� ce que le dessus soit dor� et que les pommes de terre soient tendres.","OrderNumber":9},{"Description":"Laissez reposer le gratin pendant quelques minutes avant de le servir, cela permettra aux saveurs de se m�langer et � la cr�me de se raffermir l�g�rement.","OrderNumber":10}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Aum�ni�res Croustillantes au Jambon et aux Poireaux',
	@Description = N'Des aum�ni�res d�licieusement croustillantes, garnies d''un m�lange savoureux de jambon et de poireaux.',
	@PreparationTime = 20,
	@CookingTime = 20,
	@Difficulty = N'Easy',
	@Author = N'Sophie Dupont',
	@ImageUrl = N'https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/recettes-de-cuisine/aumonieres-de-poireaux-2033320/11023933-11-fre-FR/Aumonieres-de-poireaux.jpg',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.2,
	@CategoryList = N'Plats principaux, Entr�es',
	@IngredientsJson = N'[	{"Name":"Feuilles de brick","Description":"","Quantity":4,"Unit":"Feuille"},
							{"Name":"Jambon cuit","Description":"","Quantity":200,"Unit":"g"},
							{"Name":"Poireaux","Description":"lav�s et �minc�s","Quantity":2,"Unit":"Unit�e"},
							{"Name":"Oignon","Description":"�minc�","Quantity":1,"Unit":"Unit�e"},
							{"Name":"Fromage r�p�","Description":"","Quantity":100,"Unit":"g"},
							{"Name":"Huile d''olive","Description":"","Quantity":2,"Unit":"c. � soupe"},
							{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pinc�e"},
							{"Name":"Poivre","Description":"","Quantity":1,"Unit":"Pinc�e"},
							{"Name":"Beurre fondu","Description":"","Quantity":1,"Unit":"c. � soupe"}]',
	@SetpsJson = N'[{"Description":"Pr�chauffez votre four � 180�C (thermostat 6) et pr�parez une plaque de cuisson recouverte de papier sulfuris�.","OrderNumber":1},{"Description":"Dans une po�le, faites chauffer l''huile d''olive � feu moyen. Ajoutez l''oignon �minc� et faites-le revenir pendant quelques minutes jusqu''� ce qu''il soit l�g�rement dor�.","OrderNumber":2},{"Description":"Ajoutez les poireaux �minc�s dans la po�le et faites-les cuire pendant environ 5 minutes, jusqu''� ce qu''ils soient tendres. Assaisonnez avec du sel et du poivre selon votre go�t. Retirez du feu et laissez refroidir l�g�rement.","OrderNumber":3},{"Description":"Dans un bol, m�langez les d�s de jambon, les poireaux saut�s et le fromage r�p�. Assurez-vous que les ingr�dients soient bien m�lang�s.","OrderNumber":4},{"Description":"Prenez une feuille de brick et badigeonnez-la l�g�rement de beurre fondu � l''aide d''un pinceau de cuisine. Placez une portion du m�lange au centre de la feuille de brick.","OrderNumber":5},{"Description":"Repliez les c�t�s de la feuille de brick pour former une aum�ni�re, en veillant � bien sceller les bords. R�p�tez l''op�ration avec les autres feuilles de brick et le reste du m�lange.","OrderNumber":6},{"Description":"Disposez les aum�ni�res sur la plaque de cuisson pr�par�e. Badigeonnez-les l�g�rement de beurre fondu pour qu''elles deviennent bien croustillantes � la cuisson.","OrderNumber":7},{"Description":"Enfournez les aum�ni�res dans le four pr�chauff� et faites-les cuire pendant environ 15 � 20 minutes, ou jusqu''� ce qu''elles soient dor�es et croustillantes.","OrderNumber":8},{"Description":"Retirez les aum�ni�res du four et laissez-les refroidir l�g�rement avant de les servir. Elles seront chaudes � l''int�rieur, alors faites attention en les ouvrant.","OrderNumber":9}]'

SELECT 'Return Value' = @return_value

GO


DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Carpaccio/Tartare de Thon Rouge',
	@Description = N'Une d�licieuse recette de carpaccio/tartare de thon rouge frais, marin� dans une vinaigrette citronn�e et agr�ment� d''�chalotes et de c�pres.',
	@PreparationTime = 30,
	@CookingTime = 0,
	@Difficulty = N'Easy',
	@Author = N'Marie Dubois',
	@ImageUrl = N'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/3966CCE7-975A-4DC9-821E-123CBA143B74/Derivates/F5073AC1-D189-4D49-8784-99EEC5DBA4FD.jpg',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.5,
	@CategoryList = N'Entr�es, Poissons',
	@IngredientsJson = N'[	{"Name":"Filet de thon rouge frais","Description":"tr�s frais","Quantity":400,"Unit":"g"},
							{"Name":"Jus de citron","Description":"de 2 citrons","Quantity":2,"Unit":"Unit�e"},
							{"Name":"Huile d''olive extra vierge","Description":"","Quantity":2,"Unit":"c. � soupe"},
							{"Name":"Sauce soja","Description":"","Quantity":1,"Unit":"c. � soupe"},
							{"Name":"Sauce piment�e","Description":"facultatif, selon votre go�t","Quantity":1,"Unit":"c. � soupe"},
							{"Name":"�chalotes","Description":"finement hach�es","Quantity":2,"Unit":"Unit�e"},
							{"Name":"C�pres","Description":"�goutt�es","Quantity":2,"Unit":"c. � soupe"},
							{"Name":"Sel","Description":"","Quantity":1,"Unit":"Pinc�e"},
							{"Name":"Poivre","Description":"","Quantity":1,"Unit":"Pinc�e"},
							{"Name":"Feuilles de coriandre ou de persil frais","Description":"pour la garniture","Quantity":1,"Unit":"Feuille"}]',
	@SetpsJson = N'[{"Description":"Placez le filet de thon au cong�lateur pendant environ 30 minutes. Cela facilitera la d�coupe en tranches fines et r�guli�res.","OrderNumber":1},{"Description":"Pendant ce temps, pr�parez la marinade en m�langeant le jus de citron, l''huile d''olive, la sauce soja et la sauce piment�e dans un bol. R�servez.","OrderNumber":2},{"Description":"Sortez le thon du cong�lateur et tranchez-le en tranches tr�s fines � l''aide d''un couteau bien aiguis�. Placez les tranches dans un plat peu profond.","OrderNumber":3},{"Description":"Versez la marinade sur le thon, en vous assurant que toutes les tranches sont bien enrob�es. Ajoutez les �chalotes hach�es et les c�pres. M�langez d�licatement.","OrderNumber":4},{"Description":"Couvrez le plat de thon et placez-le au r�frig�rateur pendant au moins 30 minutes, afin que les saveurs se m�langent et que le thon marin� l�g�rement.","OrderNumber":5},{"Description":"Juste avant de servir, go�tez le carpaccio/tartare de thon et ajustez l''assaisonnement avec du sel et du poivre selon votre go�t.","OrderNumber":6},{"Description":"Disposez les tranches de thon sur des assiettes individuelles. Arrosez-les de marinade suppl�mentaire si d�sir�.","OrderNumber":7},{"Description":"Garnissez le carpaccio/tartare de thon de quelques feuilles de coriandre ou de persil frais.","OrderNumber":8}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Carr�s aux Dattes Moelleux',
	@Description = N'D�licieux carr�s aux dattes moelleux avec une base croquante et une garniture sucr�e aux dattes.',
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
							{"Name":"Pinc�e de sel","Description":"","Quantity":1,"Unit":"Pinc�e"},
							{"Name":"Dattes d�noyaut�es","Description":"coup�es en petits morceaux","Quantity":300,"Unit":"g"},
							{"Name":"Eau","Description":"","Quantity":100,"Unit":"mL"},
							{"Name":"Sucre","Description":"","Quantity":50,"Unit":"g"},
							{"Name":"Jus de citron","Description":"1 cuill�re � soupe","Quantity":1,"Unit":"c. � soupe"}]',
	@SetpsJson = N'[{"Description":"Pr�chauffez votre four � 180�C (thermostat 6). Beurrez un moule carr� ou rectangulaire de taille moyenne.","OrderNumber":1},{"Description":"Pr�parez la base en m�langeant la farine, le beurre mou, le sucre et le sel dans un saladier. Utilisez vos mains pour bien m�langer les ingr�dients jusqu''� obtenir une texture sableuse.","OrderNumber":2},{"Description":"�talez la moiti� de la p�te � la base du moule pr�par�. Appuyez fermement pour obtenir une couche uniforme et compacte.","OrderNumber":3},{"Description":"Dans une casserole, combinez les dattes coup�es, l''eau, le sucre et le jus de citron. Faites chauffer � feu moyen et laissez mijoter pendant environ 10 minutes, en remuant de temps en temps, jusqu''� ce que les dattes soient bien ramollies et que le m�lange ait �paissi.","OrderNumber":4},{"Description":"�talez la garniture aux dattes sur la base de p�te dans le moule, en veillant � ce qu''elle soit uniforme.","OrderNumber":5},{"Description":"�miettez le reste de la p�te sur le dessus de la garniture aux dattes, en cr�ant une couche croustillante.","OrderNumber":6},{"Description":"Enfournez le moule dans le four pr�chauff� et faites cuire pendant environ 25 � 30 minutes, ou jusqu''� ce que le dessus soit dor�.","OrderNumber":7},{"Description":"Retirez le moule du four et laissez-le refroidir compl�tement avant de couper les carr�s aux dattes en portions.","OrderNumber":8}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Carr�s aux Dattes Moelleux',
	@Description = N'D�licieux carr�s aux dattes moelleux avec une base croquante et une garniture sucr�e aux dattes.',
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
							{"Name":"Pinc�e de sel","Description":"","Quantity":1,"Unit":"Pinc�e"},
							{"Name":"Dattes d�noyaut�es","Description":"coup�es en petits morceaux","Quantity":300,"Unit":"g"},
							{"Name":"Eau","Description":"","Quantity":100,"Unit":"mL"},
							{"Name":"Sucre","Description":"","Quantity":50,"Unit":"g"},
							{"Name":"Jus de citron","Description":"1 cuill�re � soupe","Quantity":1,"Unit":"c. � soupe"}]',
	@SetpsJson = N'[{"Description":"Pr�chauffez votre four � 180�C (thermostat 6). Beurrez un moule carr� ou rectangulaire de taille moyenne.","OrderNumber":1},{"Description":"Pr�parez la base en m�langeant la farine, le beurre mou, le sucre et le sel dans un saladier. Utilisez vos mains pour bien m�langer les ingr�dients jusqu''� obtenir une texture sableuse.","OrderNumber":2},{"Description":"�talez la moiti� de la p�te � la base du moule pr�par�. Appuyez fermement pour obtenir une couche uniforme et compacte.","OrderNumber":3},{"Description":"Dans une casserole, combinez les dattes coup�es, l''eau, le sucre et le jus de citron. Faites chauffer � feu moyen et laissez mijoter pendant environ 10 minutes, en remuant de temps en temps, jusqu''� ce que les dattes soient bien ramollies et que le m�lange ait �paissi.","OrderNumber":4},{"Description":"�talez la garniture aux dattes sur la base de p�te dans le moule, en veillant � ce qu''elle soit uniforme.","OrderNumber":5},{"Description":"�miettez le reste de la p�te sur le dessus de la garniture aux dattes, en cr�ant une couche croustillante.","OrderNumber":6},{"Description":"Enfournez le moule dans le four pr�chauff� et faites cuire pendant environ 25 � 30 minutes, ou jusqu''� ce que le dessus soit dor�.","OrderNumber":7},{"Description":"Retirez le moule du four et laissez-le refroidir compl�tement avant de couper les carr�s aux dattes en portions.","OrderNumber":8}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'C�ne de Pizza',
	@Description = N'D�licieux c�nes de pizza croustillants et garnis � votre go�t.',
	@PreparationTime = 60,
	@CookingTime = 20,
	@Difficulty = N'Medium',
	@Author = N'Marie Dubois',
	@ImageUrl = N'https://resize-elle.ladmedia.fr/r/600,600/alias/original/img/var/plain_site/storage/images/media/images/unecuillerenbois/85546862-1-fre-FR/unecuillerenbois.jpg',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.5,
	@CategoryList = N'Plats principaux',
	@IngredientsJson = N'[	{"Name":"Farine","Description":"","Quantity":300,"Unit":"g"},
							{"Name":"Levure s�che active","Description":"","Quantity":1,"Unit":"c. � caf�"},
							{"Name":"Sucre","Description":"","Quantity":1,"Unit":"c. � caf�"},
							{"Name":"Sel","Description":"","Quantity":0.5,"Unit":"c. � caf�"},
							{"Name":"Eau ti�de","Description":"","Quantity":180,"Unit":"mL"},
							{"Name":"Huile d''olive","Description":"","Quantity":2,"Unit":"c. � soupe"},
							{"Name":"Sauce tomate","Description":"","Quantity":1,"Unit":"Unit�e"},
							{"Name":"Fromage r�p�","Description":"mozzarella, cheddar, etc.","Quantity":100,"Unit":"g"},
							{"Name":"Pepperoni ou autres garnitures","Description":"l�gumes, viandes, etc.","Quantity":1,"Unit":"Unit�e"},
							{"Name":"Basilic frais","Description":"","Quantity":1,"Unit":"Brin"}]',
	@SetpsJson = N'[{"Description":"Pr�parez la p�te en m�langeant la farine, la levure, le sucre et le sel dans un grand saladier. Faites un puits au centre et versez-y l''eau ti�de et l''huile d''olive.","OrderNumber":1},{"Description":"M�langez doucement les ingr�dients jusqu''� ce qu''ils commencent � se lier, puis p�trissez la p�te pendant environ 5 minutes jusqu''� ce qu''elle soit souple et �lastique.","OrderNumber":2},{"Description":"Formez une boule avec la p�te, couvrez le saladier d''un torchon propre et laissez reposer dans un endroit chaud pendant environ 1 heure, ou jusqu''� ce que la p�te double de volume.","OrderNumber":3},{"Description":"Pr�chauffez votre four � 220�C (thermostat 7-8) et pr�parez des c�nes en papier aluminium. Vous pouvez les fabriquer en roulant du papier aluminium en forme de c�ne, en veillant � ce qu''ils soient bien fermes.","OrderNumber":4},{"Description":"Une fois que la p�te a lev�, divisez-la en portions �gales. Prenez une portion de p�te et �talez-la sur une surface l�g�rement farin�e pour former un cercle d''environ 15 cm de diam�tre.","OrderNumber":5},{"Description":"Enroulez d�licatement le cercle de p�te autour d''un c�ne en papier aluminium, en commen�ant par la pointe du c�ne. Appuyez l�g�rement pour sceller les bords de la p�te. R�p�tez l''op�ration avec le reste de la p�te.","OrderNumber":6},{"Description":"Placez les c�nes de p�te sur une plaque de cuisson recouverte de papier sulfuris�. Enfournez-les dans le four pr�chauff� et faites-les cuire pendant environ 10 minutes, ou jusqu''� ce qu''ils soient dor�s et croustillants.","OrderNumber":7},{"Description":"Retirez les c�nes de p�te du four et laissez-les refroidir l�g�rement. Une fois refroidis, retirez d�licatement les c�nes en papier aluminium pour r�v�ler les c�nes de pizza.","OrderNumber":8},{"Description":"Remplissez les c�nes de p�te avec la sauce tomate, le fromage r�p� et les garnitures de votre choix. Assurez-vous de bien tasser les ingr�dients � l''int�rieur des c�nes.","OrderNumber":9},{"Description":"Replacez les c�nes de pizza garnis sur la plaque de cuisson et enfournez-les � nouveau pendant environ 10 minutes, ou jusqu''� ce que le fromage soit fondu et l�g�rement dor�.","OrderNumber":10},{"Description":"Sortez les c�nes de pizza du four, garnissez-les de basilic frais hach� si vous le souhaitez, et servez-les chauds.","OrderNumber":11}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Dessert Glac� au Caf� Meringu�',
	@Description = N'D�licieux dessert glac� au caf� meringu�, id�al pour les amateurs de caf� et de douceurs sucr�es.',
	@PreparationTime = 30,
	@CookingTime = 240,
	@Difficulty = N'Medium',
	@Author = N'Marie Dubois',
	@ImageUrl = N'https://assets.afcdn.com/recipe/20150923/33229_origin.jpg',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.8,
	@CategoryList = N'Desserts',
	@IngredientsJson = N'[	{"Name":"Jaunes d''�ufs","Description":"","Quantity":4,"Unit":"Unit�e"},
							{"Name":"Sucre","Description":"","Quantity":120,"Unit":"g"},
							{"Name":"Lait","Description":"","Quantity":250,"Unit":"mL"},
							{"Name":"Cr�me liquide","Description":"","Quantity":250,"Unit":"mL"},
							{"Name":"Caf� instantan�","Description":"","Quantity":2,"Unit":"c. � soupe"},
							{"Name":"Blancs d''�ufs","Description":"","Quantity":4,"Unit":"Unit�e"},
							{"Name":"Sucre","Description":"","Quantity":200,"Unit":"g"},
							{"Name":"Extrait de vanille","Description":"","Quantity":1,"Unit":"c. � caf�"}]',
	@SetpsJson = N'[{"Description":"Pr�parez la glace au caf�. Dans un grand bol, fouettez les jaunes d''�ufs avec le sucre jusqu''� ce que le m�lange blanchisse et devienne mousseux.","OrderNumber":1},{"Description":"Dans une casserole, faites chauffer le lait et la cr�me liquide � feu moyen jusqu''� ce que le m�lange commence � fr�mir. Retirez du feu.","OrderNumber":2},{"Description":"Versez lentement le m�lange de lait chaud sur le m�lange d''�ufs en remuant constamment pour �viter que les �ufs ne cuisent.","OrderNumber":3},{"Description":"Remettez le m�lange dans la casserole et faites cuire � feu doux en remuant constamment jusqu''� ce qu''il �paississe l�g�rement et nappe le dos d''une cuill�re.","OrderNumber":4},{"Description":"Ajoutez le caf� instantan� dans la casserole et m�langez jusqu''� ce qu''il soit bien incorpor�.","OrderNumber":5},{"Description":"Retirez la casserole du feu et laissez refroidir compl�tement. Une fois refroidie, placez la pr�paration au caf� au r�frig�rateur pendant au moins 2 heures, ou jusqu''� ce qu''elle soit bien froide.","OrderNumber":6},{"Description":"Pr�parez la meringue. Dans un grand bol, fouettez les blancs d''�ufs jusqu''� ce qu''ils commencent � mousser. Ajoutez progressivement le sucre tout en continuant de fouetter jusqu''� ce que la meringue forme des pics fermes et brillants. Incorporez l''extrait de vanille et m�langez d�licatement.","OrderNumber":7},{"Description":"Sortez la pr�paration au caf� du r�frig�rateur et ajoutez-y environ la moiti� de la meringue. M�langez d�licatement pour bien incorporer la meringue � la pr�paration.","OrderNumber":8},{"Description":"Versez la pr�paration au caf� dans un moule � cake ou un contenant adapt�, puis garnissez le dessus avec le reste de la meringue.","OrderNumber":9},{"Description":"Placez le moule au cong�lateur et laissez le dessert glac� prendre pendant au moins 4 heures, voire toute une nuit.","OrderNumber":10},{"Description":"Pour servir, sortez le dessert glac� au caf� meringu� du cong�lateur quelques minutes avant de le d�couper en tranches. Vous pouvez le d�guster tel quel ou le garnir de cr�me chantilly, de copeaux de chocolat ou de grains de caf�.","OrderNumber":11}]'

SELECT 'Return Value' = @return_value

GO

USE [BananaChefDB]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[AddRecipe]
	@Title = N'Dessert Glac� au Caf� Meringu�',
	@Description = N'D�licieux dessert glac� au caf� meringu�, id�al pour les amateurs de caf� et de douceurs sucr�es.',
	@PreparationTime = 30,
	@CookingTime = 240,
	@Difficulty = N'Medium',
	@Author = N'Marie Dubois',
	@ImageUrl = N'https://assets.afcdn.com/recipe/20150923/33229_origin.jpg',
	@VideoUrl = N'https://exemple.com/video',
	@Score = 4.8,
	@CategoryList = N'Desserts',
	@IngredientsJson = N'[	{"Name":"Jaunes d''�ufs","Description":"","Quantity":4,"Unit":"Unit�e"},
							{"Name":"Sucre","Description":"","Quantity":120,"Unit":"g"},
							{"Name":"Lait","Description":"","Quantity":250,"Unit":"mL"},
							{"Name":"Cr�me liquide","Description":"","Quantity":250,"Unit":"mL"},
							{"Name":"Caf� instantan�","Description":"","Quantity":2,"Unit":"c. � soupe"},
							{"Name":"Blancs d''�ufs","Description":"","Quantity":4,"Unit":"Unit�e"},
							{"Name":"Sucre","Description":"","Quantity":200,"Unit":"g"},
							{"Name":"Extrait de vanille","Description":"","Quantity":1,"Unit":"c. � caf�"}]',
	@SetpsJson = N'[{"Description":"Pr�parez la glace au caf�. Dans un grand bol, fouettez les jaunes d''�ufs avec le sucre jusqu''� ce que le m�lange blanchisse et devienne mousseux.","OrderNumber":1},{"Description":"Dans une casserole, faites chauffer le lait et la cr�me liquide � feu moyen jusqu''� ce que le m�lange commence � fr�mir. Retirez du feu.","OrderNumber":2},{"Description":"Versez lentement le m�lange de lait chaud sur le m�lange d''�ufs en remuant constamment pour �viter que les �ufs ne cuisent.","OrderNumber":3},{"Description":"Remettez le m�lange dans la casserole et faites cuire � feu doux en remuant constamment jusqu''� ce qu''il �paississe l�g�rement et nappe le dos d''une cuill�re.","OrderNumber":4},{"Description":"Ajoutez le caf� instantan� dans la casserole et m�langez jusqu''� ce qu''il soit bien incorpor�.","OrderNumber":5},{"Description":"Retirez la casserole du feu et laissez refroidir compl�tement. Une fois refroidie, placez la pr�paration au caf� au r�frig�rateur pendant au moins 2 heures, ou jusqu''� ce qu''elle soit bien froide.","OrderNumber":6},{"Description":"Pr�parez la meringue. Dans un grand bol, fouettez les blancs d''�ufs jusqu''� ce qu''ils commencent � mousser. Ajoutez progressivement le sucre tout en continuant de fouetter jusqu''� ce que la meringue forme des pics fermes et brillants. Incorporez l''extrait de vanille et m�langez d�licatement.","OrderNumber":7},{"Description":"Sortez la pr�paration au caf� du r�frig�rateur et ajoutez-y environ la moiti� de la meringue. M�langez d�licatement pour bien incorporer la meringue � la pr�paration.","OrderNumber":8},{"Description":"Versez la pr�paration au caf� dans un moule � cake ou un contenant adapt�, puis garnissez le dessus avec le reste de la meringue.","OrderNumber":9},{"Description":"Placez le moule au cong�lateur et laissez le dessert glac� prendre pendant au moins 4 heures, voire toute une nuit.","OrderNumber":10},{"Description":"Pour servir, sortez le dessert glac� au caf� meringu� du cong�lateur quelques minutes avant de le d�couper en tranches. Vous pouvez le d�guster tel quel ou le garnir de cr�me chantilly, de copeaux de chocolat ou de grains de caf�.","OrderNumber":11}]'

SELECT 'Return Value' = @return_value

GO
