using System.ComponentModel.DataAnnotations;

namespace BananaChefDAL.Models.Recipes
{
    public class Recipe
    {
        [Key]
        public Guid RecipeId { get; set; }

        [Required]
        [MaxLength(255)]
        public string Title { get; set; }

        [MaxLength]
        public string Description { get; set; }

        [Required]
        public int PreparationTime { get; set; }

        [Required]
        public int CookingTime { get; set; }

        [Required]
        [MaxLength(255)]
        public string Author { get; set; }

        [Url]
        public string ImageUrl { get; set; }

        [Url]
        public string VideoUrl { get; set; }

        [Required]
        public DifficultyEnum Difficulty { get; set; }

        public decimal Score { get; set; } = 0;

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public DateTime UpdatedAt { get; set; } = DateTime.Now;

        //public ICollection<SavedRecipe> SavedRecipes { get; set; }
    }

    public enum DifficultyEnum
    {
        Easy,
        Medium,
        Hard
    }
}
