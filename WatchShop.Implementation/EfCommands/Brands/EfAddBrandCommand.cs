using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.Commands.Brands;
using WatchShop.Application.DataTransfer;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators.Brands;

namespace WatchShop.Implementation.EfCommands.Brands
{
    public class EfAddBrandCommand : IAddBrandCommand
    {
        private readonly BrandAddValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfAddBrandCommand(BrandAddValidator validator, WatchShopContext context, IMapper mapper)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
        }
        public int Id => 17;

        public string Name => "Add brand";

        public void Execute(BrandDto request)
        {
            request.Id = 0;
            _validator.ValidateAndThrow(request);
            _context.Brands.Add(_mapper.Map<Brand>(request));
            _context.SaveChanges();
        }
    }
}
