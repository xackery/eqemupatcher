using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EQEmu_Patcher
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {

            try {
                if (!UtilityLibrary.IsEverquestDirectory(AppDomain.CurrentDomain.BaseDirectory)) {
                    MessageBox.Show("Please run this patcher in your Everquest directory.");
                    Application.Exit();
                    return;
                }
            }
            catch (UnauthorizedAccessException err)
            {
                MessageBox.Show("You need to run this program with Administrative Privileges" + err.Message);
                return;
            }

            txtList.Text = "";
           
        }

        System.Collections.Specialized.StringCollection log = new System.Collections.Specialized.StringCollection();

        void WalkDirectoryTree(System.IO.DirectoryInfo root)
        {
            System.IO.FileInfo[] files = null;
            System.IO.DirectoryInfo[] subDirs = null;
            // First, process all the files directly under this folder
            try
            {
                files = root.GetFiles("*.*");
            }
            // This is thrown if even one of the files requires permissions greater
            // than the application provides.
            catch (UnauthorizedAccessException e)
            {
                // This code just writes out the message and continues to recurse.
                // You may decide to do something different here. For example, you
                // can try to elevate your privileges and access the file again.
                //log.Add(e.Message);
                txtList.Text += e.Message +"\n";
                return;
            }

            catch (System.IO.DirectoryNotFoundException e)
            {
                //Console.WriteLine(e.Message);
                txtList.Text += e.Message + "\r\n";
                return;
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
                    txtList.Refresh();
                    Application.DoEvents();
                    
                }

                // Now find all the subdirectories under this directory.
               /* subDirs = root.GetDirectories();

                foreach (System.IO.DirectoryInfo dirInfo in subDirs)
                {
                    // Resursive call for each subdirectory.
                    WalkDirectoryTree(dirInfo);
                }
                */
            }
        }

        private void btnScan_Click(object sender, EventArgs e)
        {
            WalkDirectoryTree(new System.IO.DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory));
        }
    }
}
