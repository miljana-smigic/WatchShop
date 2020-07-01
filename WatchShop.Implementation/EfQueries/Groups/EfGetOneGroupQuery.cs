using AutoMapper;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Application.Queries.Groups;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.Groups
{
    public class EfGetOneGroupQuery : IGetOneGroupQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOneGroupQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 9;

        public string Name => "Get group";

        public GroupDto Execute(int search)
        {
            var group = _context.Groups.Find(search);
            if (group == null)
            {
                throw new EntityNotFoundException(search, typeof(Group));
            }
            return _mapper.Map<GroupDto>(group);
        }
    }
}
