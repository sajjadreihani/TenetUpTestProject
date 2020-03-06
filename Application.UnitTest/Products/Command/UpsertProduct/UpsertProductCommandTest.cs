using Application.Products.Command.UpsertProduct;
using Application.UnitTest.Common;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace Application.UnitTest.Products.Command.UpsertProduct
{
    public class UpsertProductCommandTest : CommandTestBase
    {
        [Fact]
        public async Task Handle_GivenNewProduct_SholudBeWithOutExceptionAsync()
        {
            var command = new UpsertProductCommandHandler(_context);

            var newProduct = new UpsertProductCommand() { Id = 8, Name = "as" };

            var result = await command.Handle(newProduct, CancellationToken.None);

            Assert.IsType<Unit>(result);
        }

        [Fact]
        public async Task Handle_GivenExistProduct_SholudBeWithOutExceptionAsync()
        {
            var command = new UpsertProductCommandHandler(_context);

            var existProduct = new UpsertProductCommand() { Id = 1, Name = "DSds" };

            var result = await command.Handle(existProduct, CancellationToken.None);

            Assert.IsType<Unit>(result);
        }

    }
}
