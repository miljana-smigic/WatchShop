using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Application.Queries.Brands;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.Brands
{
    public class EfGetOneBrandQuery : IGetOneBrandQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOneBrandQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 15;

        public string Name => "Get brand";

        public BrandDto Execute(int search)
        {
            var brand = _context.Brands.FirstOrDefault(x => x.Id == search);
            if (brand == null)
            {
                throw new EntityNotFoundException(search, typeof(Brand));
            }
            return _mapper.Map<BrandDto>(brand);
        }
    }
}
