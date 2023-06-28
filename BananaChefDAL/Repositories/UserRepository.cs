using BananaChefDAL.Interfaces;
using BananaChefDAL.Models.Users;
using BananaChefDAL.Models.Users.DTO;
using BananaChefDAL.Models.Users.Mapper;
using BananaChefDAL.Models.Users.ViewModels;
using BananaChefDAL.Utilities;
using Dapper;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json.Linq;
using System.Data;

namespace BananaChefDAL.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly IDbConnection connection;

        public UserRepository(IDbConnection connection)
        {
            this.connection = connection;
        }

        // Classe Response pour stocker les résultats et les messages
        public class Response
        {
            public string message { get; set; }
            public bool? rep { get; set; }
        }

        // Méthode pour changer le mots de passe de l'utilisateur
        public async Task<object> ChangePasswordUser(ChangePasswordDTO changePasswordDTO)
        {
            Response rep = new Response();
            rep.rep = false;

            try
            {
                var sql = "exec ChangePasswordUser @password, @newPassword, @userID, @message OUTPUT";
                var parameters = new DynamicParameters();
                parameters.Add("@password", changePasswordDTO.CurrentPassword);
                parameters.Add("@newPassword", changePasswordDTO.NewPassword);
                parameters.Add("@userID", changePasswordDTO.UserID);
                parameters.Add("@message", dbType: DbType.String, size: 100, direction: ParameterDirection.Output);

                await connection.ExecuteAsync(sql, parameters);

                rep.message = Convert.ToString(parameters.Get<string>("@message"));
                if (rep.message == "Password changed successfully")
                    rep.rep = true;
                if (rep.message == null || rep.message == "")
                    rep.rep = null;
            }
            catch (Exception e)
            {
                rep.message = e.ToString();
            }

            MessageUtilities.Message(rep.rep, rep.message);
            return rep;
        }

        // Méthode pour changer l'email de l'utilisateur
        public async Task<object> ChangeEmailUser(ChangeEmailDTO changeEmailDTO)
        {
            Response rep = new Response();
            rep.rep = false;
            try
            {
                var sql = "exec CheckPasswordUser @userID, @password, @isValidPassword OUTPUT";
                var parameters = new DynamicParameters();
                parameters.Add("@userID", changeEmailDTO.UserID);
                parameters.Add("@password", changeEmailDTO.CurrentPassword);
                parameters.Add("@isValidPassword", dbType: DbType.Boolean, direction: ParameterDirection.Output);

                await connection.ExecuteAsync(sql, parameters);

                bool isValidPassword = parameters.Get<bool>("@isValidPassword");

                if (!isValidPassword)
                    rep.message = "Password is not valid";
                else
                {
                    try
                    {
                        sql = "exec ChangeEmailUser @identifier, @newEmail, @message OUTPUT";
                        parameters = new DynamicParameters();
                        parameters.Add("@identifier", changeEmailDTO.UserID);
                        parameters.Add("@newEmail", changeEmailDTO.NewEmail);
                        parameters.Add("@message", dbType: DbType.String, size: 100, direction: ParameterDirection.Output);

                        await connection.ExecuteAsync(sql, parameters);

                        rep.message = Convert.ToString(parameters.Get<string>("@message"));

                        if (rep.message != null && rep.message != "")
                        {
                            if (rep.message == "Email updated successfully")
                                rep.rep = true;
                        }
                        else
                        {
                            rep.message = "ERROR MESSAGE NULL";
                            rep.rep = null;
                        }
                    }
                    catch (Exception e)
                    {
                        rep.message = e.ToString();
                    }
                }
            }
            catch (Exception e)
            {
                rep.message = e.ToString();
            }

            MessageUtilities.Message(rep.rep, rep.message);
            return rep;
        }

        // Méthode pour connecter un utilisateur
        public async Task<User> LoginUser(UserLoginDTO loginDTO)
        {
            Response rep = new Response();
            rep.rep = null;
            User user = new User();
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
                user = jsonObject.ToObject<User>();

                rep.message = message;
                rep.rep = true;
            }
            catch (Exception e)
            {
                rep.message = e.ToString();
                MessageUtilities.ErrorMessage(rep.message);
            }

            MessageUtilities.Message(rep.rep, rep.message);
            return rep.rep != null ? user : null;
        }

        // Méthode pour enregistrer un utilisateur
        public async Task<object> RegisterUser(UserRegisterDTO registerDTO)
        {
            Response rep = new Response();
            rep.rep = false;
            try
            {
                var sql = "exec RegisterUser @username, @email, @pwd";
                var value = new { username = registerDTO.Username, email = registerDTO.Email, pwd = registerDTO.Password };

                await connection.ExecuteAsync(sql, value);

                rep.message = "User registered successfully.";
                rep.rep = true;
            }
            catch (Exception e)
            {
                rep.message = e.ToString();
            }
            MessageUtilities.Message(rep.rep, rep.message);
            return rep;
        }

        // Méthode pour changer le status de l'utilisateur
        public async Task<object> ChangeStatusUser(ChangeAdminStatusDTO changeAdminStatusDTO)
        {
            Response rep = new Response();
            rep.rep = false;

            try
            {
                var sql = "exec ChangeStatusAdminUser @userID, @isAdmin, @adminUserID, @message OUTPUT";
                var parameters = new DynamicParameters();
                parameters.Add("@userID", changeAdminStatusDTO.UserID);
                parameters.Add("@isAdmin", changeAdminStatusDTO.IsAdmin);
                parameters.Add("@adminUserID", changeAdminStatusDTO.AdminUserID);
                parameters.Add("@message", dbType: DbType.String, size: 100, direction: ParameterDirection.Output);

                await connection.ExecuteAsync(sql, parameters);

                var message = parameters.Get<string>("@message");
                rep.message = message;

                if (rep.message == "User admin status updated successfully")
                    rep.rep = true;
            }
            catch (Exception e)
            {
                rep.message = e.ToString();
            }


            MessageUtilities.Message(rep.rep, rep.message);
            return rep;
        }

        // Méthode pour recupérer un utilisateur via son userID
        public async Task<UserViewModel> GetByID(Guid UserID)
        {
            Response rep = new Response();
            rep.rep = false;
            User user = new User();
            try
            {
                var sql = "exec GetUserByID @UserID, @User OUTPUT";
                var parameters = new DynamicParameters();
                parameters.Add("@UserID", UserID);
                parameters.Add("@User", dbType: DbType.String, size: -1, direction: ParameterDirection.Output);

                await connection.ExecuteAsync(sql, parameters);

                var jsonResponse = parameters.Get<string>("@UserResult");
                JArray jsonArray = JArray.Parse(jsonResponse);
                JObject jsonObject = (JObject)jsonArray[0];
                user = jsonObject.ToObject<User>();

                rep.message = "User recupérer";
                rep.rep = true;
            }
            catch (Exception e)
            {
                rep.message = e.ToString();
            }

            MessageUtilities.Message(rep.rep, rep.message);
            return user.ToUserViewModel();
        }
    }
}
