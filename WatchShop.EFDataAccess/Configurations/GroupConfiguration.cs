using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using WatchShop.Domain;

namespace WatchShop.EFDataAccess.Configurations
{
    public class GroupConfiguration : IEntityTypeConfiguration<Group>
    {
        public void Configure(EntityTypeBuilder<Group> builder)
        {
            builder.Property(x => x.Name)
                .HasMaxLength(30);

            builder.HasIndex(x => x.Name)
                .IsUnique();

            builder.Property(x => x.Name)
                .IsRequired();

            builder.HasMany(g => g.Users)
                   .WithOne(u => u.Group)
                   .HasForeignKey(u => u.GroupId)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
