using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Application.Queries.Genders;
using WatchShop.Domain;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.EfQueries.Genders
{
    public class EfGetOneGenderQuery : IGetOneGenderQuery
    {
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfGetOneGenderQuery(WatchShopContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 22;

        public string Name => "Get gender";

        public GenderDto Execute(int search)
        {
            var gender = _context.Genders.FirstOrDefault(x => x.Id == search);
            if (gender == null)
            {
                throw new EntityNotFoundException(search, typeof(Gender));
            }
            return _mapper.Map<GenderDto>(gender);
        }
    }
}
