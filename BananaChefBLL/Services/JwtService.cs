using BananaChefBLL.Interfaces;
using BananaChefDAL.Models.Users;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace BananaChefBLL.Services
{
    public class JwtService : IJwtService
    {
        private readonly IConfiguration _configuration;
        public JwtService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public string GetJwt(User user)
        {
            SymmetricSecurityKey key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["jwt:key"]));

            SigningCredentials credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            List<Claim> claims = new List<Claim>()
            {
                new Claim(ClaimTypes.NameIdentifier, user.UserID.ToString()),
                new Claim(ClaimTypes.Name, user.Username),
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.Role,user.IsAdmin ? "Admin" : "User"),
                new Claim(ClaimTypes.DateOfBirth, user.CreatedAt.ToString())
            };

            SecurityTokenDescriptor newToken = new SecurityTokenDescriptor()
            {
                Subject = new ClaimsIdentity(claims),
                Issuer = _configuration["jwt:issuer"],
                Audience = _configuration["jwt:audience"],
                Expires = DateTime.Now.AddDays(1),
                SigningCredentials = credentials,
            };

            var handler = new JwtSecurityTokenHandler();
            var jwtUser = handler.CreateToken(newToken);
            string tokenAvance = handler.WriteToken(jwtUser);

            return tokenAvance;
        }


    }
}
