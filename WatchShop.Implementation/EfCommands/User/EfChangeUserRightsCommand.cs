using AutoMapper;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application;
using WatchShop.Application.Commands.User;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators;

namespace WatchShop.Implementation.EfCommands.User
{
    public class EfChangeUserRightsCommand : IChangeUserRightsCommand
    {
        private readonly UserRightsValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;


        public EfChangeUserRightsCommand(UserRightsValidator validator, WatchShopContext context, IMapper mapper, IApplicationActor actor)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
            _actor = actor;
        }
        public int Id =>  7;

        public string Name => "Change user right";

        public void Execute(UserRightsDto request)
        {
            _validator.ValidateAndThrow(request);
            var user = _context.Users.Include(x=>x.UserUserCases).Where(x => x.Id == request.Id).FirstOrDefault();
            if (user == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(WatchShop.Domain.User));
            }
            var listOfRights = new List<UserUserCase>();
            foreach(var useCase in request.UseCases)
            {
                listOfRights.Add(new UserUserCase
                {
                    UserId = request.Id,
                    UseCaseId = useCase
                });
            }
            user.UserUserCases = listOfRights;
            _context.SaveChanges();
        }
    }
}
