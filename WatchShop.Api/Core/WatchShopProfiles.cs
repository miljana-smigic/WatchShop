using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WatchShop.Application.DataTransfer;
using WatchShop.Domain;

namespace WatchShop.Api.Core
{
    public class WatchShopProfiles : Profile
    {
        public WatchShopProfiles()
        {
            CreateMap<User, UserGetDto>()
                .ForMember(dest => dest.GroupName,
               opts => opts.MapFrom(src => src.Group != null ? src.Group.Name : ""));

            CreateMap<UserChangeDto, User>().ReverseMap();

            CreateMap<UserAdminAddOrChangeDto, User>().ReverseMap();

            CreateMap<RegisterUserDto, User>().ReverseMap();

            CreateMap<Group, GroupDto>().ReverseMap();

            CreateMap<Brand, BrandDto>().ReverseMap();

            CreateMap<Gender, GenderDto>().ReverseMap();

            CreateMap<Mechanism, MechanismDto>().ReverseMap();

            CreateMap<UseCaseLog, UseCaseLogDto>().ReverseMap();

            CreateMap<Product, ProductDto>()
                .ForMember(dest => dest.BrandName,
               opts => opts.MapFrom(src => src.Brand != null ? src.Brand.Name : ""))
                .ForMember(dest => dest.GenderName,
               opts => opts.MapFrom(src => src.Gender != null ? src.Gender.Name : ""))
                .ForMember(dest => dest.MechanismName,
               opts => opts.MapFrom(src => src.Mechanism != null ? src.Mechanism.Name : ""));

            CreateMap<ProductChangeDto, Product>();

            CreateMap<Order, OrderDto>()
                .ForMember(dto => dto.UserInfo, opt => opt.MapFrom(order => order.User.FirstName + " " + order.User.LastName + " " + order.User.Username))
                .ForMember(dto => dto.Status, opt => opt.MapFrom(order => order.OrderStatus.ToString()))
                .ForMember(dto => dto.OrderLines, opt => opt.MapFrom(order => order.OrderLines.Select(ol => new OrderLineDto
                {
                   Id = ol.Id,
                   Name = ol.Name,
                   Price = ol.Price,
                   Quantity = ol.Quantity
                })));
        }
    }
}
