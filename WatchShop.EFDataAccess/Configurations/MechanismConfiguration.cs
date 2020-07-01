using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Domain;

namespace WatchShop.EFDataAccess.Configurations
{
    public class MechanismConfiguration : IEntityTypeConfiguration<Mechanism>
    {
        public void Configure(EntityTypeBuilder<Mechanism> builder)
        {
            builder.Property(g => g.Name)
                .IsRequired();

            builder.Property(g => g.Name)
                .HasMaxLength(30);

            builder.HasIndex(g => g.Name)
                .IsUnique();
        }
    }
}
