using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Products.Command.UpsertProduct
{
    public class UpsertProductCommandValidation : AbstractValidator<UpsertProductCommand>
    {
        public UpsertProductCommandValidation()
        {
            RuleFor(p => p.Name).NotEmpty().MaximumLength(150);
            RuleFor(p => p.Price).GreaterThan(0);
        }
    }
}
