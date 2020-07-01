using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;

namespace WatchShop.Application.Commands.Orders
{
    public interface IAddOrderCommand : ICommand<OrderCreateDto>
    {
    }
}
