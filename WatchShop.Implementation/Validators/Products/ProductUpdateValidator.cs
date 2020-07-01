using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators.Products
{
    public class ProductUpdateValidator : AbstractValidator<ProductChangeDto>
    {
        public ProductUpdateValidator(WatchShopContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must((dto, name) => !context.Products.Any(p => p.Name == name && dto.Id != p.Id))
               .WithMessage("Name must be unique");

            RuleFor(x => x.Description)
                .MaximumLength(200);

            RuleFor(x => x.Price)
                .NotEmpty()
                .GreaterThan(0);

            RuleFor(x => x.Quantity)
                .NotEmpty()
                .GreaterThan(0);

            RuleFor(x => x.MechanismId)
                .NotEmpty()
                .Must(mechanismId => context.Mechanisms.Any(m => m.Id == mechanismId));

            RuleFor(x => x.GenderId)
                .NotEmpty()
                .Must(genderId => context.Genders.Any(m => m.Id == genderId));

            RuleFor(x => x.BrandId)
                .NotEmpty()
                .Must(brandId => context.Brands.Any(m => m.Id == brandId));
        }
    }
}
