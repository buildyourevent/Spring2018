using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BuildYourEvent.Models
{
    public class Vendors
    {
        [Required]
        public short id
        {
            get;
            set;
        }
        [ForeignKey("Users")]
        [Required]
        public short fk_user
        {
            get;
            set;
        }

        [StringLength(50)]
        public short company_name
        {
            get;
            set;
        }
    }
}
