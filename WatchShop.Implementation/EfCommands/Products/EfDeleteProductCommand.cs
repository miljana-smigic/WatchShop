using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.Commands.Products;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfCommands.Products
{
    public class EfDeleteProductCommand : IDeleteProductCommand
    {
        private readonly WatchShopContext _context;

        public EfDeleteProductCommand(WatchShopContext context)
        {
            _context = context;
        }
        public int Id => 34;

        public string Name => "Delete product";

        public void Execute(int request)
        {
            var product = _context.Products
                .Include(x => x.OrderLines)
                .ThenInclude(x => x.Order)
                .FirstOrDefault(x => x.Id == request);

            if (product == null)
            {
                throw new EntityNotFoundException(request, typeof(Product));
            }
            var orderLines = _context.OrderLines.Where(x => x.ProductId == request).ToList();
            foreach (var orderLine in orderLines)
            {
                orderLine.ProductId = null;
            }

            product.IsDeleted = true;
            product.IsActive = false;
            _context.SaveChanges();
        }
    }
}
