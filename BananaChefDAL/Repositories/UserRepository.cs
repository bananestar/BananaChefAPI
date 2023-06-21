using BananaChefDAL.Context;
using BananaChefDAL.Interfaces;
using BananaChefDAL.Models.Users;
using BananaChefDAL.Models.Users.DTO;
using BananaChefDAL.Utils;
using Microsoft.Data.SqlClient;
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


            var identifier = loginDTO.EmailOrUsername;
            string password = loginDTO.Password;
            await Console.Out.WriteLineAsync(password);


            if (identifier == null || password == null)
                return null;

            string connectionString = @"Server=DESKTOP-KF6RFV3;"
                            + "Database=BananaChefDB;"
                            + "Trusted_Connection=True;"
                            + "TrustServerCertificate=True;";

            string query = "SELECT TOP 1 Password, Salt, UserID FROM [User] WHERE Email = @identifier OR Username = @identifier";

            using SqlConnection connection = new SqlConnection(connectionString);
            await connection.OpenAsync();

            using SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@identifier", identifier);

            using SqlDataReader reader = await command.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                byte[] storedPasswordBytes = (byte[])reader["Password"];
                string storedSalt = reader["Salt"].ToString();

                byte[] saltBytes = Convert.FromBase64String(storedSalt);

                bool passwordMatch = HashUtilities.ComparePasswords(password, saltBytes, storedPasswordBytes);
                Console.WriteLine("here 7");


                Guid userID = reader.GetGuid(reader.GetOrdinal("UserID"));

                await Console.Out.WriteLineAsync(userID.ToString());


                if (passwordMatch)
                {
                    Console.WriteLine("here 8");
                    // Mot de passe correct
                    try
                    {
                        User user = await _dataContext.Users.FirstOrDefaultAsync(u => u.UserID == reader.GetGuid(reader.GetOrdinal("UserID")));
                        return user;
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("*******--Erreur de connexion--*******");
                        Console.WriteLine(e.ToString());
                        return null;
                    }
                }
            }

            return null;
        }


        public async Task<bool> RegisterUser(UserRegisterDTO registerDTO)
        {
            byte[] passwordHash;
            string salt;
            Guid userID = Guid.NewGuid();

            HashUtilities.GeneratePasswordHash(registerDTO.Password, out passwordHash, out salt);

            string connectionString = @"Server=DESKTOP-KF6RFV3;"
                            + "Database=BananaChefDB;"
                            + "Trusted_Connection=True;"
                            + "TrustServerCertificate=True;";

            string sql = "INSERT INTO [dbo].[User] (UserID, Username, Email, Password, Salt, CreatedAt, UpdatedAt) " +
                            "VALUES (@userId, @username, @email, @pwdHash, @salt, GETDATE(), GETDATE())";



            using SqlConnection connection = new SqlConnection(connectionString);
            await connection.OpenAsync();

            using SqlCommand command = new SqlCommand(sql, connection);

            command.Parameters.AddWithValue("@userId", userID);
            command.Parameters.AddWithValue("@username", registerDTO.Username);
            command.Parameters.AddWithValue("@email", registerDTO.Email);
            command.Parameters.AddWithValue("@pwdHash", passwordHash);
            command.Parameters.AddWithValue("@salt", salt);

            try
            {
                await command.ExecuteNonQueryAsync();
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


