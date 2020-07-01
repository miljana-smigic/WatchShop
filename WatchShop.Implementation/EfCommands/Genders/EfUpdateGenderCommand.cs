using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.Commands.Genders;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Exceptions;
using WatchShop.Domain;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.Validators.Genders;

namespace WatchShop.Implementation.EfCommands.Genders
{
    public class EfUpdateGenderCommand : IUpdateGenderCommand
    {
        private readonly GenderUpdateValidator _validator;
        private readonly WatchShopContext _context;
        private readonly IMapper _mapper;

        public EfUpdateGenderCommand(GenderUpdateValidator validator, WatchShopContext context, IMapper mapper)
        {
            _validator = validator;
            _context = context;
            _mapper = mapper;
        }
        public int Id => 25;

        public string Name => "Update gender";

        public void Execute(GenderDto request)
        {
            _validator.ValidateAndThrow(request);
            var gender = _context.Genders.Find(request.Id);

            if (gender == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Gender));
            }

            _mapper.Map(request, gender);
            _context.SaveChanges();
        }
    }
}
