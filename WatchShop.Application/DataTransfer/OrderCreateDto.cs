using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Application.DataTransfer
{
    public class OrderCreateDto
    {
        public DateTime OrderDate { get; set; }
        public string Address { get; set; }
        public IEnumerable<OrderLineCreateDto> Items { get; set; } = new List<OrderLineCreateDto>();
    }
}
