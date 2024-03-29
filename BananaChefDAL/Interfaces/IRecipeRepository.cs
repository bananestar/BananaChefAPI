﻿using BananaChefDAL.Models.Recipes.DTO;
using BananaChefDAL.Models.Recipes.RecipeViewModels;
namespace BananaChefDAL.Interfaces
{
    public interface IRecipeRepository
    {
        public Task<RecipeViewModel> GetRecipeByID(Guid RecipeID);

        public Task<IEnumerable<RecipeAllView>> GetAllRecipe();

        public Task<string> DeleteRecipe(Guid recipeID);

        public Task<RecipeViewModel> UpdateRecipe(UpdateRecipeDTO recipe);
    }
}
