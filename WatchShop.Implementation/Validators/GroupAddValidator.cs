using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators
{
    public class GroupAddValidator : AbstractValidator<GroupDto>
    {
        public GroupAddValidator(WatchShopContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must(name => !context.Groups.Any(g => g.Name == name))
               .WithMessage("Name must be unique");
        }
    }
}
