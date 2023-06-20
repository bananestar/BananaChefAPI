using BananaChefDAL.Models.Users.DTO;

namespace BananaChefBLL.Interfaces
{
    public interface IUserService
    {
        public Task<string?> Login(UserLoginDTO loginDTO);

        public Task<bool> Register(UserRegisterDTO registerDTO);
    }
}
