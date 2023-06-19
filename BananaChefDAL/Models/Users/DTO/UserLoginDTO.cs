using System.ComponentModel.DataAnnotations;

namespace BananaChefDAL.Models.Users.DTO
{
    public class UserLoginDTO
    {
        [Required(ErrorMessage = "Email or username is required.")]
        public string EmailOrUsername { get; set; }

        [Required(ErrorMessage = "Password is required.")]
        public string Password { get; set; }
    }
}
