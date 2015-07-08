using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AdvenBikeShop.Web.Code.Paginate;

namespace AdvenBikeShop.Web.Areas.Shop.Models
{
    public class ProductsModel : PagedList<ProductModel>
    {
        // Search String from Search Input Box on Products (Shop) Page
        public string Q { get; set; }
        // Selected Sort Item on Products (Shop) Page
        public string Sort { get; set; }
        // Low end of price range slider
        public double PriceFrom { get; set; }
        // High end of price range slider
        public double PriceThru { get; set; }
        // VenderIds Keys ORDERED by Name from BikeShop Cache
        public int[] VendorIds { get; set; }
        // CategoryIds Keys ORDERED by CategoryName from BikeShop Cache
        public int[] CategoryIds { get; set; }
        // Check Reset Button status from Products (Shop) Page
        public bool Reset { get; set; }
        // List of Sort Choices
        public IDictionary<string, string> SortItems { get; set; }
        // List of Categories
        public IEnumerable<CategoryModel> Categories { get; set; }
        // List of Vendors
        public IEnumerable<VendorModel> Vendors { get; set; }

    }
}