using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace Demo
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {

            //forrmat json
            var json = config.Formatters.JsonFormatter;
            json.SerializerSettings.PreserveReferencesHandling = Newtonsoft.Json.PreserveReferencesHandling.Objects;
            json.SerializerSettings.ReferenceLoopHandling
                        = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
            config.Formatters.Remove(config.Formatters.XmlFormatter);
            //end

            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "saveInvoice",
                routeTemplate: "api/save-invoice",
                defaults: new { controller = "APIDemo", action = "saveInvoice" }
            );

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
