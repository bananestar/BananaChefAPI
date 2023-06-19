using System.ComponentModel.DataAnnotations;

namespace BananaChefDAL.Models.Users.DTO
{
    public class ChangeAdminStatusDTO
    {
        [Required(ErrorMessage = "User ID is required.")]
        public Guid UserID { get; set; }

        [Required(ErrorMessage = "New admin status is required.")]
        public bool IsAdmin { get; set; }
    }
}
