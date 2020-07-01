using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.Commands.Products;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators.Products;

namespace WatchShop.Implementation.EfCommands.Products
{
    public class EfUpdateProductCommand : IUpdateProductCommand
    {
        private readonly ProductUpdateValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfUpdateProductCommand(ProductUpdateValidator validator, WatchShopContext context, IMapper mapper)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
        }
        public int Id => 36;

        public string Name => "Update product";

        public void Execute(ProductChangeDto request)
        {
            _validator.ValidateAndThrow(request);
            var product = _context.Products.Find(request.Id);

            if (product == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Product));
            }

            _mapper.Map(request, product);
            _context.SaveChanges();
        }
    }
}
