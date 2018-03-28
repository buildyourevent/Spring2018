using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BuildYourEvent.Models
{
    public class Users
    {
        [Required]
        public int id
        {
            get;
            set;
        }

        [Required]
        [StringLength(100)]
        public String user_name
        {
            get;
            set;
        }

        [Required]
        [StringLength(200)]
        public String password
        {
            get;
            set;
        }

        [Required]
        [StringLength(200)]
        public String email
        {
            get;
            set;
        }
        [ForeignKey("User_Types")]
        [Required]
        public int fk_user_type
        {
            get;
            set;
        }

    }
}