﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Tranning.DBContext;

#nullable disable

namespace Tranning.Migrations
{
    [DbContext(typeof(TrainerTestDBContext))]
    partial class TrainerTestDBContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.12")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("Tranning.DBContext.TrainerTestCategories", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("DeletedAt")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("Varchar(100)")
                        .HasColumnName("Description");

                    b.Property<string>("Icon")
                        .IsRequired()
                        .HasColumnType("Varchar(50)")
                        .HasColumnName("Icon");

                    b.Property<string>("NameCategory")
                        .IsRequired()
                        .HasColumnType("Varchar(50)")
                        .HasColumnName("Name");

                    b.Property<int>("Status")
                        .HasColumnType("Integer")
                        .HasColumnName("Status");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.ToTable("TrainerTestCategories");
                });

            modelBuilder.Entity("Tranning.DBContext.TrainerTestCourses", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Avatar")
                        .IsRequired()
                        .HasColumnType("Varchar(100)")
                        .HasColumnName("Avatar");

                    b.Property<int>("CategoryId")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("DeletedAt")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .HasColumnType("Varchar(100)")
                        .HasColumnName("Description");

                    b.Property<DateTime?>("Enddate")
                        .HasColumnType("DateTime")
                        .HasColumnName("Enddate");

                    b.Property<string>("NameCourse")
                        .HasColumnType("Varchar(50)")
                        .HasColumnName("NameCourse");

                    b.Property<DateTime?>("StartDate")
                        .HasColumnType("DateTime")
                        .HasColumnName("Startdate");

                    b.Property<int>("Status")
                        .HasColumnType("Integer")
                        .HasColumnName("Status");

                    b.Property<int?>("TrainerTestCategoriesId")
                        .HasColumnType("int");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime2");

                    b.Property<int>("Vote")
                        .HasColumnType("Integer")
                        .HasColumnName("Vote");

                    b.HasKey("Id");

                    b.HasIndex("TrainerTestCategoriesId");

                    b.ToTable("Courses");
                });

            modelBuilder.Entity("Tranning.DBContext.TrainerTestCourses", b =>
                {
                    b.HasOne("Tranning.DBContext.TrainerTestCategories", "TrainerTestCategories")
                        .WithMany()
                        .HasForeignKey("TrainerTestCategoriesId");

                    b.Navigation("TrainerTestCategories");
                });
#pragma warning restore 612, 618
        }
    }
}
