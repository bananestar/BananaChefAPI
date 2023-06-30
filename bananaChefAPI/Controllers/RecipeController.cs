using BananaChefBLL.Interfaces;
using BananaChefDAL.Models.Recipes.DTO;
using BananaChefDAL.Models.Recipes.RecipeViewModels;
using Microsoft.AspNetCore.Mvc;

namespace BananaChefAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RecipeController : Controller
    {
        private readonly IRecipeService _recipeService;

        public RecipeController(IRecipeService recipeService)
        {
            _recipeService = recipeService;
        }

        [HttpGet("getRecipeByID/{RecipeID:Guid}")]
        public async Task<IActionResult> GetRecipeByID(Guid RecipeID)
        {
            if(!ModelState.IsValid)
                return BadRequest(ModelState);

            RecipeViewModel recipe = await _recipeService.GetRecipeByID(RecipeID);

            return recipe is not null ? Ok(recipe) : BadRequest();
        }

        [HttpGet("getAllRecipe/")]
        public async Task<IActionResult> GetAllRecipe()
        {
            IEnumerable<RecipeAllView> recipes = await _recipeService.GetAllRecipe();
            return recipes is not null ? Ok(recipes) : BadRequest();
        }

        [HttpDelete("DeleteRecipe/")]
        public async Task<IActionResult> DeleteRecipe(Guid RecipeID)
        {
            string message = await _recipeService.DeleteRecipe(RecipeID);
            return message == null ? BadRequest() : message == "RECORD NOT FOUND" ? BadRequest(message) : Ok(message);
        }

        [HttpPut("UpdateRecipe/")]
        public async Task<IActionResult> UpdateRecipe(UpdateRecipeDTO recipeDTO)
        {
            RecipeViewModel recipe = await _recipeService.UpdateRecipe(recipeDTO);
            return recipe is not null ? Ok(recipe) : BadRequest();
        }
    }
}
