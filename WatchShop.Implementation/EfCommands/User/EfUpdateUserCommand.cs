using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application;
using WatchShop.Application.Commands.User;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators;

namespace WatchShop.Implementation.EfCommands.User
{
    public class EfUpdateUserCommand : IUpdateUserCommand
    {
        private readonly UserChangeValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;


        public EfUpdateUserCommand(UserChangeValidator validator, WatchShopContext context, IMapper mapper, IApplicationActor actor)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
            _actor = actor;
        }

        public int Id => 5;

        public string Name => "User information update";

        public void Execute(UserChangeDto request)
        {
            _validator.ValidateAndThrow(request);
            var user = _context.Users.Find(request.Id);
            if(user == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(WatchShop.Domain.User));
            }
            if(_actor.Id != user.Id)
            {
                throw new UnauthorizedAccessException();
            }
            _mapper.Map(request, user);
            _context.SaveChanges();
        }
    }
}
