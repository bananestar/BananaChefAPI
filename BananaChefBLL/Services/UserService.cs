using BananaChefBLL.Interfaces;
using BananaChefDAL.Interfaces;
using BananaChefDAL.Models.Users;
using BananaChefDAL.Models.Users.DTO;
using BananaChefDAL.Models.Users.Mapper;
using BananaChefDAL.Models.Users.ViewModels;

namespace BananaChefBLL.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;
        private readonly IJwtService _jwtService;

        public UserService(IUserRepository userRepository, IJwtService jwtService)
        {
            _userRepository = userRepository;
            _jwtService = jwtService;
        }

        public async Task<UserViewModel> Login(UserLoginDTO loginDTO)
        {
            User user = await _userRepository.LoginUser(loginDTO);
            return user.ToUserViewModel();
        }

        public async Task<bool> Register(UserRegisterDTO registerDTO)
        {
            return await _userRepository.RegisterUser(registerDTO);
        }
    }
}
