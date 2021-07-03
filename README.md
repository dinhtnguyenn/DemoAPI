# DemoAPI

## 1. Global.asax
Thêm dòng:  ** GlobalConfiguration.Configure(WebApiConfig.Register); **


## 2. WebApiConfig

```
* * forrmat json
           var json = config.Formatters.JsonFormatter;
           json.SerializerSettings.PreserveReferencesHandling = Newtonsoft.Json.PreserveReferencesHandling.Objects;
           json.SerializerSettings.ReferenceLoopHandling
                      = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
           config.Formatters.Remove(config.Formatters.XmlFormatter);
* * end forrmat json
```

```
* * config url cho api
config.Routes.MapHttpRoute(
      name: "saveInvoice",
     routeTemplate: "api/save-invoice",
      defaults: new { controller = "APIDemo", action = "saveInvoice" }
>);
* * end config url cho api
```
