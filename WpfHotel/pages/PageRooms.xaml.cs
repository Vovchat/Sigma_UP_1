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
    /// Логика взаимодействия для PageRooms.xaml
    /// </summary>
    public partial class PageRooms : Page
    {
        private List<Room> rooms;
        public PageRooms()
        {
            InitializeComponent();

            using (HotelDbContext db = new HotelDbContext())
            {
                rooms = db.Rooms.ToList();
                LVRooms.ItemsSource = rooms;

                cmbType.Items.Add("single");
                cmbType.Items.Add("double");
                cmbType.Items.Add("tabor");

                cmbStatus.Items.Add("Banned");
            }
        }

        private void btnAddR_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Room room = new Room();
                room.Number = txtNumber.Text;
                room.Type = cmbType.Text;
                room.Status = cmbStatus.Text;

                using (HotelDbContext db = new HotelDbContext())
                {
                    db.Rooms.Add(room);
                    db.SaveChanges();
                }
                MessageBox.Show($"Комната создана успешно");
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

        private void btnDelR_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (LVRooms.SelectedItem is Room selectedRoom)
                {
                    using (HotelDbContext db = new HotelDbContext())
                    {
                        var existingRoom = db.Rooms.Find(selectedRoom.IdRooms);

                        if (existingRoom != null)
                        {
                            db.Rooms.Remove(existingRoom);
                            db.SaveChanges();

                            MessageBox.Show("Комната успешно удалена.");
                        }
                        else
                        {
                            MessageBox.Show("Комната не найдена в базе данных.");
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Выберите комнату для удаления.");
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
    }
}
