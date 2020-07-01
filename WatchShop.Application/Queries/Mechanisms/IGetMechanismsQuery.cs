using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Searches;

namespace WatchShop.Application.Queries.Mechanisms
{
    public interface IGetMechanismsQuery : IQuery<MechanismSearch, PagedResponse<MechanismDto>>
    {
    }
}
