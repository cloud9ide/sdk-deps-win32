using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;

namespace revealInExplorer {
    class Program {
        static void Main(string[] args) {
            bool open = true;
            string path = Directory.GetCurrentDirectory();
            if (args.Length > 0) {
                if (args[0] == "-o" || args[0] == "--o") {                    
                    if (args.Length > 1) 
                        path = args[1];
                } else {
                    open = false;
                    path = args[0];
                }
            }

            if (open) {
                System.Diagnostics.Process.Start(path);
            } else {
                OpenFolderAndSelectFile(path);
            }
        }

        public static void OpenFolderAndSelectFile(string filePath) {
            IntPtr pidl = ILCreateFromPathW(filePath);
            SHOpenFolderAndSelectItems(pidl, 0, IntPtr.Zero, 0);
            ILFree(pidl);
        }

        [DllImport("shell32.dll", CharSet = CharSet.Unicode)]
        private static extern IntPtr ILCreateFromPathW(string pszPath);

        [DllImport("shell32.dll")]
        private static extern int SHOpenFolderAndSelectItems(IntPtr pidlFolder, int cild, IntPtr apidl, int dwFlags);

        [DllImport("shell32.dll")]
        private static extern void ILFree(IntPtr pidl);
    }
}
