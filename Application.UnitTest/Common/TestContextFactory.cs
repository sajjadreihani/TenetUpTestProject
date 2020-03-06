using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Persistence;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.UnitTest.Common
{
    public class TestContextFactory
    {
        public static TestDbContext Create()
        {
            var options = new DbContextOptionsBuilder<TestDbContext>()
      .UseInMemoryDatabase(Guid.NewGuid().ToString())
      .Options;

            var context = new TestDbContext(options);

            context.Database.EnsureCreated();

            context.Products.AddRange(new[] {
                new Product{Id=1,Name="Test 1",Price=12.30,Created=DateTime.Now.AddDays(-2)},
                new Product{Id=2,Name="Test 2",Price=15,Created = DateTime.Now.AddDays(-1)}
            });
            context.SaveChanges();

            return context;
        }

        public static void Destroy(TestDbContext context)
        {
            context.Database.EnsureDeleted();

            context.Dispose();
        }
    }
}
