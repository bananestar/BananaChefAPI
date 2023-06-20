using BananaChefDAL.Models.Users;

namespace BananaChefBLL.Interfaces
{
    public interface IJwtService
    {
        public string GetJwt(User user);
    }
}
