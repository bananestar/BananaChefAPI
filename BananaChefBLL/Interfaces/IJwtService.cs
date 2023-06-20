using BananaChefDAL.Models.Users.ViewModels;

namespace BananaChefBLL.Interfaces
{
    public interface IJwtService
    {
        public string GetJwt(UserViewModel user);
    }
}
