using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries;
using WatchShop.Application.Queries.Products;
using WatchShop.Application.Searches;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.Products
{
    public class EfGetProductsQuery : IGetProductsQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetProductsQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 32;

        public string Name => "Get products";

        public PagedResponse<ProductDto> Execute(ProductSearch search)
        {
            var query = _context.Products
                .Include(x => x.Mechanism)
                .Include(x => x.Gender)
                .Include(x => x.Brand)
                .AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            if(search.BrandId != null)
            {
                query = query.Where(x => x.BrandId == search.BrandId);
            }

            if (search.GenderId != null)
            {
                query = query.Where(x => x.GenderId == search.GenderId);
            }

            if (search.MechanismId != null)
            {
                query = query.Where(x => x.MechanismId == search.MechanismId);
            }

            if (search.MinPrice != null)
            {
                query = query.Where(x => x.Price >= search.MinPrice);
            }

            if (search.MaxPrice != null)
            {
                query = query.Where(x => x.Price <= search.MaxPrice);
            }

            var skipCount = search.PerPage * (search.Page - 1);
            var response = new PagedResponse<ProductDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = _mapper.Map<List<ProductDto>>(query.Skip(skipCount).Take(search.PerPage).ToList())
            };

            return response;
        }
    }
}
