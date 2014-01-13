using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Utils
/// </summary>
namespace edu.neu.ccis.jga
{
    public class Utils
    {
        public Utils()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        static Random random = new Random();
        public static string getRandomString(int maxSize)
        {
            string randomString = "";
            int randomSize = random.Next(2, maxSize);
            for (int i = 0; i < randomSize; i++)
            {
                int randomChar = random.Next(65, 90);
                randomString += (char)randomChar;
            }
            return randomString;
        }

        static string lorem = "Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum";
        public static string getRandomLoremWord()
        {
            string[] words = lorem.Split(' ');
            int randomIndex = random.Next(0, words.Length - 1);
            return words[randomIndex];
        }
    }
}