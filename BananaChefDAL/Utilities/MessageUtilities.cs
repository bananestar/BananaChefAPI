using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BananaChefDAL.Utilities
{
    public static class MessageUtilities
    {
        public static void ErrorMessage(string msg)
        {
            Console.WriteLine("*******--Erreur--*******");
            Console.WriteLine(msg);
        }
    }
}
