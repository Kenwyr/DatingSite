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

namespace Dating
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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Forside F1 = new Forside();
            this.Close();
            F1.Show();



            //Frame.Content = new Dating.Profil();
            //Frame.Content = new Dating.Profil();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Create C1 = new Create();
            C1.Show();
        }
    }
}
