namespace BananaChefDAL.Models.Users.ViewModels
{
    public class UserViewModel
    {
        public Guid UserID { get; set; }
        public string Username { get; set; }

        public string Email { get; set; }

        public bool IsAdmin { get; set; }

        public string ProfileImageUrl { get; set; }

        public DateTime CreatedAt { get; set; }

        public DateTime UpdatedAt { get; set; }
    }
}
