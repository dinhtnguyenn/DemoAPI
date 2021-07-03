using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo.Models
{
    public class ModelInvoice
    {
        public string NameCustomer { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public int Product { get; set; }
        public int Quantity { get; set; }
    }
}