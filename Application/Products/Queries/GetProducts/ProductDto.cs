using Application.Common.Mappings;
using AutoMapper;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Products.Queries.GetProducts
{
    public class ProductDto : IMapFrom<Product>
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Price { get; set; }
        public string Created { get; set; }

        public void Mapping(Profile profile)
        {
            profile.CreateMap<Product, ProductDto>()
                .ForMember(pd => pd.Price, opt => opt.MapFrom(p => p.Price.ToString("N2")))
                .ForMember(pd => pd.Created, opt => opt.MapFrom(p => p.Created.ToShortDateString()));
              
        }
    }
}
