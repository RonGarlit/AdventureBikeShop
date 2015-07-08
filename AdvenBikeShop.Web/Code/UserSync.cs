using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdvenBikeShop.Web.Code
{
    public static class UserSync
    {

        public static int? Id { get; set; }
        public static string FirstName { get; set; }
        public static string LastName { get; set; }
        public static string Email { get; set; }
        public static string City { get; set; }
        public static string Country { get; set; }
        public static string AspNetUserId { get; set; }
        public static bool HasUserSyncd { get; set; }
    }
}