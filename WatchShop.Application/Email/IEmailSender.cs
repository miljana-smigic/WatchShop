using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Application.DataTransfer;

namespace WatchShop.Application.Email
{
    public interface IEmailSender
    {
        void Send(SendEmailDto dto);
    }
}
