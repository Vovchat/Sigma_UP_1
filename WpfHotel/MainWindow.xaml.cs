using Azure;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Drawing;
using System.IO;
using System.Reflection;
using WpfHotel.pages;

namespace WpfHotel
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            var pageServices = new PageServices();
            MainFrame.Navigate(pageServices);
        }

        private void btnService_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new PageServices());
        }

        private void btnCustomers_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new PageCustomers());
        }

        private void btnRooms_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new PageRooms());
        }
    }
}