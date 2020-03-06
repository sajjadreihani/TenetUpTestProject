using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Products.Command.UpsertProduct
{
    public class UpsertProductCommand : IRequest
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
    }
}
