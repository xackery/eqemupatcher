using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;

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
    }
}
