using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators
{
    public class ChangeUserGroupAdminValidator : AbstractValidator<ChangeUserGroupDto>
    {
        public ChangeUserGroupAdminValidator(WatchShopContext context)
        {

            RuleFor(x => x.GroupId)
                .NotEmpty()
                .Must(group => context.Groups.Any(x => x.Id == group))
                .WithMessage("Group doesn't exist");

        }
    }
}
