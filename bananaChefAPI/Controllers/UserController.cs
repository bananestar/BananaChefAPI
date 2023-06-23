using BananaChefBLL.Interfaces;
using BananaChefDAL.Models.Users.DTO;
using Microsoft.AspNetCore.Authorization;
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

        // Classe Response pour stocker les résultats et les messages
        public class Response
        {
            public string message { get; set; }
            public bool? rep { get; set; }
        }

        // Action pour la connexion d'un utilisateur
        [HttpPost("login")]
        public async Task<IActionResult> Login(UserLoginDTO loginDTO)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            string? token = await _userService.Login(loginDTO);

            return token is not null ? Ok(token) : BadRequest();
        }

        // Action pour l'enregistrement d'un utilisateur
        [HttpPost("register")]
        public async Task<IActionResult> Register(UserRegisterDTO registerDTO)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            Response result = (Response)await _userService.Register(registerDTO);

            if (result.rep == false || result.rep == null)
                return BadRequest("Failed to register user.");

            return Ok(result.message);
        }

        // Action pour changer l'e-mail d'un utilisateur (requiert une autorisation)
        [HttpPost("ChangeEmailUser")]
        [HttpPost("ChangeEmailUser")]
        [Authorize]
        public async Task<IActionResult> ChangeEmailUser(ChangeEmailDTO changeEmailDTO)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            Response result = (Response)await _userService.ChangeEmail(changeEmailDTO);

            if (result.rep == false || result.rep == null)
                return BadRequest(result.message);

            return Ok(result.message);
        }

        // Action pour changer le mot de passe d'un utilisateur (requiert une autorisation)
        [HttpPost("ChangePasswordUser")]
        [Authorize]
        public async Task<IActionResult> ChangePasswordUser(ChangePasswordDTO changePasswordDTO)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            Response result = (Response)await _userService.ChangePassword(changePasswordDTO);

            if (result.rep == false || result.rep == null)
                return BadRequest(result.message);

            return Ok(result.message);
        }

        // Action pour changer le statut administrateur d'un utilisateur (requiert une autorisation en tant qu'Admin)
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> ChangeStatusAdminUser(ChangeAdminStatusDTO adminStatusDTO)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            Response result = (Response)await _userService.ChangeStatus(adminStatusDTO);

            if (result.rep == false || result.rep == null)
                return BadRequest(result.message);

            return Ok(result.message);
        }



    }
}
