using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.Commands.Mechanisms;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfCommands.Mechanisms
{
    public class EfDeleteMechanismCommand : IDeleteMechanismCommand
    {
        private readonly WatchShopContext _context;

        public EfDeleteMechanismCommand(WatchShopContext context)
        {
            _context = context;
        }
        public int Id => 28;

        public string Name => "Delete mechanism";

        public void Execute(int request)
        {
            var mechanism = _context.Mechanisms.Include(x => x.Products).FirstOrDefault(x => x.Id == request);
            if (mechanism == null)
            {
                throw new EntityNotFoundException(request, typeof(Mechanism));
            }
            if (mechanism.Products.Any(x => x.IsActive))
            {
                throw new EntityConflictException("Mechanism has active products");
            }

            mechanism.IsDeleted = true;
            mechanism.IsActive = false;
            _context.SaveChanges();
        }
    }
}
