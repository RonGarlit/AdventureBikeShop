﻿using System.Web.Mvc;

namespace AdvenBikeShop.Web.Code
{
    // base class to all controllers

    public class BaseController : Controller
    {
        public string Title { set { ViewBag.Title = value; } }
        public string Keywords { set { ViewBag.Keywords = value; } }
        public string Description { set { ViewBag.Description = value; } }
        public string Author { set { ViewBag.Author = value; } }

        public string Success { set { TempData["Success"] = ViewData["Success"] = value; } }
        public string Failure { set { TempData["Failure"] = ViewData["Failure"] = value; } }

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (TempData["Success"] != null) ViewData["Success"] = TempData["Success"];
            if (TempData["Failure"] != null) ViewData["Failure"] = TempData["Failure"];

            base.OnActionExecuting(filterContext);
        }
    }
}
