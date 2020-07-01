using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.Commands.Groups;
using WatchShop.Application.DataTransfer;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators;

namespace WatchShop.Implementation.EfCommands.Groups
{
    public class EfAddGroupCommand : IAddGroupCommand
    {
        private readonly GroupAddValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;


        public EfAddGroupCommand(GroupAddValidator validator, WatchShopContext context, IMapper mapper)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
        }
        public int Id => 12;

        public string Name => "Add group";

        public void Execute(GroupDto request)
        {
            request.Id = 0;
            _validator.ValidateAndThrow(request);
            _context.Groups.Add(_mapper.Map<Group>(request));
            _context.SaveChanges();
        }
    }
}
