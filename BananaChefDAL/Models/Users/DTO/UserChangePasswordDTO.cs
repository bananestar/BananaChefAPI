using System.ComponentModel.DataAnnotations;

namespace BananaChefDAL.Models.Users.DTO
{
    public class ChangePasswordDTO
    {
        [Required(ErrorMessage = "Identifier is required (UserID)")]
        public Guid UserID { get; set; }

        [Required(ErrorMessage = "Current password is required.")]
        public string CurrentPassword { get; set; }

        [Required(ErrorMessage = "New password is required.")]
        [StringLength(100, ErrorMessage = "The new password must be between {2} and {1} characters.", MinimumLength = 8)]
        [RegularExpression(@"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!]).{8,30}$", ErrorMessage = "The new password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be between 8 and 30 characters.")]
        public string NewPassword { get; set; }

        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmNewPassword { get; set; }
    }
}
