using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators.Brands
{
    public class BrandAddValidator : AbstractValidator<BrandDto>
    {
        public BrandAddValidator(WatchShopContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must(name => !context.Brands.Any(b => b.Name == name))
               .WithMessage("Name must be unique");
        }
    }
}
