using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Api.Core;
using WatchShop.Application;
using WatchShop.Application.Commands;
using WatchShop.Application.Commands.Brands;
using WatchShop.Application.Commands.Genders;
using WatchShop.Application.Commands.Groups;
using WatchShop.Application.Commands.Mechanisms;
using WatchShop.Application.Commands.Orders;
using WatchShop.Application.Commands.Products;
using WatchShop.Application.Commands.User;
using WatchShop.Application.Email;
using WatchShop.Application.Queries.Brands;
using WatchShop.Application.Queries.Genders;
using WatchShop.Application.Queries.Groups;
using WatchShop.Application.Queries.Mechanisms;
using WatchShop.Application.Queries.Orders;
using WatchShop.Application.Queries.Products;
using WatchShop.Application.Queries.UseCaseLogs;
using WatchShop.Application.Queries.User;
using WatchShop.EFDataAccess;
using WatchShop.Implementation.EfCommands;
using WatchShop.Implementation.EfCommands.Brands;
using WatchShop.Implementation.EfCommands.Genders;
using WatchShop.Implementation.EfCommands.Groups;
using WatchShop.Implementation.EfCommands.Mechanisms;
using WatchShop.Implementation.EfCommands.Orders;
using WatchShop.Implementation.EfCommands.Products;
using WatchShop.Implementation.EfCommands.User;
using WatchShop.Implementation.EfQueries.Brands;
using WatchShop.Implementation.EfQueries.Genders;
using WatchShop.Implementation.EfQueries.Groups;
using WatchShop.Implementation.EfQueries.Mechanisms;
using WatchShop.Implementation.EfQueries.Orders;
using WatchShop.Implementation.EfQueries.Products;
using WatchShop.Implementation.EfQueries.UseCaseLogs;
using WatchShop.Implementation.EfQueries.User;
using WatchShop.Implementation.Email;
using WatchShop.Implementation.Logging;
using WatchShop.Implementation.Validators;
using WatchShop.Implementation.Validators.Brands;
using WatchShop.Implementation.Validators.Genders;
using WatchShop.Implementation.Validators.Mechanisms;
using WatchShop.Implementation.Validators.Orders;
using WatchShop.Implementation.Validators.Products;

namespace WatchShop.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Watch Shop", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                          {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                            },
                            new List<string>()
                          }
                    });
            });

            services.AddAutoMapper(this.GetType().Assembly);
            services.AddTransient<WatchShopContext>();
            services.AddTransient<UseCaseExecutor>();
            services.AddTransient<JwtManager>();
            services.AddHttpContextAccessor();
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();
                var user = accessor.HttpContext.User;
                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonimousActor();
                }
                var actorString = user.FindFirst("ActorData").Value;
                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);
                return actor;
            });
            services.AddTransient<IUseCaseLogger, DatabaseUseCaseLogger>();

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });

            //UserController
            services.AddTransient<ChangeUserGroupAdminValidator>();
            services.AddTransient<UserAddValidator>();
            services.AddTransient<UserChangeValidator>();
            services.AddTransient<UserRightsValidator>();
            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            services.AddTransient<IGetOneUserQuery, EfGetOneUserQuery>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();
            services.AddTransient<IAddUserCommand, EfAddUserCommand>();
            services.AddTransient<IChangeUserRightsCommand, EfChangeUserRightsCommand>();
            services.AddTransient<IAdminChangeUser, EfAdminChangeUser>();

            //RegisterController
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<IEmailSender,SmtpEmailSender>();
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddControllers();

            //GroupController
            services.AddTransient<IGetOneGroupQuery, EfGetOneGroupQuery>();
            services.AddTransient<IDeleteGroupCommand, EfDeleteGroupCommand>();
            services.AddTransient<IGetGroupsQuery, EfGetGroupsQuery>();
            services.AddTransient<IAddGroupCommand, EfAddGroupCommand>();
            services.AddTransient<IUpdateGroupCommand, EfUpdateGroupCommand>();
            services.AddTransient<GroupAddValidator>();
            services.AddTransient<GroupUpdateValidator>();
            
            //BrandController
            services.AddTransient<IGetOneBrandQuery, EfGetOneBrandQuery>();
            services.AddTransient<IDeleteBrandCommand, EfDeleteBrandCommand>();
            services.AddTransient<IGetBrandsQuery, EfGetBrandsQuery>();
            services.AddTransient<IAddBrandCommand, EfAddBrandCommand>();
            services.AddTransient<IUpdateBrandCommand, EfUpdateBrandCommand>();
            services.AddTransient<BrandAddValidator>();
            services.AddTransient<BrandUpdateValidator>();

            //GenderController
            services.AddTransient<IGetOneGenderQuery, EfGetOneGenderQuery>();
            services.AddTransient<IDeleteGenderCommand, EfDeleteGenderCommand>();
            services.AddTransient<IGetGendersQuery, EfGetGendersQuery>();
            services.AddTransient<IAddGenderCommand, EfAddGenderCommand>();
            services.AddTransient<IUpdateGenderCommand, EfUpdateGenderCommand>();
            services.AddTransient<GenderAddValidator>();
            services.AddTransient<GenderUpdateValidator>();

            //MechanismController
            services.AddTransient<IGetOneMechanismQuery, EfGetOneMechanismQuery>();
            services.AddTransient<IDeleteMechanismCommand, EfDeleteMechanismCommand>();
            services.AddTransient<IGetMechanismsQuery, EfGetMechanismsQuery>();
            services.AddTransient<IAddMechanismCommand, EfAddMechanismCommand>();
            services.AddTransient<IUpdateMechanismCommand, EfUpdateMechanismCommand>();
            services.AddTransient<MechanismAddValidator>();
            services.AddTransient<MechanismUpdateValidator>();

            //ProductController
            services.AddTransient<IGetOneProductQuery, EfGetOneProductQuery>();
            services.AddTransient<IDeleteProductCommand, EfDeleteProductCommand>();
            services.AddTransient<IGetProductsQuery, EfGetProductsQuery>();
            services.AddTransient<IAddProductCommand, EfAddProductCommand>();
            services.AddTransient<IUpdateProductCommand, EfUpdateProductCommand>();
            services.AddTransient<ProductAddValidator>();
            services.AddTransient<ProductUpdateValidator>();

            //OrderController
            services.AddTransient<IGetOneOrderQuery, EfGetOneOrderQuery>();
            services.AddTransient<IGetOrdersQuery, EfGetOrdersQuery>();
            services.AddTransient<IAddOrderCommand, EfAddOrderCommand>();
            services.AddTransient<IChangeOrderStatusCommand, EfChangeOrderStatusCommand>();
            services.AddTransient<OrderChangeStatusValidator>();
            services.AddTransient<OrderCreateValidator>();
            services.AddTransient<OrderCreateValidator>();

            //UseCaseLogController
            services.AddTransient<IGetUseCaseLogsQuery, EfGetUseCaseLogsQuery>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseMiddleware<GlobalExceptionHandler>();

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
            });
        }
    }
}
