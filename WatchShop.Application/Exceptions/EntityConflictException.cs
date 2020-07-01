using System;
using System.Collections.Generic;
using System.Text;

namespace WatchShop.Application.Exceptions
{
    public class EntityConflictException : Exception
    {
        public EntityConflictException(string message)
            : base(message)
        {

        }
    }
}
