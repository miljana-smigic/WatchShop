using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Application.DataTransfer
{
    public class OrderLineCreateDto
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
