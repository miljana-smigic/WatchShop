using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;

namespace WatchShop.Application.Queries.User
{
    public interface IGetOneUserQuery : IQuery<int,UserGetDto>
    {
    }
}
