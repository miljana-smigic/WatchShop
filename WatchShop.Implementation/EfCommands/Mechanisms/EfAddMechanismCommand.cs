using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.Commands.Mechanisms;
using WatchShop.Application.DataTransfer;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators.Mechanisms;

namespace WatchShop.Implementation.EfCommands.Mechanisms
{
    public class EfAddMechanismCommand : IAddMechanismCommand
    {
        private readonly MechanismAddValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfAddMechanismCommand(MechanismAddValidator validator, WatchShopContext context, IMapper mapper)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
        }
        public int Id => 29;

        public string Name => "Add mechanism";

        public void Execute(MechanismDto request)
        {
            request.Id = 0;
            _validator.ValidateAndThrow(request);
            _context.Mechanisms.Add(_mapper.Map<Mechanism>(request));
            _context.SaveChanges();
        }
    }
}
