using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;
using System.Net;
using System.Text;

namespace EQEmu_Patcher
{
    /* General Utility Methods */
    class UtilityLibrary
    {
        public static string GetMD5(string filePath)
        {
            var md5 = MD5.Create();
            var stream = File.OpenRead(filePath);
            return BitConverter.ToString(md5.ComputeHash(stream)).Replace("-", string.Empty);
            //return Encoding.UTF8.GetString(bytes);
        }

        public static string GetJson(string urlPath)
        {
            using (WebClient wc = new WebClient())
            {
                return wc.DownloadString(urlPath);
            }
        }

        public static System.Diagnostics.Process StartEverquest()
        {
            return System.Diagnostics.Process.Start("eqgame.exe", "patchme");
        }


        public static string GetSHA1(string filePath)
        {
            //SHA1 sha = new SHA1CryptoServiceProvider();            
            //var stream = File.OpenRead(filePath);
            //return BitConverter.ToString(sha.ComputeHash(stream)).Replace("-", string.Empty); ;
            /*Encoding enc = Encoding.UTF8;

            var sha = SHA1.Create();
            var stream = File.OpenRead(filePath);

            string hash = "commit " + stream.Length + "\0";
            return enc.GetString(sha.ComputeHash(stream));

            return BitConverter.ToString(sha.ComputeHash(stream));*/
            Encoding enc = Encoding.UTF8;

            string commitBody = File.OpenText(filePath).ReadToEnd();
            StringBuilder sb = new StringBuilder();
            sb.Append("commit " + Encoding.UTF8.GetByteCount(commitBody));
            sb.Append("\0");
            sb.Append(commitBody);

            var sss = SHA1.Create();
            var bytez = Encoding.UTF8.GetBytes(sb.ToString());
            return BitConverter.ToString(sss.ComputeHash(bytez));
            //var myssh = enc.GetString(sss.ComputeHash(bytez));
            //return myssh;
        }
        //Pass the working directory (or later, you can pass another directory) and it returns a hash if the file is found
        public static string GetEverquestExecutableHash(string path)
        {
            var di = new System.IO.DirectoryInfo(path);
            var files = di.GetFiles("eqgame.exe");
            if (files == null || files.Length == 0)
            {
                return "";
            }
            return UtilityLibrary.GetSHA1(files[0].FullName);
        }
    }
}
