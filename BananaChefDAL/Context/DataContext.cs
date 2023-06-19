using BananaChefDAL.Context.Config;
using BananaChefDAL.Models.Users;
using Microsoft.EntityFrameworkCore;

namespace BananaChefDAL.Context
{
    public class DataContext : DbContext
    {
        public DbSet<User> Users { get; set; }

        public User LoginUser(string email, string password)
        {
            return Users.FromSqlRaw("EXEC LoginUser {0}, {1}", email, password).FirstOrDefault();
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
            optionsBuilder.UseSqlServer(@"Server=DESKTOP-KF6RFV3;"
                                        + "Database=BananaChefDB;"
                                        + "Trusted_Connection=True;"
                                        + "TrustServerCertificate=True;");
        }
    }
}
