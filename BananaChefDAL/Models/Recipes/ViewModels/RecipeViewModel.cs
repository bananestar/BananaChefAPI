using System.ComponentModel.DataAnnotations;

namespace BananaChefDAL.Models.Recipes.RecipeViewModels
{
    public class RecipeViewModel
    {
        public Guid RecipeID { get; set; }

        [Required(ErrorMessage = "The Title field is required.")]
        [StringLength(100, ErrorMessage = "The Title field must not exceed {1} characters.")]
        public string Title { get; set; }

        [Required(ErrorMessage = "The Description field is required.")]
        public string Description { get; set; }

        [Required(ErrorMessage = "The PreparationTime field is required.")]
        [Range(1, int.MaxValue, ErrorMessage = "The PreparationTime field must be a positive integer.")]
        public int PreparationTime { get; set; }

        [Required(ErrorMessage = "The CookingTime field is required.")]
        [Range(1, int.MaxValue, ErrorMessage = "The CookingTime field must be a positive integer.")]
        public int CookingTime { get; set; }

        [Required(ErrorMessage = "The Difficulty field is required.")]
        [RegularExpression("^(Easy|Medium|Hard)$", ErrorMessage = "The Difficulty field must be 'Easy', 'Medium', or 'Hard'.")]
        public string Difficulty { get; set; }

        public string Author { get; set; }
        public string ImageUrl { get; set; }
        public string VideoUrl { get; set; }

        [Range(0, 10, ErrorMessage = "The Score field must be between {1} and {2}.")]
        public decimal Score { get; set; }

        public DateTime CreatedAt { get; set; }
        public DateTime UpdateAt { get; set; }


        public ICollection<IngredientViewModel> Ingredients { get; set; }
        public ICollection<CategoryViewModel> Categories { get; set; }
        public ICollection<StepViewModel> Steps { get; set; }
    }

    public class IngredientViewModel
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Quantity { get; set; }
        public string Unit { get; set; }
    }

    public class CategoryViewModel
    {
        public string Name { get; set; }
    }

    public class StepViewModel
    {
        public string Description { get; set; }
        public int OrderNumber { get; set; }
    }

    public class RecipeRaw
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
        public DateTime CreatedAt { get; set; }
        public DateTime UpdateAt { get; set; }

    }

    public class RecipeAllView
    {
        public Guid RecipeID { get; set; }
        public string Title { get; set; }
        public string ImageUrl { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdateAt { get; set; }
    }
}

