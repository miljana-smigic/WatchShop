using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries;
using WatchShop.Application.Queries.User;
using WatchShop.Application.Searches;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.User
{
    public class EfGetUsersQuery : IGetUsersQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetUsersQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 1;

        public string Name => "Get users";

        public PagedResponse<UserGetDto> Execute(UserSearch search)
        {
            var query = _context.Users.Include( x => x.Group).AsQueryable();

            if (!string.IsNullOrEmpty(search.Username) || !string.IsNullOrWhiteSpace(search.Username))
            {
                query = query.Where(x => x.Username.ToLower().Contains(search.Username.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.LastName) || !string.IsNullOrWhiteSpace(search.LastName))
            {
                query = query.Where(x => x.LastName.ToLower().Contains(search.LastName.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            //Page == 1 
            var response = new PagedResponse<UserGetDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = _mapper.Map<List<UserGetDto>>(query.Skip(skipCount).Take(search.PerPage).ToList())
            };

            return response;
        }
    }
}
