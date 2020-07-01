using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Searches;

namespace WatchShop.Application.Queries.UseCaseLogs
{
    public interface IGetUseCaseLogsQuery : IQuery<UseCaseLogSearch, PagedResponse<UseCaseLogDto>>
    {
    }
}
