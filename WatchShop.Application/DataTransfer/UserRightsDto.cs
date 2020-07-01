using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Application.DataTransfer
{
    public class UserRightsDto
    {
        public int Id { get; set; }
        public IEnumerable<int> UseCases { get; set; }
    }
}
