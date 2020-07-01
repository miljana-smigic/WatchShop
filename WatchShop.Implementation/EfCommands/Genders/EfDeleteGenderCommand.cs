using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.Commands.Genders;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfCommands.Genders
{
    public class EfDeleteGenderCommand : IDeleteGenderCommand
    {
        private readonly WatchShopContext _context;

        public EfDeleteGenderCommand(WatchShopContext context)
        {
            _context = context;
        }
        public int Id => 23;

        public string Name => "Delete gender";

        public void Execute(int request)
        {
            var gender = _context.Genders.Include(x => x.Products).FirstOrDefault(x => x.Id == request);
            if (gender == null)
            {
                throw new EntityNotFoundException(request, typeof(Gender));
            }
            if (gender.Products.Any(x => x.IsActive))
            {
                throw new EntityConflictException("Gender has active products");
            }

            gender.IsDeleted = true;
            gender.IsActive = false;
            _context.SaveChanges();
        }
    }
}
