using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;

namespace WatchShop.Application.Commands.Mechanisms
{
    public interface IAddMechanismCommand : ICommand<MechanismDto>
    {
    }
}
