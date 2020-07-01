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
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators;

namespace WatchShop.Implementation.EfCommands.User
{
    public class EfAdminChangeUser : IAdminChangeUser
    {
        private readonly ChangeUserGroupAdminValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;
        public EfAdminChangeUser(ChangeUserGroupAdminValidator validator, WatchShopContext context, IMapper mapper, IApplicationActor actor)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
            _actor = actor;
        }
        public int Id => 6;

        public string Name => "Change customer group by Admin";

        public void Execute(ChangeUserGroupDto request)
        {
            _validator.ValidateAndThrow(request);
            var user = _context.Users.Include(x => x.UserUserCases).Where(x => x.Id == request.Id).FirstOrDefault();
            if (user == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(WatchShop.Domain.User));
            }
            user.GroupId = request.GroupId;
            var useCases = new List<WatchShop.Domain.UserUserCase>();
            var useCasesList = _context.UseCases.ToList();
            var adminUseCases = useCasesList.Where( x => x.Id != 8).Select(x => x.Id);
            var userUseCases = useCasesList.Where(x => !x.AdminCase).Select(x => x.Id);
            if (user.GroupId == 1)
            {
                foreach (var useCase in adminUseCases)
                {
                    useCases.Add(new WatchShop.Domain.UserUserCase
                    {
                        UseCaseId = useCase,
                        UserId = user.Id
                    });
                }
            }
            else 
            {
                foreach (var useCase in userUseCases)
                {
                    useCases.Add(new WatchShop.Domain.UserUserCase
                    {
                        UseCaseId = useCase,
                        UserId = user.Id
                    });
                }
            }
             user.UserUserCases = useCases;
            _context.SaveChanges();
        }
    }
}
