using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WatchShop.Application;
using WatchShop.Application.Commands.Brands;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries.Brands;
using WatchShop.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WatchShop.Api.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class BrandController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        public BrandController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        // GET: api/<BrandController>
        [HttpGet]
        public IActionResult Get([FromQuery] BrandSearch search, [FromServices] IGetBrandsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<BrandController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneBrandQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<BrandController>
        [HttpPost]
        [Authorize]
        public IActionResult Post([FromBody] BrandDto dto, [FromServices] IAddBrandCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<BrandController>/5
        [HttpPut("{id}")]
        [Authorize]
        public IActionResult Put(int id, [FromBody] BrandDto dto, [FromServices] IUpdateBrandCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE api/<BrandController>/5
        [HttpDelete("{id}")]
        [Authorize]
        public IActionResult Delete(int id, [FromServices] IDeleteBrandCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
