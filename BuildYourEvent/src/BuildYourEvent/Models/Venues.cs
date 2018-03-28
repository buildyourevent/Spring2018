using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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


        [Required]
        public int fk_venue_type
        {
            get;
            set;
        }

        [Required]
        public int fk_event_type
        {
            get;
            set;
        }

        [Required]
        public int fk_amenity
        {
            get;
            set;
        }

        [Required]
        public int fk_venue_rule
        {
            get;
            set;
        }

        [Required]
        public int fk_style
        {
            get;
            set;
        }
        [Required]
        public int fk_feature
        {
            get;
            set;
        }
        [Required]
        public int fk_on_site_service
        {
            get;
            set;
        }
        [Required]
        public int fk_location
        {
            get;
            set;
        }

    }
}
