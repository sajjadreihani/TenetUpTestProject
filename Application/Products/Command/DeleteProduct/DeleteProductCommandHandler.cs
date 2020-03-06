using Application.Common.Exceptions;
using Application.Common.Interfaces;
using MediatR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Products.Command.DeleteProduct
{
    public class DeleteProductCommandHandler : IRequestHandler<DeleteProductCommand>
    {
        private readonly ITestDbContext context;

        public DeleteProductCommandHandler(ITestDbContext context)
        {
            this.context = context;
        }

        public async Task<Unit> Handle(DeleteProductCommand request, CancellationToken cancellationToken)
        {
            var product = await context.Products.FirstOrDefaultAsync(p => p.Id == request.Id);

            if (product == null)
                throw new NotFoundException("Product", request.Id);

            context.Products.Remove(product);

            await context.SaveChangesAsync(cancellationToken);

            return Unit.Value;
        }
    }
}
