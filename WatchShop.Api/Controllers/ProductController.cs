using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WatchShop.Application;
using WatchShop.Application.Commands.Products;
using WatchShop.Application.DataTransfer;
using WatchShop.Application.Queries.Products;
using WatchShop.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WatchShop.Api.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        public ProductController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        // GET: api/<ProductController>
        [HttpGet]
        public IActionResult Get([FromQuery] ProductSearch search, [FromServices] IGetProductsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<ProductController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneProductQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<ProductController>
        [HttpPost]
        [Authorize]
        public IActionResult Post([FromBody] ProductChangeDto dto, [FromServices] IAddProductCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<ProductController>/5
        [HttpPut("{id}")]
        [Authorize]
        public IActionResult Put(int id, [FromBody] ProductChangeDto dto, [FromServices] IUpdateProductCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE api/<ProductController>/5
        [HttpDelete("{id}")]
        [Authorize]
        public IActionResult Delete(int id, [FromServices] IDeleteProductCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
