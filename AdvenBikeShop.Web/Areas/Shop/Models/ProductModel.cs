using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdvenBikeShop.Web.Areas.Shop.Models
{
    public class ProductModel
    {
        public int? Id { get; set; }
        public string Name { get; set; }
        public string ProductNumber { get; set; }
        public string Color { get; set; }
        public string Image { get; set; }
        public decimal ListPrice { get; set; }
        public float AvgStars { get; set; }
        public int? VendorId { get; set; }
        public string VendorName { get; set; }
        public VendorModel Vendor { get; set; }
        public int? CategoryId { get; set; }
        public string CategoryName { get; set; }
        public CategoryModel Category { get; set; }



    }
}