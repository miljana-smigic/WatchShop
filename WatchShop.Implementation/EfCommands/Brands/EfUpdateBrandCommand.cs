using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.Commands.Brands;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators.Brands;

namespace WatchShop.Implementation.EfCommands.Brands
{
    public class EfUpdateBrandCommand : IUpdateBrandCommand
    {
        private readonly BrandUpdateValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;


        public EfUpdateBrandCommand(BrandUpdateValidator validator, WatchShopContext context, IMapper mapper)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
        }
        public int Id => 20;

        public string Name => "Update brand";

        public void Execute(BrandDto request)
        {
            _validator.ValidateAndThrow(request);
            var brand = _context.Brands.Find(request.Id);

            if (brand == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Brand));
            }

            _mapper.Map(request, brand);
            _context.SaveChanges();
        }
    }
}
