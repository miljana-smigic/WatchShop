using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WatchShop.Application;
using WatchShop.EFDataAccess;

namespace WatchShop.Api.Core
{
    public class AnonimousActor : IApplicationActor
    {
        public int Id => 0;
        public string Identity => "Anonymous";
        public IEnumerable<int> AllowedUseCases => new List<int> { 1, 2, 5, 8, 9, 10, 14, 15, 21, 22, 26, 27, 32, 33, 38, 39 };
    }
}
