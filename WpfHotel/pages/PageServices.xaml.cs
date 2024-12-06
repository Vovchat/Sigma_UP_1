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
    /// Логика взаимодействия для PageServices.xaml
    /// </summary>
    public partial class PageServices : Page
    {
        private List<Service> services;
        public PageServices()
        {
            InitializeComponent();

            using (HotelDbContext db = new HotelDbContext())
            {
                services = db.Services.ToList();
                LVService.ItemsSource = services;

                cmbRoom.ItemsSource = db.Rooms.ToList();
                cmbRoom.SelectedValuePath = "IdRooms";
                cmbRoom.DisplayMemberPath = "Number";

                cmbCustomer.ItemsSource = db.Customers.ToList();
                cmbCustomer.SelectedValuePath = "IdCustomers";
                cmbCustomer.DisplayMemberPath = "FirstName";
            }
        }

        private void btnAddS_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Service service = new Service();
                Room? room = cmbRoom.SelectedItem as Room;
                Customer? customer = cmbCustomer.SelectedItem as Customer;
                service.DateStart = DateOnly.Parse(dtpDateStart.Text);
                service.DateOver = DateOnly.Parse(dtpDateOver.Text);
                service.IdRooms = room.IdRooms;
                service.IdCustomers = customer.IdCustomers;

                using (HotelDbContext db = new HotelDbContext())
                {
                    db.Services.Add(service);
                    db.SaveChanges();
                }
                MessageBox.Show($"Услуга успешно добавлена");

                //var pageServices = new PageServices();
                //this.Content = pageServices;
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

        private void btnRedS_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (LVService.SelectedItem is Service selectedService)
                {
                    Service updatedService = new Service();
                    Room? room = cmbRoom.SelectedItem as Room;
                    Customer? customer = cmbCustomer.SelectedItem as Customer;

                    updatedService.IdServices = selectedService.IdServices;  // Сохранение идентификатора услуги
                    updatedService.DateStart = DateOnly.Parse(dtpDateStart.Text);
                    updatedService.DateOver = DateOnly.Parse(dtpDateOver.Text);
                    updatedService.IdRooms = room?.IdRooms ?? selectedService.IdRooms;  // Если комната не выбрана, остаётся старая комната
                    updatedService.IdCustomers = customer?.IdCustomers ?? selectedService.IdCustomers;  // Аналогично с клиентом

                    using (HotelDbContext db = new HotelDbContext())
                    {
                        var existingService = db.Services.Find(selectedService.IdServices);

                        if (existingService != null)
                        {
                            existingService.DateStart = updatedService.DateStart;
                            existingService.DateOver = updatedService.DateOver;
                            existingService.IdRooms = updatedService.IdRooms;
                            existingService.IdCustomers = updatedService.IdCustomers;

                            db.SaveChanges();
                        }
                    }

                    MessageBox.Show("Услуга успешно обновлена.");
                }
                else
                {
                    MessageBox.Show("Выберите услугу для редактирования.");
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show($"Ошибка при изменении записи: {ex.Message}");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошла ошибка: {ex.Message}");
            }
        }

        private void btnDelS_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (LVService.SelectedItem is Service selectedService)
                {
                    using (HotelDbContext db = new HotelDbContext())
                    {
                        var existingService = db.Services.Find(selectedService.IdServices);

                        if (existingService != null)
                        {
                            db.Services.Remove(existingService);
                            db.SaveChanges();

                            MessageBox.Show("Услуга успешно удалена.");
                        }
                        else
                        {
                            MessageBox.Show("Услуга не найдена в базе данных.");
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Выберите услугу для удаления.");
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show($"Ошибка при удалении записи: {ex.Message}");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошла ошибка: {ex.Message}");
            }
        }

        public List<Service> FilterServices(DateOnly dateStart, DateOnly dateOver, string roomNumber)
        {
            using (HotelDbContext db = new HotelDbContext())
            {
                return db.Services
                    .Where(s => s.DateStart >= dateStart && s.DateOver <= dateOver && s.RoomNumber == roomNumber)
                    .ToList();
            }
        }


        private void btnFlt_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                DateOnly dateStart = DateOnly.Parse(dtpFltDS.Text);
                DateOnly dateOver = DateOnly.Parse(dtpFltDO.Text);
                string roomNumber = txtFltRN.Text;

                List<Service> filteredServices = FilterServices(dateStart, dateOver, roomNumber);

                if (filteredServices.Count == 0)
                {
                    throw new Exception("Записи не найдены.");
                }

                LVService.ItemsSource = filteredServices;

                MessageBox.Show($"Найдено {filteredServices.Count} записей.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (ArgumentException ex)
            {
                MessageBox.Show(ex.Message, "Записи не найдены", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Произошла ошибка ввода. Попробуйте снова позже.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
