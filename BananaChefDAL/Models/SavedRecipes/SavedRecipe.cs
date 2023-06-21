using BananaChefDAL.Models.Recipes;
using BananaChefDAL.Models.Users;

namespace BananaChefDAL.Models.SavedRecipes
{
    public class SavedRecipe
    {
        public Guid SavedRecipeId { get; set; }
        public Guid UserId { get; set; }
        public Guid RecipeId { get; set; }
        public DateTime SavedAt { get; set; }

        public User User { get; set; }
        public Recipe Recipe { get; set; }
    }
}
