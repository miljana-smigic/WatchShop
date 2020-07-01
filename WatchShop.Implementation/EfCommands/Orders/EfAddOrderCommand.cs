using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application;
using WatchShop.Application.Commands.Orders;
using WatchShop.Application.DataTransfer;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators.Orders;

namespace WatchShop.Implementation.EfCommands.Orders
{
    public class EfAddOrderCommand : IAddOrderCommand
    {
        private readonly OrderCreateValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IApplicationActor _actor;

        public EfAddOrderCommand(OrderCreateValidator validator, WatchShopContext context, IApplicationActor actor)
        {
            _validator = validator;
            _context = context;
            _actor = actor;
        }
        public int Id => 39;

        public string Name => "Add order";

        public void Execute(OrderCreateDto request)
        {
            _validator.ValidateAndThrow(request);
            var order = new Order
            {
                UserId = _actor.Id,
                Address = request.Address,
                OrderDate = request.OrderDate
            };

            foreach (var item in request.Items)
            {
                var product = _context.Products.Find(item.ProductId);

                product.Quantity -= item.Quantity;

                order.OrderLines.Add(new OrderLine
                {
                    ProductId = item.ProductId,
                    Quantity = item.Quantity,
                    Name = product.Name,
                    Price = (decimal)product.Price
                });
            }
            _context.Orders.Add(order);
            _context.SaveChanges();
        }
    }
}
