using System;
using System.Collections.Generic;

namespace WpfLibHotel;

public partial class Service
{
    public int IdServices { get; set; }

    public DateOnly DateStart { get; set; }

    public DateOnly DateOver { get; set; }

    public int? Days { get; set; }

    public int? Sum { get; set; }

    public int IdRooms { get; set; }

    public int IdCustomers { get; set; }

    public string? CustomerName { get; set; }

    public string? RoomNumber { get; set; }

    public virtual Customer IdCustomersNavigation { get; set; } = null!;

    public virtual Room IdRoomsNavigation { get; set; } = null!;
}
