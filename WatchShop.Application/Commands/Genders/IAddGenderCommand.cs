using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;

namespace WatchShop.Application.Commands.Genders
{
    public interface IAddGenderCommand : ICommand<GenderDto>
    {
    }
}
