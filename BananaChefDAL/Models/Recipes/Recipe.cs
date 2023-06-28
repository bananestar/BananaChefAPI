using BananaChefDAL.Models.Recipes.Utilities;
using System.ComponentModel.DataAnnotations;

namespace BananaChefDAL.Models.Recipes
{
    public class Recipe
    {
        [Key]
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

        [Range(0, 10, ErrorMessage = "The Score field must be between {1} and {2}.")]
        public decimal Score { get; set; }

        public DateTime CreatedAt { get; set; }

        public ICollection<RecipeIngredient> RecipeIngredients { get; set; }
        public ICollection<RecipeCategory> RecipeCategories { get; set; }
        public ICollection<Step> Steps { get; set; }
    }

    public class Ingredient
    {
        [Key]
        public Guid IngredientID { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        [StringLength(50, ErrorMessage = "The Name field must not exceed {1} characters.")]
        public string Name { get; set; }

        public string Description { get; set; }

        public DateTime CreatedAt { get; set; }

        public ICollection<RecipeIngredient> RecipeIngredients { get; set; }
    }

    public class Category
    {
        [Key]
        public Guid CategoryID { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        [StringLength(100, ErrorMessage = "The Name field must not exceed {1} characters.")]
        public string Name { get; set; }

        public ICollection<RecipeCategory> RecipeCategories { get; set; }
    }

    public class Step
    {
        [Key]
        public Guid StepID { get; set; }

        public Guid RecipeID { get; set; }

        [Required(ErrorMessage = "The Description field is required.")]
        public string Description { get; set; }

        [Required(ErrorMessage = "The OrderNumber field is required.")]
        public int OrderNumber { get; set; }

        public DateTime CreatedAt { get; set; }

        public Recipe Recipe { get; set; }
    }

    public class RecipeIngredient
    {
        [Key]
        public Guid RecipeIngredientID { get; set; }

        public Guid RecipeID { get; set; }

        public Guid IngredientID { get; set; }

        [Required(ErrorMessage = "The Quantity field is required.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "The Quantity field must be a positive number.")]
        public decimal Quantity { get; set; }

        [Required(ErrorMessage = "The unit is required.")]
        [RegularExpression("^(" + nameof(IngredientUnit.GetValidUnits) + ")$", ErrorMessage = "Invalid unit.")]
        public string Unit { get; set; }

        public DateTime CreatedAt { get; set; }

        public Recipe Recipe { get; set; }
        public Ingredient Ingredient { get; set; }
    }

    public class RecipeCategory
    {
        [Key]
        public Guid RecipeCategoryID { get; set; }

        public Guid RecipeID { get; set; }

        public Guid CategoryID { get; set; }

        public DateTime CreatedAt { get; set; }

        public Recipe Recipe { get; set; }
        public Category Category { get; set; }
    }

}
