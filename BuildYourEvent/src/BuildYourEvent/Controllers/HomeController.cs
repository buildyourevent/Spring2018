﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Dynamic;
using Microsoft.AspNetCore.Mvc;
using BuildYourEvent.Models;
using Microsoft.AspNetCore.Http;
using System.IO;
using Microsoft.AspNetCore.Hosting;
// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace BuildYourEvent.Controllers
{
    public class HomeController : Controller
    {
        private VenuesDataContext _context;
        private IHostingEnvironment _hostingEnvironment;

        public HomeController(VenuesDataContext context, IHostingEnvironment environment)
        {
            _context = context;
            _hostingEnvironment = environment;
        }
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View(_context.Venue_Types.ToList());
        }
        public IActionResult ComingSoon()
        {
            return View();
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
                //grab the first photo for each venue to place in the card
                var pics = (from p in _context.Photos where p.fk_Venue == item select p).First();
                    //add this photo to a list to be passed to dynamic model
                    PhotosList.Add(pics);
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
                HttpContext.Session.SetString("firstName",currentUser.first_name);
                HttpContext.Session.SetInt32("userId", currentUser.id);
                Vendors currentVendor = (from u in _context.Vendors where u.fk_user == currentUser.id select u).FirstOrDefault();
                if (currentVendor != null)
                {
                    HttpContext.Session.SetInt32("vendorId", currentVendor.id);

                }
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
        public async Task<IActionResult> AddVenue(IList<IFormFile> files)
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

            /*Code for each of the filter types*/
            /*Venue Types*/
            IList<Venue_Types_Venues> newVenueTypes = new List<Venue_Types_Venues>();
            var venueTypesIds = Request.Form["venueTypes"].ToList();
            foreach (String item in venueTypesIds) {
                newVenueTypes.Add(new Venue_Types_Venues()
                { fk_Venue = venueId, fk_Venue_Type = Convert.ToInt16(item) });
            }
            _context.Venue_Types_Venues.AddRange(newVenueTypes);
            //do i need to save changes from here on out? since these don't rely on each other?
          //  _context.SaveChanges();

            /*Venue Rules*/
            IList<Venue_Rules_Venues> newVenueRules = new List<Venue_Rules_Venues>();
            var venueRulesIds = Request.Form["venueRules"].ToList();
            foreach (String item in venueRulesIds)
            {
                newVenueRules.Add(new Venue_Rules_Venues()
                { fk_Venue = venueId, fk_Venue_Rule = Convert.ToInt16(item) });
            }
            _context.Venue_Rules_Venues.AddRange(newVenueRules);
         //   _context.SaveChanges();

            /*Amenities*/
            IList<Amenities_Venues> newAmenities = new List<Amenities_Venues>();
            var amenitiesIds = Request.Form["amenities"].ToList();
            foreach (String item in amenitiesIds)
            {
                newAmenities.Add(new Amenities_Venues()
                { fk_Venue = venueId, fk_Amenity = Convert.ToInt16(item) });
            }
            _context.Amenities_Venues.AddRange(newAmenities);
         //   _context.SaveChanges();

            /*Event Types*/
            IList<Event_Types_Venues> newEventTypes = new List<Event_Types_Venues>();
            var eventTypesIds = Request.Form["eventTypes"].ToList();
            foreach (String item in eventTypesIds)
            {
                newEventTypes.Add(new Event_Types_Venues()
                { fk_Venue = venueId, fk_Event_Type = Convert.ToInt16(item) });
            }
            _context.Event_Types_Venues.AddRange(newEventTypes);
            //do i need to save changes from here on out? since these don't rely on each other?
         //   _context.SaveChanges();

            /*On Site Services*/
            IList<On_Site_Services_Venues> newOnSiteServicesTypes = new List<On_Site_Services_Venues>();
            var onSiteServicesTypesIds = Request.Form["onSiteServices"].ToList();
            foreach (String item in onSiteServicesTypesIds)
            {
                newOnSiteServicesTypes.Add(new On_Site_Services_Venues()
                { fk_Venue = venueId, fk_On_Site_Service = Convert.ToInt16(item) });
            }
            _context.On_Site_Services_Venues.AddRange(newOnSiteServicesTypes);
            //do i need to save changes from here on out? since these don't rely on each other?
           // _context.SaveChanges();

            /*Style Venues*/
            IList<Styles_Venues> newStylesTypes = new List<Styles_Venues>();
            var stylesTypes = Request.Form["venueStyles"].ToList();
            foreach (String item in stylesTypes)
            {
                newStylesTypes.Add(new Styles_Venues()
                { fk_Venue = venueId, fk_Style = Convert.ToInt16(item) });
            }
            _context.Styles_Venues.AddRange(newStylesTypes);
            //do i need to save changes from here on out? since these don't rely on each other?
         //   _context.SaveChanges();

            /*Features Venues*/
            IList<Features_Venues> newFeatures = new List<Features_Venues>();
            var featuresTypes = Request.Form["features"].ToList();
            foreach (String item in featuresTypes)
            {
                newFeatures.Add(new Features_Venues()
                { fk_Venue = venueId, fk_Feature = Convert.ToInt16(item) });
            }
            _context.Features_Venues.AddRange(newFeatures);
            //do i need to save changes from here on out? since these don't rely on each other?
            _context.SaveChanges();

            //testing stuff
            var uploads = Path.Combine(_hostingEnvironment.WebRootPath, "Images");
            foreach (var file in files)
            {
                if (file.Length > 0)
                {
                    Photos photo = new Models.Photos();
                    photo.filename = file.FileName;
                    var filePath = Path.Combine(uploads, file.FileName);
                    /*This next line has to change when we decide how to store images in a filesystem*/
                    var dbFilePath = "~/Images/" + file.FileName;
                    photo.url = dbFilePath;
                    photo.fk_Venue = venueId;
                    _context.Photos.Add(photo);
                    _context.SaveChanges();
                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        await file.CopyToAsync(fileStream);
                    }
                }
            }


            return RedirectToAction("Index");
        }
    }
}
