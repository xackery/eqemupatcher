using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
//using System.Windows.Shell;

namespace EQEmu_Patcher
{
    public partial class MainForm : Form
    {
       // TaskbarItemInfo tii = new TaskbarItemInfo();
        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
          
           // tii.ProgressState = TaskbarItemProgressState.Normal;
          //  tii.ProgressValue = (double)50 /100;
            
            //Read:
            /*
            var pv = JsonConvert.DeserializeObject<PatchVersion>(test);
            MessageBox.Show(pv.ServerName);
            */
            //Write:
            /*
            PatchVersion pv = new PatchVersion();
            pv.ServerName = "Test";
            pv.RootFiles.Add("eqgame.exe", "12345test");
            txtList.Text = JsonConvert.SerializeObject(pv);
            */
            try {
              
              if (!UtilityLibrary.IsEverquestDirectory(AppDomain.CurrentDomain.BaseDirectory)) {
                  //  MessageBox.Show("Please run this patcher in your Everquest directory.");
                   // this.Close();
                    return;
                }
               
            }
            catch (UnauthorizedAccessException err)
            {
                MessageBox.Show("You need to run this program with Administrative Privileges" + err.Message);
                return;
            }
            
           
        }

        System.Diagnostics.Process process;
      

        System.Collections.Specialized.StringCollection log = new System.Collections.Specialized.StringCollection();

        Dictionary<string, string> WalkDirectoryTree(System.IO.DirectoryInfo root)
        {
            System.IO.FileInfo[] files = null;
            var fileMap = new Dictionary<string, string>();
            try
            {
                // files = root.GetFiles("*.*");
                files = root.GetFiles("eqgame.exe");
            }
            // This is thrown if even one of the files requires permissions greater
            // than the application provides.
            catch (UnauthorizedAccessException e)
            {
                txtList.Text += e.Message +"\n";
                return fileMap;
            }

            catch (System.IO.DirectoryNotFoundException e)
            {
                txtList.Text += e.Message + "\r\n";
                return fileMap;
            }

            if (files != null)
            {
                var count = 0;
                progressBar.Maximum = files.Length;
                
                foreach (System.IO.FileInfo fi in files)
                {
                    if (fi.Name.Contains(".ini"))
                    { //Skip INI files
                        continue;
                    }
                    if (fi.Name == System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName)
                    { //Skip self EXE
                        continue;
                    }

                    // In this example, we only access the existing FileInfo object. If we
                    // want to open, delete or modify the file, then
                    // a try-catch block is required here to handle the case
                    // where the file has been deleted since the call to TraverseTree().
                    var md5 = UtilityLibrary.GetMD5(fi.FullName);
                    txtList.Text += fi.Name + ": " + md5 + "\r\n";
                    count++;
                    progressBar.Value = count;
                    fileMap[fi.Name] = md5;
                    txtList.Refresh();
                    updateTaskbarProgress();
                    Application.DoEvents();
                    
                }

            }
            return fileMap;
        }

        private void btnScan_Click(object sender, EventArgs e)
        {
          
            var fileMap = WalkDirectoryTree(new System.IO.DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory));
            PatchVersion pv = new PatchVersion();
            pv.RootFiles = fileMap;
            txtList.Text = JsonConvert.SerializeObject(pv);
        }

        private void updateTaskbarProgress()
        {
            
            if (Environment.OSVersion.Version.Major < 6)
            { //Only works on 6 or greater
                return;
            }
            
            
           // tii.ProgressState = TaskbarItemProgressState.Normal;            
           // tii.ProgressValue = (double)progressBar.Value / progressBar.Maximum;            
        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            try {
                process = UtilityLibrary.StartEverquest();
            }
            catch  (Exception err) {
                MessageBox.Show("An error occured: "   + err.Message);
            }
        }
    }
}
