using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.Commands.Brands;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfCommands.Brands
{
    public class EfDeleteBrandCommand : IDeleteBrandCommand
    {
        private readonly WatchShopContext _context;

        public EfDeleteBrandCommand(WatchShopContext context)
        {
            _context = context;
        }
        public int Id => 16;

        public string Name => "Delete brand";

        public void Execute(int request)
        {
            var brand = _context.Brands.Include(x => x.Products).FirstOrDefault(x => x.Id == request);
            if (brand == null)
            {
                throw new EntityNotFoundException(request, typeof(Brand));
            }
            if (brand.Products.Any(x => x.IsActive))
            {
                throw new EntityConflictException("Brand has active products");
            }

            brand.IsDeleted = true;
            brand.IsActive = false;
            _context.SaveChanges();
        }
    }
}
