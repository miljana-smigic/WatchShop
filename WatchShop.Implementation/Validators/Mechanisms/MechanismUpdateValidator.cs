using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators.Mechanisms
{
    public class MechanismUpdateValidator : AbstractValidator<MechanismDto>
    {
        public MechanismUpdateValidator(WatchShopContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must((dto, name) => !context.Mechanisms.Any(m => m.Name == name && m.Id != dto.Id))
               .WithMessage("Name must be unique");
        }
    }
}
