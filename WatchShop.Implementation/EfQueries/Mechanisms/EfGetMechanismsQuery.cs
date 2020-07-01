using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries;
using WatchShop.Application.Queries.Mechanisms;
using WatchShop.Application.Searches;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.Mechanisms
{
    public class EfGetMechanismsQuery : IGetMechanismsQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetMechanismsQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 26;

        public string Name => "Get mechanisms";

        public PagedResponse<MechanismDto> Execute(MechanismSearch search)
        {
            var query = _context.Mechanisms.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);
            var response = new PagedResponse<MechanismDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = _mapper.Map<List<MechanismDto>>(query.Skip(skipCount).Take(search.PerPage).ToList())
            };

            return response;
        }
    }
}
