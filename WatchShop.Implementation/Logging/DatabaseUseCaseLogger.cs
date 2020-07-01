﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application;
using WatchShop.EFDataAccess;

namespace WatchShop.Implementation.Logging
{
    public class DatabaseUseCaseLogger : IUseCaseLogger
    {
        private readonly WatchShopContext _context;

        public DatabaseUseCaseLogger(WatchShopContext context)
        {
            _context = context;
        }

        public void Log(IUseCase useCase, IApplicationActor actor, object useCaseData)
        {
            _context.UseCaseLogs.Add(new Domain.UseCaseLog
            {
                Actor = actor.Identity,
                Data = JsonConvert.SerializeObject(useCaseData),
                Date = DateTime.UtcNow,
                UseCaseName = useCase.Name
            });
            _context.SaveChanges();
        }
    }
}
