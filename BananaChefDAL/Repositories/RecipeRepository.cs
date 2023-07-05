using BananaChefDAL.Interfaces;
using BananaChefDAL.Models.Recipes;
using BananaChefDAL.Models.Recipes.DTO;
using BananaChefDAL.Models.Recipes.Mapper;
using BananaChefDAL.Models.Recipes.RecipeViewModels;
using BananaChefDAL.Utilities;
using Dapper;
using NuGet.Protocol;
using System.Data;

namespace BananaChefDAL.Repositories
{
    public class RecipeRepository : IRecipeRepository
    {
        private readonly IDbConnection _connection;

        public RecipeRepository(IDbConnection connection)
        {
            _connection = connection;
        }

        public async Task<string> DeleteRecipe(Guid recipeID)
        {
            string message;
            try
            {
                var sql = "Select RecipeID, Title, CreatedAt, UpdatedAt FROM Recipes WHERE RecipeID=@RecipeID";
                var parameters = new DynamicParameters();
                parameters.Add("@RecipeID", recipeID);

                IEnumerable<RecipeAllView> r = await _connection.QueryAsync<RecipeAllView>(sql, parameters);

                if(r is null)
                    return message="RECORD NOT FOUND";

                try
                {
                    sql = "exec DeleteRecipe @RecipeID";
                    await _connection.QueryAsync(sql, parameters);
                }
                catch (Exception e)
                {
                    message = e.ToString();
                }

                message = "RECORD WAS DELETE";
            }
            catch (Exception e)
            {
                message = e.ToString();
            }

            return message;
        }

        public async Task<IEnumerable<RecipeAllView>> GetAllRecipe()
        {
            try
            {
                var sql = "Select RecipeID, Title, ImageUrl, CreatedAt, UpdatedAt FROM Recipes ORDER BY YEAR(CreatedAt) DESC, MONTH(CreatedAt) DESC, DAY(CreatedAt) DESC ";
                IEnumerable<RecipeAllView> result = await _connection.QueryAsync<RecipeAllView>(sql);

                return result;
            }
            catch (Exception e)
            {
                MessageUtilities.Message(false, e.ToString());
            }
            return null;
        }

        public async Task<RecipeViewModel> GetRecipeByID(Guid recipeID)
        {
            try
            {
                var sql = "exec GetDetailsRecipe @RecipeID";
                var parameters = new DynamicParameters();
                parameters.Add("@RecipeID", recipeID);

                var multiResult = await _connection.QueryMultipleAsync(sql, parameters);

                //await MessageUtilities.PrintRecipe(multiResult);

                RecipeRaw recipeRaw = await multiResult.ReadFirstOrDefaultAsync<RecipeRaw>();

                IEnumerable<IngredientViewModel> ingredientsRaw = await multiResult.ReadAsync<IngredientViewModel>();
                IEnumerable<StepViewModel> stepsRaw = await multiResult.ReadAsync<StepViewModel>();
                IEnumerable<CategoryViewModel> categoriesRaw = await multiResult.ReadAsync<CategoryViewModel>();
                
                return RecipeMapper.ToRecipeViewModel(recipeRaw, ingredientsRaw, stepsRaw, categoriesRaw);
            }
            catch (Exception e)
            {
                Console.WriteLine($"Une erreur s'est produite lors de la récupération de la recette : {e.Message}");
            }

            return null;
        }

        public async Task<RecipeViewModel> UpdateRecipe(UpdateRecipeDTO r)
        {
            try
            {
                var sql = "exec UpdateRecipe @RecipeID, @Title, @Description, @PreparationTime, @CookingTime, @Difficulty, @Author, @ImageUrl, @VideoUrl, @Score, @CategoryList, @IngredientsJson, @SetpsJson, @Message OUTPUT, @IfExist OUTPUT";

                var parameters = new DynamicParameters();
                parameters.Add("@RecipeID", r.RecipeID);
                parameters.Add("@Title", r.Title);
                parameters.Add("@Description", r.Description);
                parameters.Add("@PreparationTime", r.PreparationTime);
                parameters.Add("@CookingTime", r.CookingTime);
                parameters.Add("@Difficulty", r.Difficulty);
                parameters.Add("@Author", r.Author);
                parameters.Add("@ImageUrl", r.ImageUrl);
                parameters.Add("@VideoUrl", r.VideoUrl);
                parameters.Add("@Score", r.Score);
                parameters.Add("@CategoryList", r.Categories);
                parameters.Add("@IngredientsJson", r.Ingredients);
                parameters.Add("@SetpsJson", r.Steps);
                parameters.Add("@message", dbType: DbType.String, size: 100, direction: ParameterDirection.Output);
                parameters.Add("@IfExist", dbType: DbType.Byte, size: 100, direction: ParameterDirection.Output);

                await _connection.QueryAsync(sql, parameters);

                RecipeViewModel rc = await GetRecipeByID(r.RecipeID);
                return rc;
            }
            catch (Exception e)
            {
                MessageUtilities.Message(false, e.ToString());
            }
            return null;
        }
    }
}



