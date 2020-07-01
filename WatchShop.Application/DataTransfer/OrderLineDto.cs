using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Application.DataTransfer
{
    public class OrderLineDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
    }
}
