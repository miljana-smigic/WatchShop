using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators
{
    public class UserRightsValidator : AbstractValidator<UserRightsDto>
    {
        public UserRightsValidator(WatchShopContext context)
        {
            RuleFor(x => x.UseCases)
                .Must(x => x.Distinct().Count() == x.Count()).WithMessage("Duplicate cases not allowed")
                .Must(x => x.Except(context.UseCases.Select(x => x.Id).ToList()).Count() == 0).WithMessage("Use cases don't exists");
        }
    }
}
