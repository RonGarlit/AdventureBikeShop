using System;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using AdvenBikeShop.Web.Code;
using BikeShop.Domain;
using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity;


namespace AdvenBikeShop.Web.Areas.Home.Controllers
{
    [RouteArea("Home", AreaPrefix = "Home")]
    [Route("Home")]
    public class HomeController : BaseController
    {
        public HomeController()
        {
            //Setting up the Meta data for SEO, etc... varied for each controller through base class.
            Description = "Adventure Bike Shop is built on a custom variation of the AdventureWorks. http://msftdbprodsamples.codeplex.com/";
            Keywords = "HTML,CSS,XML,JavaScript,Responsive,AdventureWorks,Bike,BikeShop";
            Author = "Ronald Garlit";
        }

        [Route("~/")]
        [Route]
        [Route("Index")]
        public ActionResult Index()
        {
            // Get some data from the database using domain objects
            int usercount = BikeShopContext.Users.Count();
            int productcount = BikeShopContext.Products.Count();
            int vendercount = BikeShopContext.Vendors.Count();
            int partscategorycount = BikeShopContext.Products.Count(where: "CategoryName = @0", parms: "Parts");
            var productcategorycount = BikeShopContext.Categories.Count();
            var productcategorylist = BikeShopContext.Categories.All();

            //var something = BikeShopContext.Errors.All();
            
            string sqlquery = @"SELECT distinct CategoryId, CategoryName FROM [Product]";
            var categorylist = BikeShopContext.Products.Query(sqlquery).Select(c => new {c.CategoryId, c.CategoryName}).ToList();

            var categorydictionary = categorylist.ToDictionary(c => new { c.CategoryId, c.CategoryName });

            // Put in USER SYNC code here
            // Part of kludging in the new ASP.NET Identity stuff for now
            if (Thread.CurrentPrincipal.Identity.IsAuthenticated && Thread.CurrentPrincipal.Identity.Name != "")
            {
                var UsersList = BikeShopContext.Users.Single(where: "email=@0", parms: Thread.CurrentPrincipal.Identity.Name);

                if (UsersList != null)
                {
                    UserSync.AspNetUserId = UsersList.AspNetUserId;
                    UserSync.Email = UsersList.Email;
                    UserSync.Id = UsersList.Id;
                    UserSync.FirstName = UsersList.FirstName;
                    UserSync.LastName = UsersList.LastName;
                    UserSync.City = UsersList.City;
                    UserSync.Country = UsersList.Country;
                    UserSync.HasUserSyncd = true;
                }
                else
                {
                    UserSync.HasUserSyncd = false;
                }
            }

            ViewBag.UserCount = usercount;
            ViewBag.ProductCount = productcount;
            ViewBag.VenderCount = vendercount;
            ViewBag.NumberOfParts = partscategorycount;
            ViewBag.CategoryListing = categorylist;
            ViewBag.CatArrayList = categorylist.ToArray();
            ViewBag.CatListCount = categorylist.Count();


            ViewBag.Name = User.Identity.Name;
            ViewBag.UserId = User.Identity.GetUserId();
            ViewBag.UserIsAdmin = User.IsInRole("Admin");
            ViewBag.UserIsMember = User.IsInRole("Member");
            
           

            return View();
        }

        [Route("~/Home/About")]
        //[Authorize]
        public ActionResult About()
        {
            //throw new NotImplementedException("This has not been implemented yet.  Try back later,");
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [Route("~/Home/Contact")]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [Route("~/Home/Error")]
        public ActionResult Error()
        {
            return View();
        }

        [Route("~/Home/UnderConstruction")]
        public ActionResult UnderConstruction()
        {
            return View();
        }
    }
}
