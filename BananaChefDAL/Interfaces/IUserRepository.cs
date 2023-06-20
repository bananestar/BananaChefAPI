using BananaChefDAL.Models.Users;
using BananaChefDAL.Models.Users.DTO;

namespace BananaChefDAL.Interfaces
{
    public interface IUserRepository
    {
        public Task<User> LoginUser(UserLoginDTO loginDTO);

        public Task<bool> RegisterUser(UserRegisterDTO registerDTO);
    }
}
