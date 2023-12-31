﻿using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
namespace Tranning.DBContext
{
    public class TrainerTestTopics
    {
        [Key]
        public long  Id { get; set; }
        [ForeignKey("CourseId")]
        public int CourseId { get; set; }
        public TrainerTestCourses? TrainerTestCourses { get; set; }//kieu khoa ngoai

        [Column("NameCourse", TypeName = "Varchar(50)")]

        public string? NameTopic { get; set; }
        [Column("Description", TypeName = "Varchar(200)")]

        public string? Description { get; set; }
        [Column("videos", TypeName = "Varchar(250)")]
        public String? videos { get; set; }
        [Column("documents", TypeName = "Varchar(250)")]
        public String? documents { get; set; }


        [Column("attach_file", TypeName = "Varchar(250)")]
        public String? attach_file { get; set; }

        [Column("Status", TypeName = "Varchar(50)")]
        public string Status { get; set; }

        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public DateTime DeletedAt { get; set; }


    }
}

