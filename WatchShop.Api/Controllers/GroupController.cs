using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WatchShop.Application;
using WatchShop.Application.Commands.Groups;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries.Groups;
using WatchShop.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WatchShop.Api.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class GroupController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public GroupController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<GroupController>
        [HttpGet]
        public IActionResult Get([FromQuery] GroupSearch search, [FromServices] IGetGroupsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<GroupController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneGroupQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<GroupController>
        [HttpPost]
        [Authorize]
        public IActionResult Post([FromBody] GroupDto dto, [FromServices] IAddGroupCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<GroupController>/5
        [HttpPut("{id}")]
        [Authorize]
        public IActionResult Put(int id, [FromBody] GroupDto dto, [FromServices] IUpdateGroupCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE api/<GroupController>/5
        [HttpDelete("{id}")]
        [Authorize]
        public IActionResult Delete(int id, [FromServices] IDeleteGroupCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
