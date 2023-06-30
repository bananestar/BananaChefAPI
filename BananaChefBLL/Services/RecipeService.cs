using BananaChefBLL.Interfaces;
using BananaChefDAL.Interfaces;
using BananaChefDAL.Models.Recipes.DTO;
using BananaChefDAL.Models.Recipes.RecipeViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BananaChefBLL.Services
{
    public class RecipeService : IRecipeService
    {
        private readonly IRecipeRepository _recipeRepository;

        public RecipeService(IRecipeRepository recipeRepository)
        {
            _recipeRepository = recipeRepository;
        }

        public async Task<string> DeleteRecipe(Guid recipeID)
        {
            return await _recipeRepository.DeleteRecipe(recipeID);
        }

        public async Task<IEnumerable<RecipeAllView>> GetAllRecipe()
        {
            return await _recipeRepository.GetAllRecipe();
        }

        public async Task<RecipeViewModel> GetRecipeByID(Guid recipeID)
        {
            return await _recipeRepository.GetRecipeByID(recipeID);
        }

        public async Task<RecipeViewModel> UpdateRecipe(UpdateRecipeDTO recipe)
        {
            return await _recipeRepository.UpdateRecipe(recipe);
        }
    }
}
