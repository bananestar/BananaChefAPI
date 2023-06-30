using BananaChefDAL.Models.Recipes.DTO;
using BananaChefDAL.Models.Recipes.RecipeViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BananaChefBLL.Interfaces
{
    public interface IRecipeService
    {
        public Task<RecipeViewModel> GetRecipeByID(Guid recipeID);

        public Task<IEnumerable<RecipeAllView>> GetAllRecipe();

        public Task<string> DeleteRecipe(Guid recipeID);

        public Task<RecipeViewModel> UpdateRecipe(UpdateRecipeDTO recipe);
    }
}
