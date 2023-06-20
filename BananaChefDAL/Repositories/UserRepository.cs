using BananaChefDAL.Context;
using BananaChefDAL.Interfaces;
using BananaChefDAL.Models.Users;
using BananaChefDAL.Models.Users.DTO;
using Microsoft.EntityFrameworkCore;

namespace BananaChefDAL.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly DataContext _dataContext;

        public UserRepository(DataContext dataContext)
        {
            _dataContext = dataContext;
        }

        public async Task<User> LoginUser(UserLoginDTO loginDTO)
        {
            try
            {
                var loginResult = await _dataContext.LoginUser(loginDTO.EmailOrUsername, loginDTO.Password);

                if (loginResult.Message == "Login successful")
                {
                    var loggedInUser = await _dataContext.Users.FirstOrDefaultAsync(
                        u => u.UserID == loginResult.UserID.Value);

                    return loggedInUser;
                }
            }
            catch (Exception e)
            {
                // Gérer l'exception ici
                await Console.Out.WriteLineAsync("*******--Erreur connection--*******");
                await Console.Out.WriteLineAsync(e.ToString());
            }

            return null;
        }

        public async Task<bool> RegisterUser(UserRegisterDTO registerDTO)
        {
            try
            {
                await _dataContext.Database.ExecuteSqlRawAsync("EXEC RegisterUser {0}, {1}, {2}", registerDTO.Username, registerDTO.Email, registerDTO.Password);
                return true;
            }
            catch (Exception e)
            {
                await Console.Out.WriteLineAsync(e.ToString());
                return false;
            }

        }
    }
}
