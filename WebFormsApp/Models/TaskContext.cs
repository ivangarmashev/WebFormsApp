using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace WebFormsApp.Models
{
    public class TaskContext : DbContext
    {
        public TaskContext() : base("TaskDbConnectionString") { }

        public DbSet<TaskItem> Tasks { get; set; }
    }
}