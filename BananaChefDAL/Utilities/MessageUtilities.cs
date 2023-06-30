using Dapper;

namespace BananaChefDAL.Utilities
{
    public static class MessageUtilities
    {

        public static void Message(bool? isValid, string msg)
        {
            if (isValid == true)
            {
                Console.WriteLine("*******--Success--*******");
                Console.WriteLine(msg);
            }
            if (isValid == false)
            {
                Console.WriteLine("*******--Erreur Niveau n°1--*******");
                Console.WriteLine(msg);
            }
            if (isValid == null)
            {
                Console.WriteLine("*******--Erreur Niveau n°2--*******");
                Console.WriteLine(msg);
            }
        }

        public static async Task PrintRecipe(SqlMapper.GridReader multiResult)
        {
            await Console.Out.WriteLineAsync("-------------------recipe---------------------");
            // Récupérer les informations de base de la recette
            var recipe = await multiResult.ReadFirstOrDefaultAsync();
            await Console.Out.WriteLineAsync($"RecipeID: {recipe.RecipeID}");
            await Console.Out.WriteLineAsync($"Title: {recipe.Title}");
            await Console.Out.WriteLineAsync($"Description: {recipe.Description}");
            await Console.Out.WriteLineAsync($"PreparationTime: {recipe.PreparationTime}");
            await Console.Out.WriteLineAsync($"CookingTime: {recipe.CookingTime}");
            await Console.Out.WriteLineAsync($"Difficulty: {recipe.Difficulty}");
            await Console.Out.WriteLineAsync($"Score: {recipe.Score}");
            await Console.Out.WriteLineAsync($"CreatedAt: {recipe.CreatedAt}");

            await Console.Out.WriteLineAsync("-----------------ingredients-------------------");
            // Récupérer la liste des ingrédients de la recette
            var ingredients = await multiResult.ReadAsync();
            foreach (var ingredient in ingredients)
            {
                await Console.Out.WriteLineAsync($"Ingredient: {ingredient.Name}");
                await Console.Out.WriteLineAsync($"Description: {ingredient.Description}");
                await Console.Out.WriteLineAsync($"Quantity: {ingredient.Quantity}");
                await Console.Out.WriteLineAsync($"Unit: {ingredient.Unit}");
            }
            await Console.Out.WriteLineAsync("--------------------steps----------------------");
            // Récupérer la liste des étapes de la recette
            var steps = await multiResult.ReadAsync();
            foreach (var step in steps)
            {
                await Console.Out.WriteLineAsync($"Step Description: {step.Description}");
                await Console.Out.WriteLineAsync($"Order Number: {step.OrderNumber}");
            }

            await Console.Out.WriteLineAsync("-----------------categories--------------------");
            // Récupérer la liste des catégories de la recette
            var categories = await multiResult.ReadAsync();
            foreach (var category in categories)
            {
                await Console.Out.WriteLineAsync($"Category: {category.Name}");
            }
            await Console.Out.WriteLineAsync("-----------------------------------------------");
        }
    }
}
