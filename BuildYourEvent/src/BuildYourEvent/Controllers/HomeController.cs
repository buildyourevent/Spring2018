﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Dynamic;
using Microsoft.AspNetCore.Mvc;
using BuildYourEvent.Models;
// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace BuildYourEvent.Controllers
{
    public class HomeController : Controller
    {
        private VenuesDataContext _context; 

        public HomeController(VenuesDataContext context)
        {
            _context = context;
        }
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View(_context.Venue_Types.ToList());
        }

        public IActionResult Results(short venueTypeId)
        {
            dynamic model = new ExpandoObject();
            model.Venues = (from v in _context.Venue_Types_Venues where v.fk_Venue_Type == venueTypeId select v).ToList();
            model.VenueStyles = _context.Styles.ToList();
            model.Amenities = _context.Amenities.ToList();
            model.EventTypes = _context.Event_Types.ToList();
            model.Features = _context.Features.ToList();
            model.OnSiteServices = _context.On_Site_Services.ToList();
            model.VenueRules = _context.Venue_Rules.ToList();
            return View(model);
        }
        public IActionResult Register()
        {

            return View();
        }
    }
}
