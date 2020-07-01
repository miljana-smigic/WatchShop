using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Domain
{
    public class Mechanism : Entity
    {
        public string Name { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
