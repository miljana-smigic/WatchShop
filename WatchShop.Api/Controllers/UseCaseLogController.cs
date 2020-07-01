using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WatchShop.Application;
using WatchShop.Application.Queries.UseCaseLogs;
using WatchShop.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WatchShop.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UseCaseLogController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        public UseCaseLogController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        // GET: api/<UseCaseLogController>
        [HttpGet]
        public IActionResult Get([FromQuery] UseCaseLogSearch search, [FromServices] IGetUseCaseLogsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }
    }
}
