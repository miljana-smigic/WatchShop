using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Application.Queries.Mechanisms;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.Mechanisms
{
    public class EfGetOneMechanismQuery : IGetOneMechanismQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOneMechanismQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 27;

        public string Name => "Get mechanism";

        public MechanismDto Execute(int search)
        {
            var mechanism = _context.Mechanisms.FirstOrDefault(x => x.Id == search);
            if (mechanism == null)
            {
                throw new EntityNotFoundException(search, typeof(Mechanism));
            }
            return _mapper.Map<MechanismDto>(mechanism);
        }
    }
}
