using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;

namespace BuildYourEvent.Models
{
    public class VenuesDataContext : DbContext
    {
        public VenuesDataContext(DbContextOptions<VenuesDataContext> options)
            : base(options)
        {

        }
        public DbSet<Amenities> Amenities { get; set; }
        public DbSet<Event_Types> Event_Types { get; set; }
        public DbSet<Features> Features { get; set; }
        public DbSet<Locations> Locations { get; set; }
        public DbSet<On_Site_Services> On_Site_Services { get; set; }
        public DbSet<Styles> Styles { get; set; }
        public DbSet<User_Types> User_Types { get; set; }
        public DbSet<Users> Users { get; set; }
        public DbSet<Vendors> Vendors { get; set; }
        public DbSet<Venue_Rules> Venue_Rules { get; set; }
        public DbSet<Venue_Types> Venue_Types { get; set; }
        public DbSet<Venue> Venues { get; set; }

    }
}
