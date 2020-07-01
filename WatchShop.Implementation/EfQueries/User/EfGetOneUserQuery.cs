using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Application.Queries.User;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.User
{
    public class EfGetOneUserQuery : IGetOneUserQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOneUserQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 2;

        public string Name => "Get user";

        public UserGetDto Execute(int search)
        {
            var user = _context.Users.Include(x => x.Group).FirstOrDefault(x => x.Id == search);
            if (user == null)
            {
                throw new EntityNotFoundException(search,typeof(WatchShop.Domain.User));
            }
            return _mapper.Map<UserGetDto>(user);
        }
    }
}
