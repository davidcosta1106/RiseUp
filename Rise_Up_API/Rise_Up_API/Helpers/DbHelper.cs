using Microsoft.EntityFrameworkCore;
using Rise_Up_API.Modules;

namespace Rise_Up_API.Helpers
{
    public class DbHelper : DbContext
    {
        public DbSet<Missions> Missions { get; set; }
        public DbSet<Material_Goods> Material_Goods { get; set; }
        public DbSet<Collection_Points> Collection_Points { get; set; }
        public DbSet<Missions_Collection_Points> Missions_Collection_Points { get; set; }
        public DbSet<Users> Users { get; set; }
        public DbSet<Associations> Associations { get; set; }
        public DbSet<Missions_Collection_Points_Fileter_Query> missions_Collection_Points_Fileter_Queries { get; set; }
        public DbSet<Payment_Method> Payment_Method { get; set; }
        public DbSet<Monetary_Donations> Monetary_Donations { get; set; }
        public DbSet<Association_Mission> Association_Mission { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Missions_Collection_Points>()
            .HasOne(l => l.Missions)
            .WithMany(c => c.missions_collection_points)
            .HasForeignKey(l => l.id_mission);

            modelBuilder.Entity<Missions_Collection_Points>()
            .HasOne(l => l.Collection_Points)
            .WithMany(c => c.missions_collection_points)
            .HasForeignKey(l => l.id_collection_point);

            modelBuilder.Entity<Monetary_Donations>()
            .HasOne(l => l.Missions)
            .WithMany(c => c.monetary_donations)
            .HasForeignKey(l => l.id_mission);

            modelBuilder.Entity<Monetary_Donations>()
            .HasOne(l => l.Users)
            .WithMany(c => c.monetary_donations)
            .HasForeignKey(l => l.id_user);

            modelBuilder.Entity<Monetary_Donations>()
            .HasOne(l => l.Associations)
            .WithMany(c => c.monetary_donations)
            .HasForeignKey(l => l.id_association);

            modelBuilder.Entity<Monetary_Donations>()
            .HasOne(l => l.Payment_Method)
            .WithMany(c => c.monetary_donations)
            .HasForeignKey(l => l.id_payment_method);

            modelBuilder.Entity<Association_Mission>()
            .HasOne(l => l.Missions)
            .WithMany(c => c.association_mission)
            .HasForeignKey(l => l.id_mission);

            modelBuilder.Entity<Association_Mission>()
            .HasOne(l => l.Associations)
            .WithMany(c => c.association_mission)
            .HasForeignKey(l => l.id_association);

        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Data Source=DESKTOP-63O6UL4\\SQLEXPRESS;Initial Catalog=RiseUp2;Integrated Security=True;Persist Security Info=False;Trust Server Certificate=True");
        }
    }
}
