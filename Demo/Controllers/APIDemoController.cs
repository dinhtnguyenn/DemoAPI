using Demo.Models;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web.Http;

namespace Demo.Controllers
{
    public class APIDemoController : ApiController
    {
        ShopContext context = new ShopContext();
        public JObject parseJsonObject(string data)
        {
            JObject result = JObject.Parse(data);
            return result;
        }


        [HttpPost]
        public IHttpActionResult saveInvoice(ModelInvoice data)
        {
            try
            {
                Account checkAccount = context.Accounts.SingleOrDefault(p => p.Phone == data.Phone);

                if (checkAccount == null)
                {
                    //chưa có account thì thêm vào
                    Account accountAdd = new Account();
                    accountAdd.Name = data.NameCustomer;
                    accountAdd.Phone = data.Phone;
                    context.Accounts.AddOrUpdate(accountAdd);
                    context.SaveChanges();

                    //thêm invoice
                    Account findAcc = context.Accounts.SingleOrDefault(p => p.Phone == data.Phone);
                    Invoice invoiceAdd = new Invoice();
                    invoiceAdd.CreateDate = DateTime.Now;
                    invoiceAdd.UserID = findAcc.UserID;
                    invoiceAdd.Address = data.Address;
                    context.Invoices.AddOrUpdate(invoiceAdd);
                    context.SaveChanges();

                    //thêm detail
                    int idInvoice = context.Invoices.OrderByDescending(p => p.InvoiceNo).First().InvoiceNo;
                    InvoiceDetail invoiceDetailAdd = new InvoiceDetail();
                    invoiceDetailAdd.InvoiceNo = idInvoice;
                    invoiceDetailAdd.ProductID = data.Product;
                    invoiceDetailAdd.Quantity = data.Quantity;
                    context.InvoiceDetails.AddOrUpdate(invoiceDetailAdd);
                    context.SaveChanges();
                }
                else
                {
                    //thêm invoice
                    Account findAcc = context.Accounts.SingleOrDefault(p => p.Phone == data.Phone);
                    Invoice invoiceAdd = new Invoice();
                    invoiceAdd.CreateDate = DateTime.Now;
                    invoiceAdd.UserID = findAcc.UserID;
                    invoiceAdd.Address = data.Address;
                    context.Invoices.AddOrUpdate(invoiceAdd);
                    context.SaveChanges();

                    //thêm detail
                    int idInvoice = context.Invoices.OrderByDescending(p=>p.InvoiceNo).First().InvoiceNo;
                    InvoiceDetail invoiceDetailAdd = new InvoiceDetail();
                    invoiceDetailAdd.InvoiceNo = idInvoice;
                    invoiceDetailAdd.ProductID = data.Product;
                    invoiceDetailAdd.Quantity = data.Quantity;
                    context.InvoiceDetails.AddOrUpdate(invoiceDetailAdd);
                    context.SaveChanges();
                }

                return Ok(parseJsonObject("{\"messages\": [{\"text\": \"Yay!! Đã đặt hàng thành công\"}]}"));
            }
            catch (Exception)
            {
                return Ok(parseJsonObject("{\"messages\": [{\"text\": \"Oops!! Đã đặt hàng không thành công\"}]}"));
            }
        }

        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }
    }
}
