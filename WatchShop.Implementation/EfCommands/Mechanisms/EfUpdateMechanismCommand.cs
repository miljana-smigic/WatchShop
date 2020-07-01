using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.Commands.Mechanisms;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators.Mechanisms;

namespace WatchShop.Implementation.EfCommands.Mechanisms
{
    public class EfUpdateMechanismCommand : IUpdateMechanismCommand
    {
        private readonly MechanismUpdateValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;


        public EfUpdateMechanismCommand(MechanismUpdateValidator validator, WatchShopContext context, IMapper mapper)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
        }
        public int Id => 30;

        public string Name => "Update mechanism";

        public void Execute(MechanismDto request)
        {
            _validator.ValidateAndThrow(request);
            var mechanism = _context.Mechanisms.Find(request.Id);

            if (mechanism == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Mechanism));
            }

            _mapper.Map(request, mechanism);
            _context.SaveChanges();
        }
    }
}
