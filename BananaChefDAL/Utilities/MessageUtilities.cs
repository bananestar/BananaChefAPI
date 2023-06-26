namespace BananaChefDAL.Utilities
{
    public static class MessageUtilities
    {

        public static void Message(bool? isValid, string msg)
        {
            if (isValid == true)
            {
                Console.WriteLine("*******--Success--*******");
                Console.WriteLine(msg);
            }
            if (isValid == false)
            {
                Console.WriteLine("*******--Erreur Niveau n°1--*******");
                Console.WriteLine(msg);
            }
            if (isValid == null)
            {
                Console.WriteLine("*******--Erreur Niveau n°2--*******");
                Console.WriteLine(msg);
            }
        }
    }
}
