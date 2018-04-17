using System;
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
        public IActionResult Results(IList<IFormFile> files)
        {
            String fromResults = Request.Form["fromResults"];
            dynamic model = new ExpandoObject();
            short venueTypeId = Convert.ToInt16(Request.Form["venueTypeId"]);

            if (fromResults.Equals("n"))
            {
                
                List<Venues> venuesList = new List<Venues>();
                List<Photos> PhotosList = new List<Photos>();

                //model.Venues = (from v in _context.Venues where v.fk_venue_type == venueTypeId select v).ToList();
                var venues = (from v in _context.Venue_Types_Venues where v.fk_Venue_Type == venueTypeId select v.fk_Venue).ToArray();
                foreach (var item in venues)
                {
                    var v = (from c in _context.Venues where c.id == item select c).FirstOrDefault();
                    venuesList.Add(v);
                    //grab the first photo for each venue to place in the card
                    var pics = (from p in _context.Photos where p.fk_Venue == item select p).First();
                    //add this photo to a list to be passed to dynamic model
                    PhotosList.Add(pics);
                }
                model.Venues = venuesList.ToList();
                model.Photos = PhotosList.ToList();
            }
            else
            {
                
                List<Venues> venuesList = new List<Venues>();
                List<Photos> PhotosList = new List<Photos>();

                //finding requested fields
                int price = 0;
                int guests = 0;
                String venueStyle = "";
                String venueAmenities = "";
                String eventTypes = "";
                String features = "";
                String onSiteServices = "";
                String venueRules = "";

                String temp = Request.Form["price"];
                if (temp != null)
                {
                    //$ is added to the front of the money slider, needs to be stripped
                    temp = temp.Replace("$", "");
                    price = Convert.ToInt32(temp);
                }

                temp = Request.Form["guests"];
                if (temp != null && temp != "")
                {
                    //$ is added to the front of the money slider, needs to be stripped
                    temp = temp.Replace("$", "");
                    guests = Convert.ToInt32(temp);
                }

                venueStyle = Request.Form["venueStyle"];
                venueAmenities = Request.Form["amenities"];
                eventTypes = Request.Form["eventTypes"];
                features = Request.Form["features"];
                onSiteServices = Request.Form["onSiteServices"];
                venueRules = Request.Form["venueRules"];

                //filtering fields
                int fieldCount = 0;

                //grabbing venues from the price
                if (price > 0)
                {
                    ++fieldCount;
                    var venuePrices = (from v in _context.Venues where v.price_hourly <= price select v).ToArray();
                    foreach (var item in venuePrices)
                    {
                        venuesList.Add(item);
                    }
                }

                //grabbing venues from the guests
                if (guests > 0)
                {
                    ++fieldCount;
                    var venueGuests = (from v in _context.Venues where v.guest_capacity <= guests select v).ToArray();
                    foreach (var item in venueGuests)
                    {
                        venuesList.Add(item);
                    }
                }

                //grabbing venues from the style
                if (venueStyle != null && venueStyle != "" && venueStyle != "None")
                {
                    ++fieldCount;
                    var StyleId = (from v in _context.Styles where v.name == venueStyle select v.id).FirstOrDefault();
                    var venuesFks = (from v in _context.Styles_Venues where v.fk_Style == StyleId select v.fk_Venue).ToArray();

                    foreach (var venue in venuesFks)
                    {
                        var venueFromStyles = (from v in _context.Venues where v.id == venue select v).FirstOrDefault();
                        venuesList.Add(venueFromStyles);
                    }
                }

                //spliting amentities in string
                List<int> amenitiesList = venueAmenities.Split(',').Select(int.Parse).ToList();
                if (venueAmenities != null && venueAmenities != "")
                {
                    foreach(var amenitieId in amenitiesList)
                    {
                        ++fieldCount;
                        var venueIdList = (from v in _context.Amenities_Venues where v.fk_Amenity == amenitieId select v.fk_Venue).ToList();

                        foreach (var venueId in venueIdList)
                        {
                            var venue = (from v in _context.Venues where v.id == venueId select v).FirstOrDefault();
                            venuesList.Add(venue);
                        }
                    }
                }

                //spliting eventTypes in string
                List<int> eventTypesList = eventTypes.Split(',').Select(int.Parse).ToList();
                if (eventTypes != null && eventTypes != "")
                {
                    foreach (var eventTypesId in eventTypesList)
                    {
                        ++fieldCount;
                        var venueIdList = (from v in _context.Event_Types_Venues where v.fk_Event_Type == eventTypesId select v.fk_Venue).ToList();

                        foreach (var venueId in venueIdList)
                        {
                            var venue = (from v in _context.Venues where v.id == venueId select v).FirstOrDefault();
                            venuesList.Add(venue);
                        }
                    }
                }

                //spliting features in string
                List<int> featuresList = features.Split(',').Select(int.Parse).ToList();
                if (features != null && features != "")
                {
                    foreach (var featuresId in featuresList)
                    {
                        ++fieldCount;
                        var venueIdList = (from v in _context.Features_Venues where v.fk_Feature == featuresId select v.fk_Venue).ToList();

                        foreach (var venueId in venueIdList)
                        {
                            var venue = (from v in _context.Venues where v.id == venueId select v).FirstOrDefault();
                            venuesList.Add(venue);
                        }
                    }
                }

                //spliting eventTypes in string
                List<int> onSiteServicesList = onSiteServices.Split(',').Select(int.Parse).ToList();
                if (onSiteServices != null && onSiteServices != "")
                {
                    foreach (var onSiteServicesId in onSiteServicesList)
                    {
                        ++fieldCount;
                        var venueIdList = (from v in _context.On_Site_Services_Venues where v.fk_On_Site_Service == onSiteServicesId select v.fk_Venue).ToList();

                        foreach (var venueId in venueIdList)
                        {
                            var venue = (from v in _context.Venues where v.id == venueId select v).FirstOrDefault();
                            venuesList.Add(venue);
                        }
                    }
                }

                //spliting venueRules in string
                List<int> venueRulesList = venueRules.Split(',').Select(int.Parse).ToList();
                if (venueRules != null && venueRules != "")
                {
                    foreach (var venueRulesId in venueRulesList)
                    {
                        ++fieldCount;
                        var venueIdList = (from v in _context.Venue_Rules_Venues where v.fk_Venue_Rule == venueRulesId select v.fk_Venue).ToList();

                        foreach (var venueId in venueIdList)
                        {
                            var venue = (from v in _context.Venues where v.id == venueId select v).FirstOrDefault();
                            venuesList.Add(venue);
                        }
                    }
                }

                //removing duplicates from the list and populating photos
                List<Venues> commonVenues = new List<Venues>();
                foreach (var venue in venuesList)
                {
                    var count = (from v in venuesList where v.id == venue.id select v).Count();
                    if (count == fieldCount)
                    {
                        commonVenues.Add(venue);

                        //grab the first photo for each venue to place in the card
                        var pics = (from p in _context.Photos where p.fk_Venue == venue.id select p).First();
                        //add this photo to a list to be passed to dynamic model
                        PhotosList.Add(pics);
                    }
                }
                commonVenues = commonVenues.GroupBy(x => x.id).Select(g => g.First()).ToList();
                PhotosList = PhotosList.GroupBy(x => x.id).Select(g => g.First()).ToList();

                //updating the models
                model.Venues = commonVenues.ToList();
                model.Photos = PhotosList.ToList();
            }
            model.VenueTypeId = venueTypeId;
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
