using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Domain
{
    public class UseCase
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool AdminCase { get; set; }
        public virtual ICollection<UserUserCase> UserUserCases { get; set; } = new HashSet<UserUserCase>();
    }
}
