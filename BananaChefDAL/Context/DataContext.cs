using BananaChefDAL.Context.Config;
using BananaChefDAL.Models.Recipes;
using BananaChefDAL.Models.SavedRecipes;
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
        public DbSet<SavedRecipe> SavedRecipes { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<User>().ToTable("User");
            modelBuilder.ApplyConfiguration(new UserConfig());

            modelBuilder.Entity<SavedRecipe>()
                .HasKey(sr => sr.SavedRecipeId);

            modelBuilder.Entity<SavedRecipe>()
                .HasOne(sr => sr.User)
                .WithMany(u => u.SavedRecipes)
                .HasForeignKey(sr => sr.UserId);

            modelBuilder.Entity<SavedRecipe>()
                .HasOne(sr => sr.Recipe)
                .WithMany()
                .HasForeignKey(sr => sr.RecipeId);


        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(connectionString);
        }
    }
}
