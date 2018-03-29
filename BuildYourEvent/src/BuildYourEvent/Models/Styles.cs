﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using System.ComponentModel.DataAnnotations;

namespace BuildYourEvent.Models
{
    public class Styles
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
    }
}
