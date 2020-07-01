using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Domain;

namespace WatchShop.EFDataAccess.Configurations
{
    public class BrandConfiguration : IEntityTypeConfiguration<Brand>
    {
        public void Configure(EntityTypeBuilder<Brand> builder)
        {
            builder.Property(b => b.Name)
                .IsRequired();

            builder.Property(b => b.Name)
                .HasMaxLength(30);

            builder.HasIndex(b => b.Name)
                .IsUnique();
        }
    }
}
