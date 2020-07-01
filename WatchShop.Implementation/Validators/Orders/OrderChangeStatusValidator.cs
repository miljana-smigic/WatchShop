using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Validators.Orders
{
    public class OrderChangeStatusValidator : AbstractValidator<OrderStatusChangeDto>
    {
        public OrderChangeStatusValidator(WatchShopContext context)
        {
            RuleFor(x => (int)x.Status)
               .InclusiveBetween(0, 3)
               .WithMessage("Choose right status");

        }
    }
}
