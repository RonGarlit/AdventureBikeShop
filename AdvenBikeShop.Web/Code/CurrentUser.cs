using System.Security.Claims;
using System.Threading;
using BikeShop.Domain;
using Microsoft.AspNet.Identity;

namespace AdvenBikeShop.Web.Code
{
    // wrapper which gets stateful user data from the current thread
    // ** small facade pattern

    public static class CurrentUser
    {
        //string[] roles = Thread.CurrentPrincipal.IsInRole("Admin") ? new string[] { "Admin", "Member" } : new string[] { "Member" };

        // note: the first two properties are used on _Layout page
        public static bool IsAdmin { get { return Thread.CurrentPrincipal.IsInRole("Admin"); } }
        public static bool IsMember { get { return Thread.CurrentPrincipal.IsInRole("Member"); } }  
        public static bool IsAuthenticated { get { return Thread.CurrentPrincipal.Identity.IsAuthenticated; } }

        public static string Email { get { return Thread.CurrentPrincipal.Identity.Name; } }

        public static int? Id { get { return (UserSync.HasUserSyncd) ? (UserSync.Id) : 0; } }
        public static string FirstName { get { return (UserSync.HasUserSyncd) ? (UserSync.FirstName) : ""; } }
        public static string LastName { get { return (UserSync.HasUserSyncd) ? (UserSync.LastName) : ""; } }
        public static string FullName { get { return FirstName + " " + LastName; } }
        public static string City { get { return (UserSync.HasUserSyncd) ? (UserSync.City) : ""; } }
        public static string Country { get { return (UserSync.HasUserSyncd) ? (UserSync.Country) : ""; } }
    }
   
}