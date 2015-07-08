using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Script.Serialization;
using System.Web.Security;
using AdvenBikeShop.Web.Code;
using BikeShop.Domain;
using Microsoft.AspNet.Identity;


namespace AdvenBikeShop.Web
{
    // Note: For instructions on enabling IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=301868
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            // MVC attribute routes registration
            // Do BEFORE Registering all areas!!!
            RouteTable.Routes.MapMvcAttributeRoutes();
 

            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        // last resort error logging
        // note: customErrors in web config specifies error page

        protected void Application_Error(object sender, EventArgs e)
        {
            // get last exception
            var exception = HttpContext.Current.Server.GetLastError();

            if (exception != null)
                LogException(exception);
        }

        // logs an exception with relevant context data to the error table

        private void LogException(Exception exception)
        {
            // try-catch because database itself could be down or Request context is unknown.

            try
            {
                int? userId = null;
                try
                {
                    userId = 999; //CurrentUser.Id;
                }
                catch
                {
                    /* do nothing */
                }

                // ** Prototype pattern. the Error object has it default values initialized

                var error = new Error(true)
                {
                    UserId = userId,
                    Exception = exception.GetType().FullName,
                    Message = exception.Message,
                    Everything = exception.ToString(),
                    IpAddress = HttpContext.Current.Request.UserHostAddress,
                    UserAgent = HttpContext.Current.Request.UserAgent,
                    PathAndQuery =
                        HttpContext.Current.Request.Url == null ? "" : HttpContext.Current.Request.Url.PathAndQuery,
                    HttpReferer =
                        HttpContext.Current.Request.UrlReferrer == null
                            ? ""
                            : HttpContext.Current.Request.UrlReferrer.PathAndQuery
                };

                BikeShopContext.Errors.Insert(error);
            }
            catch
            {
                /* do nothing, or send email to webmaster*/
            }
        }

    }
}
