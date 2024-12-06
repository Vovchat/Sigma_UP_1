using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WpfLibHotel;

public partial class HotelDbContext : DbContext
{
    public HotelDbContext()
    {
    }

    public HotelDbContext(DbContextOptions<HotelDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Room> Rooms { get; set; }

    public virtual DbSet<Service> Services { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=44-5;Database=HotelDB;TrustServerCertificate=True;Trusted_Connection=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.IdCustomers).HasName("PK_customers_tbl");

            entity.ToTable("customers");

            entity.Property(e => e.IdCustomers).HasColumnName("id_customers");
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
            entity.Property(e => e.MiddleName).HasMaxLength(50);
            entity.Property(e => e.Phone)
                .HasMaxLength(11)
                .IsFixedLength();
        });

        modelBuilder.Entity<Room>(entity =>
        {
            entity.HasKey(e => e.IdRooms).HasName("PK_rooms_tbl");

            entity.ToTable("rooms");

            entity.Property(e => e.IdRooms).HasColumnName("id_rooms");
            entity.Property(e => e.Number)
                .HasMaxLength(3)
                .IsFixedLength();
            entity.Property(e => e.Status).HasMaxLength(50);
            entity.Property(e => e.Type).HasMaxLength(50);
        });

        modelBuilder.Entity<Service>(entity =>
        {
            entity.HasKey(e => e.IdServices).HasName("PK_services_tbl");

            entity.ToTable("services", tb => tb.HasTrigger("trg_services_all_actions"));

            entity.HasIndex(e => new { e.RoomNumber, e.DateStart, e.DateOver }, "UQ_Services_RoomNumber_DateRange").IsUnique();

            entity.Property(e => e.IdServices).HasColumnName("id_services");
            entity.Property(e => e.CustomerName).HasMaxLength(150);
            entity.Property(e => e.IdCustomers).HasColumnName("id_customers");
            entity.Property(e => e.IdRooms).HasColumnName("id_rooms");
            entity.Property(e => e.RoomNumber)
                .HasMaxLength(3)
                .IsFixedLength();

            entity.HasOne(d => d.IdCustomersNavigation).WithMany(p => p.Services)
                .HasForeignKey(d => d.IdCustomers)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_services_customers");

            entity.HasOne(d => d.IdRoomsNavigation).WithMany(p => p.Services)
                .HasForeignKey(d => d.IdRooms)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_services_rooms");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
