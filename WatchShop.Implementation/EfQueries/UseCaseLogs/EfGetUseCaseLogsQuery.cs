using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries;
using WatchShop.Application.Queries.UseCaseLogs;
using WatchShop.Application.Searches;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.UseCaseLogs
{
    public class EfGetUseCaseLogsQuery : IGetUseCaseLogsQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetUseCaseLogsQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 31;

        public string Name => "Get use case logs";

        public PagedResponse<UseCaseLogDto> Execute(UseCaseLogSearch search)
        {
            var query = _context.UseCaseLogs.AsQueryable();
            if (!string.IsNullOrEmpty(search.UseCaseName) || !string.IsNullOrWhiteSpace(search.UseCaseName))
            {
                query = query.Where(x => x.UseCaseName.ToLower().Contains(search.UseCaseName.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.Actor) || !string.IsNullOrWhiteSpace(search.Actor))
            {
                query = query.Where(x => x.Actor.ToLower().Contains(search.Actor.ToLower()));
            }
            if (search.FromDate != null)
            {
                query = query.Where(x => x.Date >= search.FromDate);
            }
            if (search.ToDate != null)
            {
                query = query.Where(x => x.Date <= search.ToDate);
            }
            var skipCount = search.PerPage * (search.Page - 1);
            var response = new PagedResponse<UseCaseLogDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = _mapper.Map<List<UseCaseLogDto>>(query.Skip(skipCount).Take(search.PerPage).ToList())
            };

            return response;
        }
    }
}
