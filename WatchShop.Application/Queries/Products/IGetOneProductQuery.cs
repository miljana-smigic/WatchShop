using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;

namespace WatchShop.Application.Queries.Products
{
    public interface IGetOneProductQuery : IQuery<int, ProductDto>
    {
    }
}
