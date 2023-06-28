using BananaChefDAL.Context.Config;
using BananaChefDAL.Models.Recipes;

using BananaChefDAL.Models.Users;
using Microsoft.EntityFrameworkCore;

namespace BananaChefDAL.Context
{
    public class DataContext : DbContext
    {
        string connectionString = @"Server=DESKTOP-KF6RFV3;"
                            + "Database=BananaChefDB;"
                            + "Trusted_Connection=True;"
                            + "Trusted_Connection=True;";

        public DbSet<Recipe> Recipes { get; set; }
        public DbSet<User> Users { get; set; }



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
