using BananaChefDAL.Models.Users;
using BananaChefDAL.Models.Users.DTO;
using BananaChefDAL.Models.Users.ViewModels;

namespace BananaChefDAL.Interfaces
{
    public interface IUserRepository
    {
        public Task<User> LoginUser(UserLoginDTO loginDTO);

        public Task<bool> RegisterUser(UserRegisterDTO registerDTO);
    }
}
