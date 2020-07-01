using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Domain;

namespace WatchShop.EFDataAccess.Configurations
{
    public class UseCaseConfiguration : IEntityTypeConfiguration<UseCase>
    {
        public void Configure(EntityTypeBuilder<UseCase> builder)
        {
            builder.Property(x => x.Name)
                .IsRequired();

            builder.Property(x => x.Name)
                .HasMaxLength(100);

            builder.HasIndex(x => x.Name)
                .IsUnique();
            builder.HasMany( x => x.UserUserCases).WithOne( y => y.UseCase)
                .HasForeignKey(o => o.UseCaseId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
