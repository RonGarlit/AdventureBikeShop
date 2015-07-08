using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AdvenBikeShop.Web.Areas.Shop.Models;
using AdvenBikeShop.Web.Code;
using AdvenBikeShop.Web.Code.Attributes;
using AdvenBikeShop.Web.Code.Caching;
using AdvenBikeShop.Web.Code.Extensions;
using AutoMapper;
using BikeShop.Domain;

namespace AdvenBikeShop.Web.Areas.Shop.Controllers
{


    [RouteArea("Shop", AreaPrefix = "Shop")]
    [Route("Product")]
    public class ProductController : BaseController
    {
        static Dictionary<string, string> SortItems { get; set; }
        static int[] AllCategoryIds { get; set; }
        static int[] AllVendorIds { get; set; }
        static ProductController()
        {
            // Setup variables and model mappings for Automapper.
            //TODO build a AutoMapper Config for App_Start
            
            SortItems = new Dictionary<string, string>();

            SortItems.Add("quantitysold_desc", "Popularity");
            SortItems.Add("avgstars_desc", "Rating");
            SortItems.Add("price_asc", "Price");

            AllCategoryIds = BikeShopCache.Categories.Keys.Cast<int>().ToArray();
            AllVendorIds = BikeShopCache.Vendors.Keys.Cast<int>().ToArray();

            // Setup Model Mappings with AutoMapper

            // the last item maps star ratings to a star image (10, 15, 20, 25, etc)
            Mapper.CreateMap<Product, ProductModel>()
                .ForMember(dest => dest.AvgStars, opt => opt.MapFrom(src => ((Math.Round(src.AvgStars * 2) / 2) * 10).ToString()));
            Mapper.CreateMap<Category, CategoryModel>();
            Mapper.CreateMap<Vendor, VendorModel>();


        }

        [HttpGet]
        // GET: Shop/Products
        [Route("Products")]
        public ActionResult Products(string sort = "quantitysold_desc", int[] categoryids = null, int[] vendorids = null, double priceFrom = 0, double priceThru = 5000, int page = 1, int pageSize = 10, string q = null, bool layout = true)
        {
            // **************************************************************************
            // SETUP PAGE CONTROL VARABLES FOR PASSING IN MODEL 
            // PRIOR TO SENDING TO THE PRODUCTS VIEW (AKA: SHOP VIEW)
            // **************************************************************************
            // very first time the page renders we have all Categories selected
            // First main filter on page is by categories AKA Catalogs like Parts, Bikes, etc..
            if (categoryids == null && !Request.IsAjaxRequest())
                categoryids = AllCategoryIds;

            // no layout and no Categories: activate all Categories
            if (categoryids == null && layout == false)
                categoryids = AllCategoryIds;
            
            // Vendors setup like categories here
            if (vendorids == null && !Request.IsAjaxRequest())
                vendorids = AllVendorIds;

            // no layout and no Vendors: activate all Vendors
            if (vendorids == null && layout == false)
                vendorids = AllVendorIds;

            // **************************************************************************
            // SETUP THE MODEL TO PASS TO THE VIEW HERE
            // **************************************************************************
            var model = new ProductsModel { Sort = sort, CategoryIds = categoryids, VendorIds = vendorids ,PriceFrom = priceFrom, PriceThru = priceThru, Page = page, PageSize = pageSize, Q = q, SortItems = SortItems };
            CheckForResetEnabled(model);

            // at least one artist needs to be selected
            if (categoryids != null)
            {
                Validate(sort, categoryids, priceFrom, priceThru, page, pageSize);

                string where = "ListPrice BETWEEN @0 AND @1 AND CategoryId IN (" + categoryids.CommaSeparate(a => a) + ")";
                object[] parms = new object[] { priceFrom, priceThru };
                string orderBy = sort.Replace("_", " ");

                if (!string.IsNullOrEmpty(q))
                {
                    where += " AND Name LIKE @2";
                    parms = new object[] { priceFrom, priceThru, Server.UrlDecode(q.Replace("...", "")) + "%" };
                }

                var products = BikeShopContext.Products.Paged(out model.TotalRows, where: where, orderBy: orderBy, page: page, pageSize: pageSize, parms: parms);

                model.Items = Mapper.Map<IEnumerable<Product>, IEnumerable<ProductModel>>(products);
                model.Categories = Mapper.Map<IEnumerable<Category>, IEnumerable<CategoryModel>>(BikeShopCache.Categories.Values);
                model.Items.ForEach(p => p.CategoryName = BikeShopCache.Categories[p.CategoryId].CategoryName);
                model.Vendors = Mapper.Map<IEnumerable<Vendor>, IEnumerable<VendorModel>>(BikeShopCache.Vendors.Values);
            }

            // this is only used when user moves through browser history (using History.js)
            // in that situation the entire page (but without layout) needs to be refreshed. 
            if (!layout && Request.IsAjaxRequest())
            {
                ViewBag.Layout = "No";  // flag to render page without layout
                return View(model);
            }

            // ajax requests return partial view only
            if (Request.IsAjaxRequest())
                return PartialView("_Products", model);

            return View(model);
        }

        // **************************************************************************
        // Helpers for page control
        // **************************************************************************
        void Validate(string sort, int[] categories, double priceFrom, double priceThru, int page, int pageSize)
        {
            // validate incoming entries. 
            if (!SortItems.ContainsKey(sort)) throw new ArgumentException("Invalid sort");
            foreach (var a in categories) if (a <= 0) throw new ArgumentException("Invalid category");
            if (priceFrom < 0 || priceThru > 5000) throw new ArgumentException("Invalid price range");
            if (page < 0) throw new ArgumentException("Invalid page");
            if (pageSize < 0) throw new ArgumentException("Invalid page size");
        }

        // if these are non-default values then reset button needs to be turned on
        void CheckForResetEnabled(ProductsModel model)
        {
            if (model.Page != 1 ||
                model.PriceFrom != 0 ||
                model.PriceThru != 500 ||
                (model.CategoryIds != null && model.CategoryIds.Count() != model.CategoryIds.Max()) ||
                model.Sort != "quantitysold_desc" ||
                !string.IsNullOrEmpty(model.Q))
            {
                model.Reset = true;
            }
        }

        [HttpGet]
        [AjaxOnly]
        public ActionResult Search(string term)
        {
            // NOTE: jQuery control requires that parameter be named 'term' and returned values be named 'label'
            var label = new List<string>();
            var items = BikeShopContext.Query("SELECT TOP 5 Name FROM [Product] WHERE Name Like @0 ORDER BY Name", term + "%");
            foreach (var item in items)
            {
                string l = item.Title.ToString();
                label.Add(l.Ellipsify(20));
            }

            return Json(label, JsonRequestBehavior.AllowGet);
        }

    }

}