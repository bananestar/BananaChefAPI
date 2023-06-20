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
            return await _dataContext.Users.FromSqlRaw("EXEC LoginUser {0}, {1}", loginDTO.EmailOrUsername, loginDTO.Password).FirstOrDefaultAsync();
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
                await Console.Out.WriteLineAsync(e.Message);
                return false;
            }

        }
    }
}
