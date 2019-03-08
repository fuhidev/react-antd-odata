using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Formatting;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.OData.Builder;
using System.Web.Http.OData.Extensions;
using WebAPI.DataProvider.EF;

namespace WebAPI
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes

            EnableCorsAttribute cors = new EnableCorsAttribute("*", "*", "*");
            config.EnableCors(cors);

            config.MapHttpAttributeRoutes();

            config.MessageHandlers.Add(new TokenValidationHandler());

            ODataConventionModelBuilder builder = new ODataConventionModelBuilder();
            builder.EntitySet<SYS_Account>("Accounts");
            builder.EntitySet<SYS_Role>("Roles");
            builder.EntitySet<SYS_Capability_Role>("CapabilityRoles");
            builder.EntitySet<SYS_GroupRole>("GroupRoles");
            builder.EntitySet<SYS_Layer_Role>("LayerRoles");
            builder.EntitySet<SYS_Capability_Account>("CapabilityAccounts");
            builder.EntitySet<SYS_Layer_Account>("LayerAccounts");
            builder.EntitySet<SYS_Logger_Capability>("LoggerCapabilities");
            builder.EntitySet<SYS_Logger_Layer>("LoggerLayers");

            config.Routes.MapODataServiceRoute("odata", "odata", builder.GetEdmModel());
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
            //config.Formatters.Clear();

            //var jsonFormaterrs = new JsonMediaTypeFormatter();
            //jsonFormaterrs.SerializerSettings.PreserveReferencesHandling = Newtonsoft.Json.PreserveReferencesHandling.Objects;

            //config.Formatters.Add(jsonFormaterrs);

            GlobalConfiguration.Configuration.Formatters.JsonFormatter.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
            GlobalConfiguration.Configuration.Formatters.Remove(GlobalConfiguration.Configuration.Formatters.XmlFormatter);

            //var appXmlType = config.Formatters.XmlFormatter.SupportedMediaTypes.FirstOrDefault(t => t.MediaType == "application/xml");
            //config.Formatters.XmlFormatter.SupportedMediaTypes.Remove(appXmlType);
        }
    }
}
