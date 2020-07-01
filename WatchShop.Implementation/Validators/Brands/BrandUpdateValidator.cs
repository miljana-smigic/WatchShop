using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators.Brands
{
    public class BrandUpdateValidator : AbstractValidator<BrandDto>
    {
        public BrandUpdateValidator(WatchShopContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must((dto, name) => !context.Brands.Any(b => b.Name == name && b.Id != dto.Id))
               .WithMessage("Name must be unique");
        }
    }
}
