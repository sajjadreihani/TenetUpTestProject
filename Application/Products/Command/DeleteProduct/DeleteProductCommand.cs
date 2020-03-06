using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Products.Command.DeleteProduct
{
    public class DeleteProductCommand : IRequest
    {
        public int Id { get; set; }
    }
}
