using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WatchShop.Application.Commands;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Email;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators;

namespace WatchShop.Implementation.EfCommands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        public int Id => 8;

        public string Name => "User registration";

        private readonly WatchShopContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;
        private readonly IMapper _mapper;

        public EfRegisterUserCommand(WatchShopContext context, RegisterUserValidator validator, IEmailSender sender, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
            _mapper = mapper;
        }

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);
            var useCases = _context.UseCases.Where(x => !x.AdminCase && x.Id != 8).Select(x => x.Id).ToList();

            var user = _mapper.Map<WatchShop.Domain.User>(request);

            user.GroupId = 2;

            _context.Add(user);

            var listOfUseCases = new List<UserUserCase>();

            foreach (var item in useCases)
            {
                listOfUseCases.Add(new UserUserCase
                {
                    Id = user.Id,
                    UseCaseId = item
                });
            }

            user.UserUserCases = listOfUseCases;

            _context.SaveChanges();

            _sender.Send(new SendEmailDto
            {
                Content = "<h1>Successfull registration!</h1>",
                SendTo = request.Email,
                Subject = "Registration"
            });
        }
    }
}
