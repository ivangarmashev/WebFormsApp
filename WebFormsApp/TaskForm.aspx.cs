using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFormsApp.Models;

namespace WebFormsApp
{
    public partial class TaskForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int taskId;
            // Если в URL передан параметр id, значит редактируем существующую задачу
            if (IsPostBack || Request.QueryString["id"] == null || !int.TryParse(Request.QueryString["id"], out  taskId))
                return;


            using (var db = new TaskContext())
            {
                var task = db.Tasks.FirstOrDefault(t => t.Id == taskId);
                if (task == null) return;

                hfTaskId.Value = task.Id.ToString();
                txtTitle.Text = task.Title;
                txtDescription.Text = task.Description;
                ddlStatus.SelectedValue = task.Status.ToString();
                lblFormTitle.Text = "Редактировать задачу";

            }


        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (var db = new TaskContext())
            {
                TaskItem task;
                // Если hfTaskId содержит значение, то редактируем задачу
                if (!string.IsNullOrEmpty(hfTaskId.Value))
                {
                    int taskId = int.Parse(hfTaskId.Value);
                    task = db.Tasks.Find(taskId);
                    if (task == null)
                    {
                        // Если задача не найдена, можно вывести сообщение об ошибке
                        return;
                    }
                }
                else
                {
                    // Создаём новую задачу
                    task = new TaskItem
                    {
                        CreatedDate = DateTime.Now
                    };
                    db.Tasks.Add(task);
                }

                task.Title = txtTitle.Text;
                task.Description = txtDescription.Text;
                task.Status = (TaskStatus)Enum.Parse(typeof(TaskStatus), ddlStatus.SelectedValue);

                db.SaveChanges();
            }

            Response.Redirect("~/Default.aspx");
        }
    }
}