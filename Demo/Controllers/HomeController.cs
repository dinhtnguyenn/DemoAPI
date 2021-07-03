using Demo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Demo.Controllers
{
    public class HomeController : Controller
    {
        ShopContext context = new ShopContext();
        public ActionResult Index()
        {
            ViewBag.Invoice = context.Invoices.ToList();
            ViewBag.Account = context.Accounts.ToList();
            return View(context.Products.ToList());
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}