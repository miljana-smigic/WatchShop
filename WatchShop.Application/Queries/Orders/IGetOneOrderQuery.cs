using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;

namespace WatchShop.Application.Queries.Orders
{
    public interface IGetOneOrderQuery : IQuery<int, OrderDto>
    {
    }
}
