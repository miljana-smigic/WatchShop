using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Application.Queries.Orders;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.Orders
{
    public class EfGetOneOrderQuery : IGetOneOrderQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOneOrderQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 38;

        public string Name => "Get order";

        public OrderDto Execute(int search)
        {
            var order = _context.Orders
                            .Include(x => x.User)
                            .Include(x => x.OrderLines)
                            .FirstOrDefault(o => o.Id == search);

            if (order == null)
            {
                throw new EntityNotFoundException(search, typeof(Order));
            }

            return _mapper.Map<OrderDto>(order);
        }
    }
}
