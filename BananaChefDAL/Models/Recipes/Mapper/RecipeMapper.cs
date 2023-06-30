using BananaChefDAL.Models.Recipes.RecipeViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BananaChefDAL.Models.Recipes.Mapper
{
    public static class RecipeMapper
    {
        public static RecipeViewModel ToRecipeViewModel(RecipeRaw rRaw, IEnumerable<IngredientViewModel> ingredientsRaw, IEnumerable<StepViewModel> stepsRaw, IEnumerable<CategoryViewModel> categoriesRaw)
        {
            List<IngredientViewModel> ingredientsList = new List<IngredientViewModel>();
            List<StepViewModel> stepList = new List<StepViewModel>();
            List<CategoryViewModel> categoriesList = new List<CategoryViewModel>();

            foreach (var ingredient in ingredientsRaw)
            {
                ingredientsList.Add(new IngredientViewModel
                {
                    Name = ingredient.Name,
                    Description = ingredient.Description,
                    Quantity = ingredient.Quantity,
                    Unit = ingredient.Unit
                });
            }

            foreach (var step in stepsRaw)
            {
                stepList.Add(new StepViewModel
                {
                    Description = step.Description,
                    OrderNumber = step.OrderNumber
                });
            }

            foreach (var category in categoriesRaw)
            {
                categoriesList.Add(new CategoryViewModel
                {
                    Name = category.Name
                });
            }

            return new RecipeViewModel
            {
                RecipeID = rRaw.RecipeID,
                Title = rRaw.Title,
                Description = rRaw.Description,
                PreparationTime = rRaw.PreparationTime,
                CookingTime = rRaw.CookingTime,
                Difficulty = rRaw.Difficulty,
                Author = rRaw.Author,
                ImageUrl = rRaw.ImageUrl,
                VideoUrl = rRaw.VideoUrl,
                Score = rRaw.Score,
                CreatedAt = rRaw.CreatedAt,
                UpdateAt = rRaw.UpdateAt,
                Categories = categoriesList,
                Ingredients = ingredientsList,
                Steps = stepList
            };
        }


    }
}
