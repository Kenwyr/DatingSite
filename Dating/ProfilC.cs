using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dating
{
    public class ProfilC
    {
        public int ProfilID { get; set; }
        public string Profiltekst { get; set; }
        public string Profilbillede { get; set; }

        public void OpdaterProfil()
        {

        }

        public void UploadBillede()
        {

        }

        public void HentBillede()
        {

        }

        public void SletBillede()
        {

        }

        public static byte[] ReadFile(string filePath)
        {
            byte[] buffer;
            System.IO.FileStream fileStream = new System.IO.FileStream(filePath, FileMode.Open, FileAccess.Read);
            try
            {
                int length = (int)fileStream.Length;  // get file length
                buffer = new byte[length];            // create buffer
                int count;                            // actual number of bytes read
                int sum = 0;                          // total number of bytes read

                // read until Read method returns 0 (end of the stream has been reached)
                while ((count = fileStream.Read(buffer, sum, length - sum)) > 0)
                    sum += count;  // sum is a buffer offset for next reading
            }
            finally
            {
                fileStream.Close();
            }
            return buffer;
        }
    }
}
