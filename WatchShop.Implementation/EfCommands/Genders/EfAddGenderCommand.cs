using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.Commands.Genders;
using WatchShop.Application.DataTransfer;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators.Genders;

namespace WatchShop.Implementation.EfCommands.Genders
{
    public class EfAddGenderCommand : IAddGenderCommand
    {
        private readonly GenderAddValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfAddGenderCommand(GenderAddValidator validator, WatchShopContext context, IMapper mapper)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
        }
        public int Id => 24;

        public string Name => "Add gender";

        public void Execute(GenderDto request)
        {
            request.Id = 0;
            _validator.ValidateAndThrow(request);
            _context.Genders.Add(_mapper.Map<Gender>(request));
            _context.SaveChanges();
        }
    }
}
