using BananaChefBLL.Interfaces;
using BananaChefDAL.Models.Users.DTO;
using Microsoft.AspNetCore.Mvc;

namespace BananaChefAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(UserLoginDTO loginDTO)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            string? token = await _userService.Login(loginDTO);

            return token is not null ? Ok(token) : BadRequest();
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(UserRegisterDTO registerDTO)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var result = await _userService.Register(registerDTO);

            if (!result)
                return BadRequest("Failed to register user.");

            return Ok("User registered successfully.");
        }
    }
}
