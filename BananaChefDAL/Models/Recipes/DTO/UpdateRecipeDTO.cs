using BananaChefDAL.Models.Recipes.RecipeViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BananaChefDAL.Models.Recipes.DTO
{
    public class UpdateRecipeDTO
    {
        public Guid RecipeID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int PreparationTime { get; set; }
        public int CookingTime { get; set; }
        public string Difficulty { get; set; }
        public string Author { get; set; }
        public string ImageUrl { get; set; }
        public string VideoUrl { get; set; }
        public decimal Score { get; set; }
        public ICollection<IngredientViewModel> Ingredients { get; set; }
        public ICollection<CategoryViewModel> Categories { get; set; }
        public ICollection<StepViewModel> Steps { get; set; }

    }


}
