using Application.Common.Interfaces;
using MediatR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Products.Command.UpsertProduct
{
    public class UpsertProductCommandHandler : IRequestHandler<UpsertProductCommand>
    {
        private readonly ITestDbContext context;

        public UpsertProductCommandHandler(ITestDbContext context)
        {
            this.context = context;
        }

        public async Task<Unit> Handle(UpsertProductCommand request, CancellationToken cancellationToken)
        {
            var product = await context.Products.FirstOrDefaultAsync(p => p.Id == request.Id);

            if(product == null)
            {
                product = new Domain.Entities.Product()
                {
                    Created = DateTime.Now
                };

                context.Products.Add(product);
            }

            product.Name = request.Name;
            product.Price = request.Price;

            await context.SaveChangesAsync(cancellationToken);

            return Unit.Value;
        }
    }
}
