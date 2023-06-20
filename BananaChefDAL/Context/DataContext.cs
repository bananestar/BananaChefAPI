using BananaChefDAL.Context.Config;
using BananaChefDAL.Models.Users;
using BananaChefDAL.Models.Users.ViewModels;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Text;

namespace BananaChefDAL.Context
{
    public class DataContext : DbContext
    {
        string connectionString = @"Server=DESKTOP-KF6RFV3;"
                            + "Database=BananaChefDB;"
                            + "Trusted_Connection=True;"
                            + "TrustServerCertificate=True;";
        public DbSet<User> Users { get; set; }
        public async Task<LoginResult> LoginUser(string identifier, string password)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (var command = new SqlCommand("LoginUser", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@identifier", identifier);
                    command.Parameters.AddWithValue("@password", password);

                    var userIdParameter = command.Parameters.Add("@UserID", SqlDbType.UniqueIdentifier);
                    userIdParameter.Direction = ParameterDirection.Output;

                    var messageParameter = command.Parameters.Add("@message", SqlDbType.VarBinary, 100);
                    messageParameter.Direction = ParameterDirection.Output;

                    await command.ExecuteNonQueryAsync();

                    var userIdBytes = (byte[])userIdParameter.Value;
                    Guid userIdValue = new Guid(userIdBytes);

                    var messageBytes = (byte[])messageParameter.Value;
                    string messageValue = Encoding.UTF8.GetString(messageBytes);

                    return new LoginResult
                    {
                        Message = messageValue,
                        UserID = userIdValue
                    };
                }
            }
        }




        public void RegisterUser(string username, string email, string password)
        {
            Database.ExecuteSqlRaw("EXEC RegisterUser {0}, {1}, {2}", username, email, password);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<User>().ToTable("User");
            modelBuilder.ApplyConfiguration(new UserConfig());
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(connectionString);
        }
    }
}
