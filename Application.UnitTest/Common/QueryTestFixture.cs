using Application.Common.Mappings;
using AutoMapper;
using Persistence;
using System;
using System.Collections.Generic;
using System.Text;
using Xunit;

namespace Application.UnitTest.Common
{
    public class QueryTestFixture
    {
        public TestDbContext Context { get; private set; }
        public IMapper Mapper { get; private set; }

        public QueryTestFixture()
        {
            Context = TestContextFactory.Create();

            var configurationProvider = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<MappingProfile>();
            });

            Mapper = configurationProvider.CreateMapper();
        }

        public void Dispose()
        {
            TestContextFactory.Destroy(Context);
        }
    }

    [CollectionDefinition("QueryCollection")]
    public class QueryCollection : ICollectionFixture<QueryTestFixture> { }
}
