using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.Commands.Groups;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfCommands.Groups
{
    public class EfDeleteGroupCommand : IDeleteGroupCommand
    {
        private readonly WatchShopContext _context;

        public EfDeleteGroupCommand(WatchShopContext context)
        {
            _context = context;
        }
        public int Id => 11;

        public string Name => "Delete group";

        public void Execute(int request)
        {
            var group = _context.Groups.Include(x => x.Users).FirstOrDefault(x => x.Id == request);
            if (group == null)
            {
                throw new EntityNotFoundException(request, typeof(Group));
            }
            if (group.Users.Any(x => x.IsActive))
            {
                throw new EntityConflictException("Group has active users");
            }

            group.IsDeleted = true;
            group.IsActive = false;
            _context.SaveChanges();
        }
    }
}
