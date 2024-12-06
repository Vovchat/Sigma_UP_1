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
using System.IO;
using System.Linq;

namespace WpfHotel
{
    /// <summary>
    /// Interaction logic for WindowLogin.xaml
    /// </summary>
    public partial class WindowLogin : Window
    {
        public WindowLogin()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string password = PasswordBox.Password;

            // Чтение CSV-файла
            string filePath = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "C:\\Users\\admin\\Desktop\\Рожок\\WpfHotel\\pass.csv");
            string[] lines = File.ReadAllLines(filePath);

            // Проверка наличия строки с паролем
            string storedPassword = lines.FirstOrDefault()?.Split(',')[0];

            if (storedPassword != null && password == storedPassword)
            {
                MainWindow mainWindow = new MainWindow();
                mainWindow.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Вход заблокирован", "Error",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}