namespace BananaChefDAL.Models.Recipes.Utilities
{
    public static class IngredientUnit
    {
        public static IEnumerable<string> GetValidUnits()
        {
            yield return "g";
            yield return "kg";
            yield return "mg";
            yield return "L";
            yield return "mL";
            yield return "cL";
            yield return "c. à soupe";
            yield return "c. à café";
            yield return "Tasse";
            yield return "Verre";
            yield return "oz";
            yield return "lb";
            yield return "Pincée";
            yield return "Brin";
            yield return "Feuille";
            yield return "Tranche";
            yield return "Gousse";
            yield return "CLO";
            yield return "Filet";
            yield return "Morceau";
            yield return "Rondelle";
            yield return "Unitée";
            yield return "Sachet";
        }
    }
}
