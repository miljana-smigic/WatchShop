using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Domain;

namespace WatchShop.Application.DataTransfer
{
    public class OrderStatusChangeDto
    {
        public int OrderId { get; set; }
        public OrderStatus Status { get; set; }
    }
}
