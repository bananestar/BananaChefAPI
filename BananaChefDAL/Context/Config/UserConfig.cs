using BananaChefDAL.Models.Users;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace BananaChefDAL.Context.Config
{
    public class UserConfig : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.HasIndex(u => u.Username).IsUnique();
            builder.HasIndex(u => u.Email).IsUnique();
            builder.HasData(
                new User
                {
                    UserID = Guid.NewGuid(),
                    Username = "bananestar",
                    Email = "bananestar@bananacorp.com",
                    Password = "Test1234=",
                    IsAdmin = true,
                    ProfileImageUrl = "https://firebasestorage.googleapis.com/v0/b/quizermania-f7be1.appspot.com/o/bv2.jpg?alt=media&token=5c0fc6fc-1cc3-4b30-9c56-05fdc3d15a45",
                    CreatedAt = DateTime.UtcNow,
                    UpdatedAt = DateTime.UtcNow,
                }
                );
        }
    }
}
