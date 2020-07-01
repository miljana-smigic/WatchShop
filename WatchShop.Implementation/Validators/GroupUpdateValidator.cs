using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators
{
    public class GroupUpdateValidator : AbstractValidator<GroupDto>
    {
        public GroupUpdateValidator(WatchShopContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must((dto,name) => !context.Groups.Any(g => g.Name == name && g.Id != dto.Id))
               .WithMessage("Name must be unique");
        }
    }
}
