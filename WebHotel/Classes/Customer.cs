using System;
using System.Collections.Generic;

namespace WebHotel.Classes;

public partial class Customer
{
    public int IdCustomers { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? MiddleName { get; set; }

    public int PassportS { get; set; }

    public int PassportN { get; set; }

    public string Phone { get; set; } = null!;

    public virtual ICollection<Service> Services { get; set; } = new List<Service>();
}
