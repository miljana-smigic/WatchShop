using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries.Groups;
using WatchShop.Application.Searches;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.Groups
{
    public class EfGetGroupsQuery : IGetGroupsQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetGroupsQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 10;

        public string Name => "Get groups";

        public IEnumerable<GroupDto>Execute(GroupSearch search)
        {
            var query = _context.Groups.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            return (_mapper.Map<List<GroupDto>>(query.ToList()));
        }
    }
}
