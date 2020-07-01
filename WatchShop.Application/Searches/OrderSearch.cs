using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Domain;

namespace WatchShop.Application.Searches
{
    public class OrderSearch : PagedSearch
    {
        public int? UserId { get; set; }
        public int? MinOrderLines { get; set; }
        public OrderStatus? Status { get; set; }
        public decimal? MinPrice { get; set; }
    }
}
