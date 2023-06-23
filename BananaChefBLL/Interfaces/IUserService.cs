using BananaChefDAL.Models.Users.DTO;

namespace BananaChefBLL.Interfaces
{
    public interface IUserService
    {
        // Méthode pour connecter un utilisateur
        public Task<string?> Login(UserLoginDTO loginDTO);

        // Méthode pour enregistrer un utilisateur
        public Task<object> Register(UserRegisterDTO registerDTO);

        // Méthode pour changer l'email de l'utilisateur
        public Task<object> ChangeEmail(ChangeEmailDTO changeEmailDTO);

        // Méthode pour changer le mots de passe de l'utilisateur
        public Task<object> ChangePassword(ChangePasswordDTO changePasswordDTO);
    }
}
