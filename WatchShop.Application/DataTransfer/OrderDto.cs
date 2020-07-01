using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WatchShop.Application.DataTransfer
{
    public class OrderDto
    {
        public int Id { get; set; }
        public string Address { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Status { get; set; }
        public string UserInfo { get; set; }
        public IEnumerable<OrderLineDto> OrderLines { get; set; } = new List<OrderLineDto>();
        public decimal TotalPrice => OrderLines.Sum(x => x.Price * x.Quantity);
    }
}
