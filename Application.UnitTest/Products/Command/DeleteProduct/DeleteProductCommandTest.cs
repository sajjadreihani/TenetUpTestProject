using Application.Common.Exceptions;
using Application.Products.Command.DeleteProduct;
using Application.UnitTest.Common;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace Application.UnitTest.Products.Command.DeleteProduct
{
    public class DeleteProductCommandTest : CommandTestBase
    {
        [Fact]
        public async Task Handle_GivenExistProductId_SholudBeWithOutExceptionAsync()
        {
            var command = new DeleteProductCommandHandler(_context);

            var existProduct = new DeleteProductCommand() { Id = 1 };

            var result = await command.Handle(existProduct, CancellationToken.None);

            Assert.IsType<Unit>(result);
        }

        [Fact]
        public async Task Handle_GivenNotExistProductId_ThrowNotFoundExceptionAsync()
        {
            var command = new DeleteProductCommandHandler(_context);

            var notExistProduct = new DeleteProductCommand() { Id = 12 };

            await Assert.ThrowsAsync<NotFoundException>(async () => await command.Handle(notExistProduct, CancellationToken.None));
        }

    }
}
