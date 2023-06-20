using BananaChefDAL.Models.Users.DTO;
using BananaChefDAL.Models.Users.ViewModels;

namespace BananaChefBLL.Interfaces
{
    public interface IUserService
    {
        public Task<UserViewModel> Login(UserLoginDTO loginDTO);

        public Task<bool> Register(UserRegisterDTO registerDTO);
    }
}
