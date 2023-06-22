using BananaChefDAL.Context;
using BananaChefDAL.Interfaces;
using BananaChefDAL.Models.Users;
using BananaChefDAL.Models.Users.DTO;
using BananaChefDAL.Models.Users.Mapper;
using BananaChefDAL.Models.Users.ViewModels;
using BananaChefDAL.Utilities;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Data;
using System.Text;

namespace BananaChefDAL.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly IDbConnection connection;

        public UserRepository(IDbConnection connection)
        {
            this.connection = connection;
        }

        public async Task<User> LoginUser(UserLoginDTO loginDTO)
        {
            try
            {
                var sql = "exec LoginUser @identifier, @password, @message OUTPUT, @UserResult OUTPUT";
                var parameters = new DynamicParameters();
                parameters.Add("@identifier", loginDTO.EmailOrUsername);
                parameters.Add("@password", loginDTO.Password);
                parameters.Add("@message", dbType: DbType.String, size: 100, direction: ParameterDirection.Output);
                parameters.Add("@UserResult", dbType: DbType.String, size: -1, direction: ParameterDirection.Output);

                await connection.ExecuteAsync(sql, parameters);

                
                var message = parameters.Get<string>("@message");

                var jsonResponse = parameters.Get<string>("@UserResult");
                // jsonresponse => jsonArray
                JArray jsonArray = JArray.Parse(jsonResponse);
                // jsonArray => jsonObject
                JObject jsonObject = (JObject)jsonArray[0];
                // jsonObject => User user
                User user = jsonObject.ToObject<User>();

                if (user == null)
                {
                    MessageUtilities.ErrorMessage(message);
                    return null;
                }

                await Console.Out.WriteLineAsync(message);
                return user;
            }
            catch (Exception e)
            {
                MessageUtilities.ErrorMessage(e.ToString());
                return null;
            }
        }

        public async Task<bool> RegisterUser(UserRegisterDTO registerDTO)
        {
           
            try
            {
                var sql = "exec RegisterUser @username, @email, @pwd";
                var value = new { username = registerDTO.Username, email = registerDTO.Email, pwd = registerDTO.Password};

                connection.Execute(sql, value);

                return true;
            }
            catch (Exception e)
            {
                MessageUtilities.ErrorMessage(e.ToString());
                return false;
            }
        }


    }
}


