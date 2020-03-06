using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Products.Command.DeleteProduct;
using Application.Products.Command.UpsertProduct;
using Application.Products.Queries.GetProducts;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebUI.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly IMediator mediator;

        public ProductsController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpPost]
        public async Task<IActionResult> UpsertProduct(UpsertProductCommand command)
        {
            await mediator.Send(command);
            return NoContent();
        }

        [HttpPost]
        public async Task<IActionResult> DeleteProduct(DeleteProductCommand command)
        {
            await mediator.Send(command);
            return NoContent();
        }

        [HttpGet]
        public async Task<IActionResult> GetProducts([FromQuery]GetProductsQuery query) => Ok(await mediator.Send(query));
    }
}