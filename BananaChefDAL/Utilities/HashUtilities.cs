using System.Security.Cryptography;
using System.Text;

namespace BananaChefDAL.Utils
{
    public static class HashUtilities
    {
        //private static readonly IConfiguration _configuration;
        public static bool ComparePasswords(string passwordString, byte[] saltBytes, byte[] storedPasswordBytes)
        {
            if (passwordString == null || saltBytes == null || storedPasswordBytes == null)
                return false;

            using var sha512 = SHA512.Create();

            Console.WriteLine("here 1");
            byte[] passwordBytes = Encoding.UTF8.GetBytes(passwordString);
            Console.WriteLine("here 2");
            byte[] saltedPasswordBytes = new byte[passwordBytes.Length + saltBytes.Length];
            Console.WriteLine("here 3");
            passwordBytes.CopyTo(saltedPasswordBytes, 0);
            Console.WriteLine("here 4");
            saltBytes.CopyTo(saltedPasswordBytes, passwordBytes.Length);
            Console.WriteLine("here 5");
            byte[] passwordHash = sha512.ComputeHash(saltedPasswordBytes);
            Console.WriteLine("here 6");
            return passwordHash.SequenceEqual(storedPasswordBytes);
        }


        public static void GeneratePasswordHash(string password, out byte[] passwordHash, out string saltString)
        {
            using var sha512 = SHA512.Create();
            // Générer un sel aléatoire
            byte[] saltBytes = GenerateRandomBytes(32);

            //Console.WriteLine(BitConverter.ToString(saltBytes).Replace("-", ""));
            // Concaténer le mot de passe et le sel
            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            byte[] saltedPasswordBytes = new byte[passwordBytes.Length + saltBytes.Length];
            passwordBytes.CopyTo(saltedPasswordBytes, 0);
            saltBytes.CopyTo(saltedPasswordBytes, passwordBytes.Length);

            // Calculer le hachage du mot de passe + sel
            passwordHash = sha512.ComputeHash(saltedPasswordBytes);

            // Converti salt byte en salt string
            saltString = Convert.ToBase64String(saltBytes);
        }

        private static byte[] GenerateRandomBytes(int length)
        {
            using (var rng = new RNGCryptoServiceProvider())
            {
                byte[] randomBytes = new byte[length];
                rng.GetBytes(randomBytes);
                return randomBytes;
            }
        }

    }
}
