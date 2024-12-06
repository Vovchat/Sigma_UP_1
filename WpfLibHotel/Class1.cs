//Scaffold - DbContext "Server=44-5;Database=HotelDB;TrustServerCertificate=True;Trusted_Connection=True" Microsoft.EntityFrameworkCore.SqlServer

using WpfLibHotel;

namespace WpfHotel.BusinessLogic
{
    public class AddCustomer
    {
        private readonly HotelDbContext _context;

        public AddCustomer(HotelDbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public void AddNewCustomer(string firstName, string lastName, string middleName,
                                   int passportSeries, int passportNumber, string phone)
        {
            var customer = new Customer
            {
                FirstName = firstName,
                LastName = lastName,
                MiddleName = middleName,
                PassportS = passportSeries,
                PassportN = passportNumber,
                Phone = phone
            };

            _context.Customers.Add(customer);
            _context.SaveChanges();
        }
    }
}