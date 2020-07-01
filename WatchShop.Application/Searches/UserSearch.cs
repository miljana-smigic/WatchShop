using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Application.Searches
{
    public class UserSearch : PagedSearch
    {
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}
