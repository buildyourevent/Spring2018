using System;
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
            model.Venues = (from v in _context.Venues where v.fk_venue_type == venueTypeId select v).ToList();
            return View(model);
        }
        public IActionResult Register()
        {

            return View();
        }
    }
}
