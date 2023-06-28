-- Recette : Gâteau au chocolat
DECLARE @RecipeID_Gateau UNIQUEIDENTIFIER
EXEC [dbo].[AddRecipe]
    @Title = 'Gâteau au chocolat',
    @Description = 'Délicieux gâteau moelleux au chocolat.',
    @PreparationTime = 30,
    @CookingTime = 45,
    @Difficulty = 'Easy',
    @Author = 'John Doe',
    @ImageUrl = 'https://example.com/gateau-au-chocolat.jpg',
    @VideoUrl = NULL,
    @Score = 4.5,
    @CategoryList = 'Desserts',
    @IngredientsJson = '[
        {"Name": "Farine", "Description": "", "Quantity": 250, "Unit": "g"},
        {"Name": "Sucre", "Description": "", "Quantity": 200, "Unit": "g"},
        {"Name": "Œufs", "Description": "", "Quantity": 4},
        {"Name": "Lait", "Description": "", "Quantity": 200, "Unit": "ml"},
        {"Name": "Beurre", "Description": "", "Quantity": 150, "Unit": "g"},
        {"Name": "Chocolat", "Description": "", "Quantity": 200, "Unit": "g"}
    ]',
    @SetpsJson = '[
        {"Description": "Préchauffer le four à 180°C.", "OrderNumber": 1},
        {"Description": "Mélanger la farine, le sucre et les œufs.", "OrderNumber": 2},
        {"Description": "Ajouter le lait et le beurre fondu.", "OrderNumber": 3},
        {"Description": "Incorporer le chocolat fondu à la préparation.", "OrderNumber": 4},
        {"Description": "Verser la pâte dans un moule et enfourner pendant 45 minutes.", "OrderNumber": 5},
        {"Description": "Laisser refroidir avant de démouler et de servir.", "OrderNumber": 6}
    ]',
    @RecipeID = @RecipeID_Gateau OUTPUT;

-- Recette : Crêpes
DECLARE @RecipeID_Crepes UNIQUEIDENTIFIER
EXEC [dbo].[AddRecipe]
    @Title = 'Crêpes classiques',
    @Description = 'Délicieuses crêpes à déguster au petit-déjeuner.',
    @PreparationTime = 15,
    @CookingTime = 20,
    @Difficulty = 'Easy',
    @Author = 'Jane Smith',
    @ImageUrl = 'https://example.com/crepes-classiques.jpg',
    @VideoUrl = NULL,
    @Score = 4.8,
    @CategoryList = 'Petit-déjeuner,Desserts',
    @IngredientsJson = '[
        {"Name": "Farine de blé", "Description": "", "Quantity": 250, "Unit": "g"},
        {"Name": "Sucre en poudre", "Description": "", "Quantity": 30, "Unit": "g"},
        {"Name": "Œufs", "Description": "", "Quantity": 3},
        {"Name": "Lait", "Description": "", "Quantity": 500, "Unit": "ml"},
        {"Name": "Sel", "Description": "", "Quantity": 1, "Unit": "pincée"},
        {"Name": "Beurre", "Description": "", "Quantity": 30, "Unit": "g"}
    ]',
    @SetpsJson = '[
        {"Description": "Dans un saladier, mélanger la farine, le sucre et le sel.", "OrderNumber": 1},
        {"Description": "Ajouter les œufs et mélanger.", "OrderNumber": 2},
        {"Description": "Verser le lait progressivement en mélangeant continuellement.", "OrderNumber": 3},
        {"Description": "Ajouter le beurre fondu à la préparation et mélanger.", "OrderNumber": 4},
        {"Description": "Laisser reposer la pâte pendant 30 minutes.", "OrderNumber": 5},
        {"Description": "Faire chauffer une poêle légèrement beurrée.", "OrderNumber": 6},
        {"Description": "Verser une louche de pâte dans la poêle et faire cuire les crêpes des deux côtés.", "OrderNumber": 7},
        {"Description": "Répéter l''opération jusqu''à épuisement de la pâte.", "OrderNumber": 8},
        {"Description": "Servir les crêpes chaudes avec votre garniture préférée.", "OrderNumber": 9}
    ]',
    @RecipeID = @RecipeID_Crepes OUTPUT;

-- Recette : Steak frites
DECLARE @RecipeID_SteakFrites UNIQUEIDENTIFIER
EXEC [dbo].[AddRecipe]
    @Title = 'Steak frites',
    @Description = 'Un plat principal classique : un steak accompagné de frites croustillantes.',
    @PreparationTime = 20,
    @CookingTime = 30,
    @Difficulty = 'Hard',
    @Author = 'Robert Johnson',
    @ImageUrl = 'https://example.com/steak-frites.jpg',
    @VideoUrl = NULL,
    @Score = 4.2,
    @CategoryList = 'Plats principaux',
    @IngredientsJson = '[
        {"Name": "Steak", "Description": "", "Quantity": 2},
        {"Name": "Pommes de terre", "Description": "", "Quantity": 500, "Unit": "g"},
        {"Name": "Huile végétale", "Description": "", "Quantity": 500, "Unit": "ml"},
        {"Name": "Sel", "Description": "", "Quantity": null, "Unit": null},
        {"Name": "Poivre", "Description": "", "Quantity": null, "Unit": null}
    ]',
    @SetpsJson = '[
        {"Description": "Préchauffer le four à 180°C.", "OrderNumber": 1},
        {"Description": "Cuire les pommes de terre coupées en frites dans l''huile chaude.", "OrderNumber": 2},
        {"Description": "Cuire les steaks à la poêle.", "OrderNumber": 3},
        {"Description": "Saler et poivrer les steaks selon votre goût.", "OrderNumber": 4},
        {"Description": "Servir les steaks accompagnés des frites croustillantes.", "OrderNumber": 5}
    ]',
    @RecipeID = @RecipeID_SteakFrites OUTPUT;
