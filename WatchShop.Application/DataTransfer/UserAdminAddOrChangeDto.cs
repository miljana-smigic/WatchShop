using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Application.DataTransfer
{
    public class UserAdminAddOrChangeDto
    {
        public string Email { get; set; }
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public int GroupId { get; set; }
    }
}
