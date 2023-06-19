using BananaChefDAL.Models.Users.ViewModels;

namespace BananaChefDAL.Models.Users.Mapper
{
    public static class UserMapper
    {
        public static User ToUser(this UserViewModel userViewModel)
        {
            return new User
            {
                UserID = userViewModel.UserID,
                Username = userViewModel.Username,
                Email = userViewModel.Email,
                IsAdmin = userViewModel.IsAdmin,
                ProfileImageUrl = userViewModel.ProfileImageUrl,
                CreatedAt = userViewModel.CreatedAt,
                UpdatedAt = userViewModel.UpdatedAt,
            };
        }

        public static UserViewModel ToUserViewModel(this User user)
        {
            return new UserViewModel
            {
                UserID = user.UserID,
                Username = user.Username,
                Email = user.Email,
                IsAdmin = user.IsAdmin,
                ProfileImageUrl = user.ProfileImageUrl,
                CreatedAt = user.CreatedAt,
                UpdatedAt = user.UpdatedAt
            };
        }
    }
}


