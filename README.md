# DemoAPI

## 1. Global.asax
Thêm dòng:  **GlobalConfiguration.Configure(WebApiConfig.Register);**


## 2. WebApiConfig

```
**forrmat json

           var json = config.Formatters.JsonFormatter;
           json.SerializerSettings.PreserveReferencesHandling = Newtonsoft.Json.PreserveReferencesHandling.Objects;
           json.SerializerSettings.ReferenceLoopHandling
                      = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
           config.Formatters.Remove(config.Formatters.XmlFormatter);
           
**end forrmat json
```

```
**config url cho api

config.Routes.MapHttpRoute(
     name: "saveInvoice",
     routeTemplate: "api/save-invoice",
     defaults: new { controller = "APIDemo", action = "saveInvoice" }
);

**end config url cho api
```

## 3. Test API
```
http://localhost:44313/api/APIDemo/Get
http://localhost:44313/api/save-invoice
```
## 4. Tạo chatbot Chatfuel
- Home: https://chatfuel.com/
- API docs: https://docs.chatfuel.com/en/articles/735122-json-api

## 5. Sử dụng Ngrok để public localhost

- Bước 1: Tải ngrok tại: https://ngrok.com/
- Bước 2: Đăng ký và lấy token: https://dashboard.ngrok.com/auth
- Bước 3: Mở ngrok tải ở bước 1 và set token: ```ngrok authtoken YOUR_AUTHTOKEN```
- Bước 4: Tạo tunnel để public localhost: ```ngrok http -host-header=localhost https://localhost:44313```
