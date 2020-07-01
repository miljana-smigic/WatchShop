using Microsoft.EntityFrameworkCore;
using System.Linq;
using WatchShop.Application.Commands.User;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfCommands.User
{
    public class EfDeleteUserCommand : IDeleteUserCommand
    {
        private readonly WatchShopContext _context;

        public EfDeleteUserCommand(WatchShopContext context)
        {
            _context = context;
        }

        public int Id => 3;

        public string Name => "Delete user";

        public void Execute(int request)
        {
            var user = _context.Users.Include(x => x.Orders).FirstOrDefault(x => x.Id == request);
            if (user == null)
            {
                throw new EntityNotFoundException(request, typeof(WatchShop.Domain.User));
            }
            if (user.Orders.Any(x => x.OrderStatus == OrderStatus.Recieved || x.OrderStatus == OrderStatus.Shipped))
            {
                throw new EntityConflictException("User has active orders - can't be deleted");
            }

            user.IsDeleted = true;
            user.IsActive = false;
            _context.SaveChanges();

        }
    }
}
