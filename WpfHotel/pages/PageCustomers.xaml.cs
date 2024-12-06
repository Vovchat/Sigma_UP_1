using Microsoft.Data.SqlClient;
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
using WpfHotel.Models;

namespace WpfHotel.pages
{
    /// <summary>
    /// Логика взаимодействия для PageCustomers.xaml
    /// </summary>
    public partial class PageCustomers : Page
    {
        private List<Customer> customers;
        public PageCustomers()
        {
            InitializeComponent();

            using (HotelDbContext db = new HotelDbContext())
            {
                customers = db.Customers.ToList();
                LVCustomers.ItemsSource = customers;
            }
        }
        private void btnAddC_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Customer customer = new Customer
                {
                    FirstName = txtFirstName.Text,
                    LastName = txtLastName.Text,
                    MiddleName = txtMiddleName.Text,
                    PassportS = Convert.ToInt32(txtPassportS.Text),
                    PassportN = Convert.ToInt32(txtPassportN.Text),
                    Phone = txtPhone.Text
                };
                using (HotelDbContext db = new HotelDbContext())
                {
                    db.Customers.Add(customer);
                    db.SaveChanges();
                }
                MessageBox.Show($"Посетитель успешно зарегистрирован");

                //var pageCustomers = new PageCustomers();
                //this.Content = pageCustomers;
            }
            catch (SqlException ex)
            {
                // Обработка SQL-исключения
                MessageBox.Show($"Ошибка при добавлении записи: {ex.Message}");
            }
            catch (Exception ex)
            {
                // Обработка других возможных исключений
                MessageBox.Show($"Произошла ошибка: {ex.Message}");
            }
        }
    }
}
