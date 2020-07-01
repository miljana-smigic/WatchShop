using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.Commands.User;
using WatchShop.Application.DataTransfer;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators;

namespace WatchShop.Implementation.EfCommands.User
{
    public class EfAddUserCommand : IAddUserCommand
    {
        private readonly UserAddValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;


        public EfAddUserCommand(UserAddValidator validator, WatchShopContext context, IMapper mapper)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
        }

        public int Id => 4;

        public string Name => "Add user";

        public void Execute(UserAdminAddOrChangeDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Users.Add(_mapper.Map<WatchShop.Domain.User>(request));

            _context.SaveChanges();

            var user = _context.Users.FirstOrDefault(x => x.Username == request.Username);

            var useCases = new List<WatchShop.Domain.UserUserCase>();

            var useCasesList = _context.UseCases.ToList();

            var adminUseCases = useCasesList.Select(x => x.Id);

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
            if (user.GroupId == 2)
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
            if (useCases.Count > 0)
            {
                user.UserUserCases = useCases;
                _context.SaveChanges();
            }
        }
    }
}
