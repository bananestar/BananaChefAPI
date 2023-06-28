using BananaChefDAL.Models.Users;
using BananaChefDAL.Models.Users.DTO;
using BananaChefDAL.Models.Users.ViewModels;

namespace BananaChefDAL.Interfaces
{
    public interface IUserRepository
    {
        // Méthode pour connecter un utilisateur
        public Task<User> LoginUser(UserLoginDTO loginDTO);

        // Méthode pour enregistrer un utilisateur
        public Task<object> RegisterUser(UserRegisterDTO registerDTO);

        // Méthode pour changer l'email de l'utilisateur
        public Task<object> ChangeEmailUser(ChangeEmailDTO changeEmailDTO);

        // Méthode pour changer le mots de passe de l'utilisateur
        public Task<object> ChangePasswordUser(ChangePasswordDTO changePasswordDTO);

        // Méthode pour changer le status de l'utilisateur
        public Task<object> ChangeStatusUser(ChangeAdminStatusDTO changeAdminStatusDTO);

        // Méthode pour recupérer un utilisateur via son userID
        public Task<UserViewModel> GetByID(Guid UserID);
    }
}
