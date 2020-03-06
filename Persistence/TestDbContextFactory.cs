using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Persistence
{
    public class TestDbContextFactory : DesignTimeDbContextFactoryBase<TestDbContext>
    {
        protected override TestDbContext CreateNewInstance(DbContextOptions<TestDbContext> options)
        {
            return new TestDbContext(options);
        }
    }
}
