﻿using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators
{
    public class UserAddValidator : AbstractValidator<UserAdminAddOrChangeDto>
    {
        public UserAddValidator(WatchShopContext context)
        {
            RuleFor(x => x.Username)
               .NotEmpty()
               .MinimumLength(4)
               .Must(username => !context.Users.Any(g => g.Username == username))
               .WithMessage("Username must be unique");

            RuleFor(x => x.FirstName)
                .NotEmpty()
                .MaximumLength(30);

            RuleFor(x => x.LastName)
                .NotEmpty()
                .MaximumLength(30);

            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress();

            RuleFor(x => x.GroupId)
                .NotEmpty()
                .Must(group => context.Groups
                .Any(x => x.Id == group))
                .WithMessage("Group doesn't exist");


            RuleFor(x => x.Password)
               .NotEmpty()
               .MinimumLength(6);

        }
    }
}
