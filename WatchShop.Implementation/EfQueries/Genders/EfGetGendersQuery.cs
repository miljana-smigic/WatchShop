using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries;
using WatchShop.Application.Queries.Genders;
using WatchShop.Application.Searches;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.Genders
{
    public class EfGetGendersQuery : IGetGendersQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetGendersQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 21;

        public string Name => "Get genders";

        public PagedResponse<GenderDto> Execute(GenderSearch search)
        {
            var query = _context.Genders.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);
            var response = new PagedResponse<GenderDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = _mapper.Map<List<GenderDto>>(query.Skip(skipCount).Take(search.PerPage).ToList())
            };

            return response;
        }
    }
}
