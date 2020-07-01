using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WatchShop.Application;
using WatchShop.Application.Commands.Orders;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries.Orders;
using WatchShop.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WatchShop.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        public OrderController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        // GET: api/<OrderController>
        [HttpGet]
        public IActionResult Get([FromQuery] OrderSearch search, [FromServices] IGetOrdersQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<OrderController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneOrderQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<OrderController>
        [HttpPost]
        public IActionResult Post([FromBody] OrderCreateDto dto, [FromServices] IAddOrderCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        [HttpPatch("changestatus")]
        public IActionResult ChangeStatus([FromBody] OrderStatusChangeDto dto, [FromServices] IChangeOrderStatusCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

    }
}
