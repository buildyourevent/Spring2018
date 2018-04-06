using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Dynamic;
using Microsoft.AspNetCore.Mvc;
using BuildYourEvent.Models;
using Microsoft.AspNetCore.Http;
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
            List<Venues> venuesList = new List<Venues>();
            List<Photos> PhotosList = new List<Photos>();

            //model.Venues = (from v in _context.Venues where v.fk_venue_type == venueTypeId select v).ToList();
            var venues = (from v in _context.Venue_Types_Venues where v.fk_Venue_Type == venueTypeId select v.fk_Venue).ToArray();
            foreach(var item in venues)
            {
                var v = (from c in _context.Venues where c.id == item select c).FirstOrDefault();
                venuesList.Add(v);
                var pics = (from p in _context.Photos where p.fk_Venue == item select p).ToList();
                foreach(var photo in pics)
                {
                    PhotosList.Add(photo);
                }
            }
            model.Venues = venuesList.ToList();
            model.VenueStyles = _context.Styles.ToList();
            model.Amenities = _context.Amenities.ToList();
            model.EventTypes = _context.Event_Types.ToList();
            model.Features = _context.Features.ToList();
            model.OnSiteServices = _context.On_Site_Services.ToList();
            model.VenueRules = _context.Venue_Rules.ToList();
            model.Photos = PhotosList.ToList();

            return View(model);
        }
        public IActionResult Register()
        {

            return View();
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index");
        }
        public IActionResult RegisterUser(Users user,string companyName)
        {
            _context.Users.Add(user);
            _context.SaveChanges();
            short id = (from u in _context.Users where u.user_name == user.user_name && u.first_name == user.first_name select u.id).FirstOrDefault();
            Vendors vendor = new Vendors();
            vendor.fk_user = id;
            vendor.company_name = companyName;
            _context.Vendors.Add(vendor);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Login(String username, String password)
        {
           
            Users currentUser = (from u in _context.Users where u.user_name == username && u.password == password select u).FirstOrDefault();
            if (currentUser != null) {
                HttpContext.Session.SetInt32("userId", currentUser.id);
            }
            Vendors currentVendor = (from u in _context.Vendors where u.fk_user == currentUser.id select u).FirstOrDefault();
            if (currentVendor != null)
            {
                HttpContext.Session.SetInt32("vendorId", currentVendor.id);

            }
            
            return RedirectToAction("Index");
        }
        public IActionResult RegisterVenue()
        {
          
            
            dynamic model = new ExpandoObject();
            model.VenueTypes = _context.Venue_Types.ToList();
            model.VenueStyles = _context.Styles.ToList();
            model.Amenities = _context.Amenities.ToList();
            model.EventTypes = _context.Event_Types.ToList();
            model.Features = _context.Features.ToList();
            model.OnSiteServices = _context.On_Site_Services.ToList();
            model.VenueRules = _context.Venue_Rules.ToList();
            return View(model);

        }

        [HttpPost]
        public IActionResult AddVenue()
        {

            Locations loc = new Locations();
            loc.city=Request.Form["city"];
            loc.province = Request.Form["province"];
            loc.country= "Canada";
            loc.street = Request.Form["street"];
            loc.postal_code = Request.Form["postal_code"];
            loc.latitude="45";
            loc.longitude="75";

            _context.Locations.Add(loc);
            _context.SaveChanges();
            short locId = loc.id;

            Venues venue = new Venues();
            venue.name = Request.Form["name"];
            venue.guest_capacity = Convert.ToInt16(Request.Form["guest_capacity"]);
            venue.venue_size_sqf = Convert.ToDouble(Request.Form["venue_size_sqf"]);
            venue.price_hourly = Convert.ToDecimal(Request.Form["price_hourly"]);
            venue.price_daily = Convert.ToDecimal(Request.Form["price_daily"]);
            venue.fk_location = locId;
            venue.fk_Vendor = (short)HttpContext.Session.GetInt32("vendorId");

            _context.Venues.Add(venue);
            _context.SaveChanges();
            short venueId = venue.id;

            IList<Venue_Types_Venues> newVenueTypes = new List<Venue_Types_Venues>();
            var venueTypesIds = Request.Form["venueTypes"].ToList();
            foreach (String item in venueTypesIds) {
                newVenueTypes.Add(new Venue_Types_Venues()
                { fk_Venue = venueId, fk_Venue_Type = Convert.ToInt16(item) });
               
            }
            _context.Venue_Types_Venues.AddRange(newVenueTypes);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}
