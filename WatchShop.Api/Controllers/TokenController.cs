using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WatchShop.Api.Core;
using WatchShop.Application.DataTransfer;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WatchShop.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TokenController : ControllerBase
    {
        private readonly JwtManager manager;

        public TokenController(JwtManager manager)
        {
            this.manager = manager;
        }
        // POST api/<LoginController>
        [HttpPost]
        public IActionResult Post([FromBody] LoginRequest dto)
        {
            var token = manager.MakeToken(dto.Username, dto.Password);

            if (token == null)
            {
                return Unauthorized();
            }

            return Ok(new { token });
        }

    }
}
