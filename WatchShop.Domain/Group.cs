using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Domain
{
    public class Group : Entity
    {
        public string Name { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
