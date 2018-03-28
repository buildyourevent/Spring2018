using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;


namespace BuildYourEvent.Models
{
    public class Venue
    {
        [Required]
        public int id
        {
            get;
            set;
        }

        [Required]
        [StringLength(200)]
        public String name
        {
            get;
            set;
        }

        [Required]
        public int guest_capacity
        {
            get;
            set;
        }

        [Required]
        public float venue_size_sqf
        {
            get;
            set;
        }

        [Required]
        public float price_hourly
        {
            get;
            set;
        }

        [Required]
        public float price_daily
        {
            get;
            set;
        }

        [ForeignKey("Venue_Types")]
        [Required]
        public int fk_venue_type
        {
            get;
            set;
        }

        [ForeignKey("Event_Types")]
        [Required]
        public int fk_event_type
        {
            get;
            set;
        }

        [ForeignKey("Amenities")]
        [Required]
        public int fk_amenity
        {
            get;
            set;
        }

        [ForeignKey("Venue_Rules")]
        [Required]
        public int fk_venue_rule
        {
            get;
            set;
        }

        [ForeignKey("Styles")]
        [Required]
        public int fk_style
        {
            get;
            set;
        }

        [ForeignKey("Features")]
        [Required]
        public int fk_feature
        {
            get;
            set;
        }

        [ForeignKey("On_Site_Services")]
        [Required]
        public int fk_on_site_service
        {
            get;
            set;
        }

        [ForeignKey("Locations")]
        [Required]
        public int fk_location
        {
            get;
            set;
        }

    }
}
