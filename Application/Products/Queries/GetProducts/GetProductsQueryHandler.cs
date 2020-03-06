using Application.Common.Interfaces;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Products.Queries.GetProducts
{
    public class GetProductsQueryHandler : IRequestHandler<GetProductsQuery, List<ProductDto>>
    {
        private readonly ITestDbContext context;
        private readonly IMapper mapper;

        public GetProductsQueryHandler(ITestDbContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public async Task<List<ProductDto>> Handle(GetProductsQuery request, CancellationToken cancellationToken)
        {
            return await context.Products.Where(p=> string.IsNullOrEmpty(request.Name)?true:p.Name.Contains(request.Name)).ProjectTo<ProductDto>(mapper.ConfigurationProvider).ToListAsync();
        }
    }
}
