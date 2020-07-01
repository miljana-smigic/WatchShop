using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators.Orders
{
    public class OrderCreateValidator : AbstractValidator<OrderCreateDto>
    {
        public OrderCreateValidator(WatchShopContext context)
        {
            RuleFor(x => x.OrderDate)
                .GreaterThan(DateTime.Today)
                .WithMessage("Order date must be in future.")
                .LessThan(DateTime.Now.AddDays(30))
                .WithMessage("Order date can't be more than 30 days from today.");

            RuleFor(x => x.Address)
                .NotEmpty()
                .WithMessage("Address is required.");

            RuleFor(x => x.Items)
                .NotEmpty()
                .WithMessage("There must be at least one order line.")
                .Must(items => items.Select(x => x.ProductId).Distinct().Count() == items.Count())
                .WithMessage("Duplicate products are not allowed.")
                .DependentRules(() =>
                {
                    RuleForEach(x => x.Items)
                    .SetValidator
                        (new OrderLineCreateValidator(context));
                });
        }
    }
}
