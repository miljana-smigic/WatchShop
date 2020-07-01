using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators.Genders
{
    public class GenderAddValidator : AbstractValidator<GenderDto>
    {
        public GenderAddValidator(WatchShopContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must(name => !context.Genders.Any(g => g.Name == name))
               .WithMessage("Name must be unique");
        }
    }
}
