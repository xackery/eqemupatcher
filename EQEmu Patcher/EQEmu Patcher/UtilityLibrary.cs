using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;
using System.Net;

namespace EQEmu_Patcher
{
    /* General Utility Methods */
    class UtilityLibrary
    {
        public static string GetMD5(string filePath)
        {
            var md5 = MD5.Create();
            var stream = File.OpenRead(filePath);
            var bytes =  md5.ComputeHash(stream);
            return bytes.ToString();
        }

        public static string GetJson(string urlPath)
        {
            using (WebClient wc = new WebClient())
            {
                return wc.DownloadString(urlPath);
            }
        }

        public static bool IsEverquestDirectory(string path)
        {
            //Application.Current.BaseDirectory
            
            var di = new System.IO.DirectoryInfo(path);
            //try {
            var files = di.GetFiles("eqgame.exe");
            //}
            //catch (UnauthorizedAccessException e)
            //{

            // This code just writes out the message and continues to recurse.
            // You may decide to do something different here. For example, you
            // can try to elevate your privileges and access the file again.
            //    log.Add(e.Message);
            // }
            return (files != null && files.Length > 0);                    
        }
    }
}
