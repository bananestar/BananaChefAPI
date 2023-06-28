//using BananaChefDAL.Models.SavedRecipes;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace BananaChefDAL.Models.Users
{
    [Table("User")]
    public class User
    {
        public User() { }

        public User(string username, string email, string password, bool isAdmin = false, string? profileImageUrl = null, DateTime? createdAt = null, DateTime? updatedAt = null)
        {
            Username = username;
            Email = email;
            Password = password;
            IsAdmin = isAdmin;
            ProfileImageUrl = profileImageUrl;
            CreatedAt = createdAt ?? DateTime.Now;
            UpdatedAt = updatedAt ?? DateTime.Now;
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid UserID { get; set; }

        [Required(ErrorMessage = "Username is required")]
        [StringLength(30, ErrorMessage = "Username cannot exceed {1} characters.")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Email is required.")]
        [StringLength(255, ErrorMessage = "Email cannot exceed {1} characters.")]
        [EmailAddress(ErrorMessage = "Email is not valid")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [StringLength(100, ErrorMessage = "Password must be between {2} and {1} characters.", MinimumLength = 8)]
        [RegularExpression(@"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!]).{8,30}$", ErrorMessage = "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be between 8 and 30 characters.")]
        public string Password { get; set; }

        [NotNull]
        public string Salt { get; set; }

        [DefaultValue(false)]
        public bool IsAdmin { get; set; }

        [Url(ErrorMessage = "Profile image URL is not valid.")]
        public string ProfileImageUrl { get; set; }

        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        //public ICollection<SavedRecipe> SavedRecipes { get; set; }
    }
}
