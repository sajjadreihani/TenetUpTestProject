using Application.Products.Queries.GetProducts;
using Application.UnitTest.Common;
using AutoMapper;
using Persistence;
using Shouldly;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace Application.UnitTest.Products.Queries.GetProducts
{
    [Collection("QueryCollection")]
    public class GetProductsQueryTest
    {
        private readonly TestDbContext _context;
        private readonly IMapper _mapper;

        public GetProductsQueryTest(QueryTestFixture fixture)
        {
            _context = fixture.Context;
            _mapper = fixture.Mapper;
        }

        [Fact]
        public async Task GetProducts()
        {
            var sut = new GetProductsQueryHandler(_context, _mapper);

            var result = await sut.Handle(new GetProductsQuery { }, CancellationToken.None);

            result.ShouldBeOfType<List<ProductDto>>();
            result.ShouldNotBeNull();
        }
    }
}
