using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Application.Queries.Products;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.Products
{
    public class EfGetOneProductQuery : IGetOneProductQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOneProductQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 33;

        public string Name => "Get product";

        public ProductDto Execute(int search)
        {
            var product = _context.Products
                .Include(x => x.Mechanism)
                .Include(x => x.Brand)
                .Include(x => x.Gender)
                .FirstOrDefault(x => x.Id == search);

            if (product == null)
            {
                throw new EntityNotFoundException(search, typeof(Product));
            }
            return _mapper.Map<ProductDto>(product);
        }
    }
}
