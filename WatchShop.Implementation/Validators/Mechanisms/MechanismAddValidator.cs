using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators.Mechanisms
{
    public class MechanismAddValidator : AbstractValidator<MechanismDto>
    {
        public MechanismAddValidator(WatchShopContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must(name => !context.Mechanisms.Any(m => m.Name == name))
               .WithMessage("Name must be unique");
        }
    }
}
