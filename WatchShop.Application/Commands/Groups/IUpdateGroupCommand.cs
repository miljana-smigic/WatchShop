using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;

namespace WatchShop.Application.Commands.Groups
{
    public interface IUpdateGroupCommand : ICommand<GroupDto>
    {
    }
}
