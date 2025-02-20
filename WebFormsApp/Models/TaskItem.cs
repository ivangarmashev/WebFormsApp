using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebFormsApp.Models
{
    public enum TaskStatus
    {
        [Display(Name = "В процессе")]
        InProgress,

        [Display(Name = "Завершена")]
        Completed  
    }

    public class TaskItem
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Title { get; set; }

        public string Description { get; set; }

        public DateTime CreatedDate { get; set; }

        public TaskStatus Status { get; set; }
    }
}