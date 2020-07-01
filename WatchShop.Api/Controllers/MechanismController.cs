using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WatchShop.Application;
using WatchShop.Application.Commands.Mechanisms;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries.Mechanisms;
using WatchShop.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WatchShop.Api.Controllers
{
   
    [Route("api/[controller]")]
    [ApiController]
    public class MechanismController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        public MechanismController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        // GET: api/<MechanismController>
        [HttpGet]
        public IActionResult Get([FromQuery] MechanismSearch search, [FromServices] IGetMechanismsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<MechanismController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneMechanismQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<MechanismController>
        [HttpPost]
        [Authorize]
        public IActionResult Post([FromBody] MechanismDto dto, [FromServices] IAddMechanismCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<MechanismController>/5
        [HttpPut("{id}")]
        [Authorize]
        public IActionResult Put(int id, [FromBody] MechanismDto dto, [FromServices] IUpdateMechanismCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE api/<MechanismController>/5
        [HttpDelete("{id}")]
        [Authorize]
        public IActionResult Delete(int id, [FromServices] IDeleteMechanismCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
