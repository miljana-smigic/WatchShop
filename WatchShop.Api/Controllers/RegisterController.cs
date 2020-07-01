using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WatchShop.Application;
using WatchShop.Application.Commands;
using WatchShop.Application.DataTransfer;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WatchShop.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegisterController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public RegisterController(UseCaseExecutor executor) => _executor = executor;


        // POST: api/Register
        [HttpPost]
        public IActionResult Post([FromBody] RegisterUserDto dto,[FromServices] IRegisterUserCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }
    }
}
