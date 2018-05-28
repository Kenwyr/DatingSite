using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO;
using Microsoft.Win32;
using System.Data.SqlClient;
using System.Linq;

namespace billed
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        
        
        public MainWindow()
        {
            InitializeComponent();
        }

        //SqlConnection conn = new SqlConnection("Server=TOBIAS\\BACON;Database=Billed;Trusted_Connection=true");
        SqlConnection conn = new SqlConnection("Server=SKAB4-PC-01\\TOBIASBACON;Database=Billed;Trusted_Connection=true");

        private string imglocation = "";
        SqlCommand cmd;

        private void etbilled_Click(object sender, RoutedEventArgs e)
        {
            
            conn.Open();
            OpenFileDialog billed = new OpenFileDialog();
            billed.Filter = "Image files|*.bmp;*.jpg;*.gif;*.png;*.tif|All files|*.*";
            if (billed.ShowDialog() == true)
            {

                imgPhoto.Source = new BitmapImage(new Uri(billed.FileName));
                var ms = new MemoryStream();
                //string sqlQuery = "insert into images(billedet) Values('" + etbilled + "', @billedet )";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert into images (billedet) Values (@image)";
                cmd.Parameters.AddWithValue("@image",ReadFile(billed.FileName));
                cmd.Connection = conn;

 
                cmd.ExecuteNonQuery();


            }

        }

        public static byte[] ReadFile(string filePath)
        {
            byte[] buffer;
            FileStream fileStream = new FileStream(filePath, FileMode.Open, FileAccess.Read);
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
