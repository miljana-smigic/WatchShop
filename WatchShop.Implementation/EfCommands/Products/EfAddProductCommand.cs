using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.Commands.Products;
using WatchShop.Application.DataTransfer;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators.Products;

namespace WatchShop.Implementation.EfCommands.Products
{
    public class EfAddProductCommand : IAddProductCommand
    {
        private readonly ProductAddValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfAddProductCommand(ProductAddValidator validator, WatchShopContext context, IMapper mapper)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
        }
        public int Id => 35;

        public string Name => "Add product";

        public void Execute(ProductChangeDto request)
        {
            request.Id = 0;
            _validator.ValidateAndThrow(request);
            _context.Products.Add(_mapper.Map<Product>(request));
            _context.SaveChanges();
        }
    }
}
