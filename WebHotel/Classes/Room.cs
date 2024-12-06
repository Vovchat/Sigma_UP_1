using System;
using System.Collections.Generic;

namespace WebHotel.Classes;

public partial class Room
{
    public int IdRooms { get; set; }

    public string Number { get; set; } = null!;

    public string Type { get; set; } = null!;

    public string? Status { get; set; }

    public virtual ICollection<Service> Services { get; set; } = new List<Service>();
}
