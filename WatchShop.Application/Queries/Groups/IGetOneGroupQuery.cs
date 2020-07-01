using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;

namespace WatchShop.Application.Queries.Groups
{
    public interface IGetOneGroupQuery : IQuery<int, GroupDto>
    {
    }
}
