using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EQEmu_Patcher
{
    class IniLibrary
    {
        public static IniLibrary instance;
        public bool IsCleanCopy;
        public VersionTypes ClientVersion;

        
        public static void Save()
        {
            File.WriteAllText(@"eqemupatcher.ini", JsonConvert.SerializeObject(instance));
        }

        public static void Load()
        {
            try {
                instance = Newtonsoft.Json.JsonConvert.DeserializeObject<IniLibrary>(File.ReadAllText(@"eqemupatcher.ini"));
                if (instance == null) {
                    ResetDefaults();
                }
            } catch (System.IO.FileNotFoundException) {                
                ResetDefaults();
                Save();
            }
        }

        public static void ResetDefaults()
        {
            instance = new IniLibrary();
        }
    }
}
