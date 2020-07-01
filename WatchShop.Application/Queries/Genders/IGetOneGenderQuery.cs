using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;

namespace WatchShop.Application.Queries.Genders
{
    public interface IGetOneGenderQuery : IQuery<int, GenderDto>
    {
    }
}
