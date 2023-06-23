using System.ComponentModel.DataAnnotations;

namespace BananaChefDAL.Models.Users.DTO
{
    public class ChangeEmailDTO
    {
        [Required(ErrorMessage = "Identifier is required (UserID)")]
        public Guid UserID { get; set; }

        [Required(ErrorMessage = "New email is required.")]
        [EmailAddress(ErrorMessage = "New email is not valid.")]
        public string NewEmail { get; set; }

        [Required(ErrorMessage = "Current password is required.")]
        public string CurrentPassword { get; set; }

        [Required(ErrorMessage = "Confirmation password is required.")]
        [Compare("CurrentPassword", ErrorMessage = "The confirmation password does not match the current password.")]
        public string ConfirmPassword { get; set; }
    }
}
