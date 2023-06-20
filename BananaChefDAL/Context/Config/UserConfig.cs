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
            //builder.HasData(
            //    new User
            //    {
            //        UserID = Guid.NewGuid(),
            //        Username = "bananestar",
            //        Email = "bananestar@bananacorp.com",
            //        Password = "0x0E2C9CF1964FE8B7FF72593CC40B503E8BE53F2C5DB2CA3E50E95B85103429391945B7E7DEF610A80C4B38AF04A26CA0F508C0B7BE1F6CC63C22A9400EAF3ACC",
            //        Salt = "CECCDC9C-5404-453F-A65F-B94161A7A8A8\u001a…Ÿ K)\u0004[?„¼Úà\u0081ÄŸæ[Jur‘¯†T’ÅÒž‚’$Ob\u0015 jÍ6,ù\u001ah *_€es*³iOH‘§ÕD“ÉgÃQÇ",
            //        IsAdmin = true,
            //        ProfileImageUrl = "https://firebasestorage.googleapis.com/v0/b/quizermania-f7be1.appspot.com/o/bv2.jpg?alt=media&token=5c0fc6fc-1cc3-4b30-9c56-05fdc3d15a45",
            //        CreatedAt = DateTime.UtcNow,
            //        UpdatedAt = DateTime.UtcNow,
            //    }
            //    );
        }
    }
}


