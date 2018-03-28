using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using System.ComponentModel.DataAnnotations;

namespace BuildYourEvent.Models
{
    public class Vendors
    {
        [Required]
        public int id
        {
            get;
            set;
        }

        [Required]
        public int fk_user
        {
            get;
            set;
        }

        [Required]
        public int fk_venue
        {
            get;
            set;
        }
    }
}
