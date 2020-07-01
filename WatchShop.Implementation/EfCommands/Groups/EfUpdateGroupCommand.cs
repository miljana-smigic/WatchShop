using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.Commands.Groups;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators;

namespace WatchShop.Implementation.EfCommands.Groups
{
    public class EfUpdateGroupCommand : IUpdateGroupCommand
    {
        private readonly GroupUpdateValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;


        public EfUpdateGroupCommand(GroupUpdateValidator validator, WatchShopContext context, IMapper mapper)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
        }
        public int Id => 13;

        public string Name => "Update group";

        public void Execute(GroupDto request)
        {
            _validator.ValidateAndThrow(request);
            var group = _context.Groups.Find(request.Id);

            if (group == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Group));
            }

            _mapper.Map(request, group);
            _context.SaveChanges();
        }
    }
}
