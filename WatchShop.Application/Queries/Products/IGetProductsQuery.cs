using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Searches;

namespace WatchShop.Application.Queries.Products
{
    public interface IGetProductsQuery : IQuery<ProductSearch, PagedResponse<ProductDto>>
    {
    }
}
