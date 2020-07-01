using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries;
using WatchShop.Application.Queries.Orders;
using WatchShop.Application.Searches;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.Orders
{
    public class EfGetOrdersQuery : IGetOrdersQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOrdersQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 37;

        public string Name => "Get orders";

        public PagedResponse<OrderDto> Execute(OrderSearch search)
        {
            var query = _context.Orders
                            .Include(x => x.User)
                            .Include(x => x.OrderLines)
                            .AsQueryable();

            if (search.UserId.HasValue)
            {
                query = query.Where(order => order.UserId == search.UserId);
            }

            if (search.MinOrderLines.HasValue)
            {
                query = query.Where(order => order.OrderLines.Count() >= search.MinOrderLines.Value);
            }

            if (search.Status.HasValue)
            {
                query = query.Where(o => o.OrderStatus == search.Status);
            }

            if (search.MinPrice.HasValue)
            {
                query = query.Where(o => o.OrderLines.Sum(x => x.Quantity * x.Price) >= search.MinPrice.Value);
            }
            var skipCount = search.PerPage * (search.Page - 1);
            var response = new PagedResponse<OrderDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = _mapper.Map<List<OrderDto>>(query.Skip(skipCount).Take(search.PerPage).ToList())
            };

            return response;
        }
    }
}
