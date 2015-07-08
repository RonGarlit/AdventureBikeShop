using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Caching;
using BikeShop.Domain;

namespace AdvenBikeShop.Web.Code.Caching
{
    // General caching tool for caching frequently used, but infrequently changing data.
    // Category and Vendor are good examples of never or rarely changing data. 

    public static class BikeShopCache
    {
        #region cache management
        // TODO Add more notes on cache setup and use
        static ObjectCache cache = new MemoryCache("BikeShop");
        static object locker = new object();

        public static readonly string CategoryKey = "CategoryKey";
        public static readonly string VendorKey = "VendorKey";  

        // Clear Entire Cache
        public static void Clear()
        {
            foreach (var item in cache)
                cache.Remove(item.Key);
        }

        // Clears Single Cache Entry
        public static void Clear(string key)
        {
            cache.Remove(key);
        }

        // Add to Cache Helper
        static void Add(string key, object value, DateTimeOffset expiration, CacheItemPriority priority = CacheItemPriority.Default)
        {
            var policy = new CacheItemPolicy();
            policy.AbsoluteExpiration = expiration;
            policy.Priority = priority;

            var item = new CacheItem(key, value);
            cache.Add(item, policy);
        }

        #endregion

        // Category cache which is used throughout the application.
        // Returns CategoryIds Keys ORDERED by CategoryName from BikeShop Cache

        public static Dictionary<int?, Category> Categories
        {
            get
            {
                // ** Lazy load pattern 
                var categoryDictionary = cache[CategoryKey] as Dictionary<int?, Category>;
                if (categoryDictionary == null)
                {
                    lock (locker)
                    {
                        categoryDictionary = BikeShopContext.Categories.All(orderBy: "CategoryName").ToDictionary(a => a.Id);
                        //**We be lazy loading here.
                        Add(CategoryKey, categoryDictionary, DateTime.Now.AddHours(1));
                    }
                }

                return categoryDictionary;
            }
        }

        // Clears Categories Cache
        public static void ClearCategories()
        {
            Clear(CategoryKey);
        }

        // Vendors cache which is used throughout the application.
        // Returns VenderIds Keys ORDERED by Name from BikeShop Cache

        public static Dictionary<int?, Vendor> Vendors
        {
            get
            {
                // ** Lazy load pattern 
                var vendorDictionary = cache[VendorKey] as Dictionary<int?, Vendor>;
                if (vendorDictionary == null)
                {
                    lock (locker)
                    {
                        vendorDictionary = BikeShopContext.Vendors.All(orderBy: "Name").ToDictionary(a => a.Id);
                        //**We be lazy loading here.
                        Add(VendorKey, vendorDictionary, DateTime.Now.AddHours(1));
                    }
                }

                return vendorDictionary;
            }
        }

        // Clears Vendors Cache
        public static void ClearVendors()
        {
            Clear(VendorKey);
        }
    }
}