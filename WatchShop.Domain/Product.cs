using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Domain
{
    public class Product : Entity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public int MechanismId { get; set; }
        public int GenderId { get; set; }
        public int BrandId { get; set; }
        public virtual Mechanism Mechanism { get; set; }
        public virtual Gender Gender { get; set; }
        public virtual Brand Brand { get; set; }

        public virtual ICollection<OrderLine> OrderLines { get; set; } = new HashSet<OrderLine>();
    }
}
