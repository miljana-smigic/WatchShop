using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Application.Searches
{
    public class ProductSearch : PagedSearch
    {
        public string Name { get; set; }
        public double? MinPrice { get; set; }
        public double? MaxPrice { get; set; }
        public int? MechanismId { get; set; }
        public int? GenderId { get; set; }
        public int? BrandId { get; set; }
    }
}
