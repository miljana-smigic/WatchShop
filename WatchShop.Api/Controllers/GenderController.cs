using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WatchShop.Application;
using WatchShop.Application.Commands.Genders;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries.Genders;
using WatchShop.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WatchShop.Api.Controllers
{   
    [Route("api/[controller]")]
    [ApiController]
    public class GenderController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        public GenderController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        // GET: api/<GenderController>
        [HttpGet]
        public IActionResult Get([FromQuery] GenderSearch search, [FromServices] IGetGendersQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<GenderController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneGenderQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<GenderController>
        [HttpPost]
        [Authorize]
        public IActionResult Post([FromBody] GenderDto dto, [FromServices] IAddGenderCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<GenderController>/5
        [HttpPut("{id}")]
        [Authorize]
        public IActionResult Put(int id, [FromBody] GenderDto dto, [FromServices] IUpdateGenderCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE api/<GenderController>/5
        [HttpDelete("{id}")]
        [Authorize]
        public IActionResult Delete(int id, [FromServices] IDeleteGenderCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
