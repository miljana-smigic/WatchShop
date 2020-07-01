using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;

namespace WatchShop.Application.Queries.Brands
{
    public interface IGetOneBrandQuery : IQuery<int, BrandDto>
    {
    }
}
