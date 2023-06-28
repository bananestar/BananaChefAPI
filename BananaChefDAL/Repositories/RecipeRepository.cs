using BananaChefDAL.Interfaces;
using BananaChefDAL.Models.Recipes;
using BananaChefDAL.Models.Recipes.RecipeViewModels;
using Dapper;
using System.Data;

namespace BananaChefDAL.Repositories
{
    public class RecipeRepository : IRecipeRepository
    {
        private readonly IDbConnection _connection;

        public RecipeRepository(IDbConnection connection)
        {
            _connection = connection;
        }

        public async Task<RecipeViewModel> GetRecipeByID(Guid recipeID)
        {
            try
            {
                var recipeQuery = "GetDetailsRecipe";
                var parameters = new { RecipeID = recipeID };

                using (var multi = await _connection.QueryMultipleAsync(recipeQuery, parameters, commandType: CommandType.StoredProcedure))
                {
                    var recipe = await multi.ReadSingleOrDefaultAsync<Recipe>();

                    if (recipe != null)
                    {
                        var ingredients = await multi.ReadAsync<RecipeIngredient>();
                        var categories = await multi.ReadAsync<Category>();
                        var steps = await multi.ReadAsync<Step>();

                        var recipeViewModel = new RecipeViewModel
                        {
                            RecipeID = recipe.RecipeID,
                            Title = recipe.Title,
                            Description = recipe.Description,
                            PreparationTime = recipe.PreparationTime,
                            CookingTime = recipe.CookingTime,
                            Difficulty = recipe.Difficulty,
                            Score = recipe.Score,
                            CreatedAt = recipe.CreatedAt,
                            Ingredients = MapToIngredientViewModels(ingredients).ToList(),
                            Categories = MapToCategoryViewModels(categories).ToList(),
                            Steps = MapToStepViewModels(steps).ToList()
                        };

                        return recipeViewModel;
                    }
                }
            }
            catch (Exception ex)
            {
                // Gérer les erreurs de manière appropriée
                Console.WriteLine($"Une erreur s'est produite lors de la récupération de la recette : {ex.Message}");
            }

            return null;
        }

        private List<IngredientViewModel> MapToIngredientViewModels(IEnumerable<RecipeIngredient> ingredients)
        {
            return ingredients.Select(i => new IngredientViewModel
            {
                Name = i.Ingredient.Name,
                Description = i.Ingredient.Description,
                Quantity = i.Quantity,
                Unit = i.Unit
            }).ToList();
        }

        private List<CategoryViewModel> MapToCategoryViewModels(IEnumerable<Category> categories)
        {
            return categories.Select(c => new CategoryViewModel
            {
                Name = c.Name
            }).ToList();
        }

        private List<StepViewModel> MapToStepViewModels(IEnumerable<Step> steps)
        {
            return steps.Select(s => new StepViewModel
            {
                Description = s.Description,
                OrderNumber = s.OrderNumber
            }).ToList();
        }
    }
}
