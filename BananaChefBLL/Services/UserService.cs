using BananaChefBLL.Interfaces;
using BananaChefDAL.Interfaces;
using BananaChefDAL.Models.Users;
using BananaChefDAL.Models.Users.DTO;
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

        // Méthode pour changer l'email de l'utilisateur
        public async Task<object> ChangeEmail(ChangeEmailDTO changeEmailDTO)
        {
            return await _userRepository.ChangeEmailUser(changeEmailDTO);
        }

        // Méthode pour changer le mots de passe de l'utilisateur
        public async Task<object> ChangePassword(ChangePasswordDTO changePasswordDTO)
        {
            return await _userRepository.ChangePasswordUser(changePasswordDTO);
        }

        // Méthode pour connecter un utilisateur
        public async Task<string?> Login(UserLoginDTO loginDTO)
        {
            User user = await _userRepository.LoginUser(loginDTO);

            if (user is not null)
                return _jwtService.GetJwt(user);

            return null;
        }

        // Méthode pour changer le mots de passe de l'utilisateur
        public async Task<object> Register(UserRegisterDTO registerDTO)
        {
            return await _userRepository.RegisterUser(registerDTO);
        }

        // Méthode pour changer le status de l'utilisateur
        public async Task<object> ChangeStatus(ChangeAdminStatusDTO changeAdminStatusDTO)
        {
            return await _userRepository.ChangeStatusUser(changeAdminStatusDTO);
        }

        public async Task<UserViewModel> GetByID(Guid UserID)
        {
            return await _userRepository.GetByID(UserID);
        }
    }
}
