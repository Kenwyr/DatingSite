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
using System.Windows.Shapes;
using System.Windows.Navigation;

namespace Dating
{
    /// <summary>
    /// Interaction logic for Forside.xaml
    /// </summary>
    public partial class Forside : Window
    {
        public Forside()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Content = new søg();
            
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {

            Content = new Profil();
        }

    

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            MainWindow Mw = new MainWindow();
            Mw.Show();
            this.Close();
        }
    }
}
