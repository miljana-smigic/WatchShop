using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.Commands.Orders;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators.Orders;

namespace WatchShop.Implementation.EfCommands.Orders
{
    public class EfChangeOrderStatusCommand : IChangeOrderStatusCommand
    {
        private readonly WatchShopContext _context;
        private readonly OrderChangeStatusValidator _validator;

        public EfChangeOrderStatusCommand(WatchShopContext context, OrderChangeStatusValidator validator)
        {
            _context = context;
            _validator = validator;
        }
        public int Id => 40;

        public string Name => "Change order status";

        public void Execute(OrderStatusChangeDto request)
        {
            _validator.ValidateAndThrow(request);
            var order = _context.Orders
                .Include(o => o.OrderLines)
                .ThenInclude(ol => ol.Product)
                .FirstOrDefault(x => x.Id == request.OrderId);

            if (order == null)
            {
                throw new EntityNotFoundException(request.OrderId, typeof(Order));
            }
            if (order.OrderStatus == OrderStatus.Delivered)
            {
                throw new EntityConflictException("Can't change status of delivered orders");
            }

            if (order.OrderStatus == OrderStatus.Recieved)
            {
                if (request.Status == OrderStatus.Delivered)
                {
                    throw new EntityConflictException("Must be in state shipped before choosing delivered");
                }
                if (request.Status == OrderStatus.Canceled)
                {
                    foreach (var line in order.OrderLines)
                    {
                        line.Product.Quantity += line.Quantity;
                    }
                }
            }
            if (order.OrderStatus == OrderStatus.Shipped)
            {
                if (request.Status == OrderStatus.Canceled)
                {
                    throw new EntityConflictException("Order is in shipping progress - can't be canceled");
                }
            }
            if (order.OrderStatus == OrderStatus.Canceled)
            {

                if (request.Status == OrderStatus.Shipped || request.Status == OrderStatus.Delivered)
                {
                    throw new EntityConflictException("Canceled order can be changed in received only");
                }
                if (request.Status == OrderStatus.Recieved)
                {
                    foreach (var line in order.OrderLines)
                    {
                        if (line.Product != null)
                        {
                            throw new EntityConflictException("One of the products doesn't exist - you can't retrive order");
                        }
                        line.Product.Quantity -= line.Quantity;
                        if (line.Product.Quantity < 0)
                        {
                            throw new EntityConflictException("One of the products isn't available at the moment - you can't retrive order");
                        }
                    }
                }
            }
            order.OrderStatus = request.Status;
            _context.SaveChanges();
        }
    }
}
