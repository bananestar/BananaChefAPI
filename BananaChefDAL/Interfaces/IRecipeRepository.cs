using BananaChefDAL.Models.Recipes.RecipeViewModels;
namespace BananaChefDAL.Interfaces
{
    public interface IRecipeRepository
    {
        public Task<RecipeViewModel> GetRecipeByID(Guid RecipeID);
    }
}
