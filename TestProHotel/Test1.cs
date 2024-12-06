using Microsoft.VisualStudio.TestTools.UnitTesting;
using WpfLibHotel;

namespace TestProHotel
{
    [TestClass]
    public sealed class Test1
    {
        [TestMethod]
        public void AddNewCustomer_ShouldAddCustomerToDatabase()
        {
            // Arrange
            using (var context = new HotelDbContext())
            {
                var firstName = "John";
                var lastName = "Doe";
                var middleName = "Middle";
                var passportSeries = 1234;
                var passportNumber = 567890;
                var phone = "+11112223333";

                // Act
                context.Customers.Add(new Customer
                {
                    FirstName = firstName,
                    LastName = lastName,
                    MiddleName = middleName,
                    PassportS = passportSeries,
                    PassportN = passportNumber,
                    Phone = phone
                });
                context.SaveChanges();

                // Assert
                var addedCustomer = context.Customers.SingleOrDefault(
                    c => c.FirstName == firstName &&
                         c.LastName == lastName &&
                         c.PassportS == passportSeries &&
                         c.PassportN == passportNumber &&
                         c.Phone == phone);

                Assert.IsNotNull(addedCustomer);
            }
        }

        [TestMethod]
        public void UpdateExistingCustomer_ShouldUpdateCustomerInDatabase()
        {
            // Arrange
            using (var context = new HotelDbContext())
            {
                var existingCustomer = context.Customers.FirstOrDefault();
                if (existingCustomer != null)
                {
                    var updatedFirstName = "Jane";
                    var updatedLastName = "Smith";

                    // Act
                    existingCustomer.FirstName = updatedFirstName;
                    existingCustomer.LastName = updatedLastName;
                    context.SaveChanges();

                    // Assert
                    var updatedCustomer = context.Customers.Find(existingCustomer.IdCustomers);
                    Assert.AreEqual(updatedFirstName, updatedCustomer.FirstName);
                    Assert.AreEqual(updatedLastName, updatedCustomer.LastName);
                }
                else
                {
                    Assert.Fail("No customer found in the database.");
                }
            }
        }

        [TestMethod]
        public void DeleteCustomer_ShouldRemoveCustomerFromDatabase()
        {
            // Arrange
            using (var context = new HotelDbContext())
            {
                var customerToDelete = context.Customers.FirstOrDefault();
                if (customerToDelete != null)
                {
                    // Act
                    context.Customers.Remove(customerToDelete);
                    context.SaveChanges();

                    // Assert
                    var deletedCustomer = context.Customers.Find(customerToDelete.IdCustomers);
                    Assert.IsNull(deletedCustomer);
                }
                else
                {
                    Assert.Fail("No customer found in the database.");
                }
            }
        }

        [TestMethod]
        public void GetAllCustomers_ShouldReturnListOfCustomers()
        {
            // Arrange & Act
            using (var context = new HotelDbContext())
            {
                var allCustomers = context.Customers.ToList();

                // Assert
                Assert.IsTrue(allCustomers.Count > 0);
            }
        }

        [TestMethod]
        public void GetRoomByNumber_ShouldReturnCorrectRoom()
        {
            // Arrange
            using (var context = new HotelDbContext())
            {
                var roomNumber = "101"; // предположим, что такой номер существует

                // Act
                var room = context.Rooms.SingleOrDefault(r => r.Number == roomNumber);

                // Assert
                Assert.IsNotNull(room);
                Assert.AreEqual(roomNumber, room.Number);
            }
        }
    }
}