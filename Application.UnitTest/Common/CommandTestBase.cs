using Persistence;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.UnitTest.Common
{
    public class CommandTestBase : IDisposable
    {
        protected readonly TestDbContext _context;

        public CommandTestBase()
        {
            _context = TestContextFactory.Create();
        }

        public void Dispose()
        {
            TestContextFactory.Destroy(_context);
        }
    }
}
