﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace EventsManager
    {
    public class RouteConfig
        {
        public static void RegisterRoutes(RouteCollection routes)
            {
            routes.IgnoreRoute ("{resource}.axd/{*pathInfo}");

            routes.MapRoute (
                name: "Default",
                url: "{controller}/{action}/{id}/{eventId}",
                defaults: new
                    {
                    controller = "Events",
                    action = "Index",
                    id = UrlParameter.Optional,
					eventId = UrlParameter.Optional
                    }
            );
			}
        }
    }
