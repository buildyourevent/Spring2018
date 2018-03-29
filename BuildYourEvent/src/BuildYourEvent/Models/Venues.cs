using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;


namespace BuildYourEvent.Models
{
    public class Venues
    {
        [Required]
        public short id
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
        public short guest_capacity
        {
            get;
            set;
        }

        [Required]
        public double venue_size_sqf
        {
            get;
            set;
        }

        [Required]
        public Decimal price_hourly
        {
            get;
            set;
        }

        [Required]
        //[DataType(DataType.Currency)]
        public Decimal price_daily
        {
            get;
            set;
        }

        [ForeignKey("Venue_Types")]
        [Required]
        public short fk_venue_type
        {
            get;
            set;
        }

        [ForeignKey("Event_Types")]
        [Required]
        public short fk_event_type
        {
            get;
            set;
        }

        [ForeignKey("Amenities")]
        [Required]
        public short fk_amenity
        {
            get;
            set;
        }

        [ForeignKey("Venue_Rules")]
        [Required]
        public short fk_venue_rule
        {
            get;
            set;
        }

        [ForeignKey("Styles")]
        [Required]
        public short fk_style
        {
            get;
            set;
        }

        [ForeignKey("Features")]
        [Required]
        public short fk_feature
        {
            get;
            set;
        }

        [ForeignKey("On_Site_Services")]
        [Required]
        public short fk_on_site_service
        {
            get;
            set;
        }

        [ForeignKey("Locations")]
        [Required]
        public short fk_location
        {
            get;
            set;
        }

    }
}
