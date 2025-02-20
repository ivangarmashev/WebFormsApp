using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFormsApp.Models;

namespace WebFormsApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindTasks();
        }

        // Метод для привязки данных к GridView с учётом фильтрации
        protected void BindTasks()
        {
            using (var db = new TaskContext())
            {
                var tasks = db.Tasks.AsQueryable();

                if (!string.IsNullOrEmpty(ddlStatusFilter.SelectedValue))
                {
                    var status = (TaskStatus)Enum.Parse(typeof(TaskStatus), ddlStatusFilter.SelectedValue);
                    tasks = tasks.Where(t => t.Status == status);
                }

                gvTasks.DataSource = tasks.ToList();
                gvTasks.DataBind();
            }
        }

        protected void ddlStatusFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTasks();
        }

        // Обработка нажатия кнопки "Удалить"
        protected void gvTasks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteTask")
            {
                int taskId = Convert.ToInt32(e.CommandArgument);
                using (var db = new TaskContext())
                {
                    var task = db.Tasks.Find(taskId);
                    if (task != null)
                    {
                        db.Tasks.Remove(task);
                        db.SaveChanges();
                    }
                }
                BindTasks();
            }
        }

        // Метод для получения статуса задачи кириллицей.
        public string GetStatusDisplayName(object statusValue)
        {
            if (statusValue == null || !(statusValue is TaskStatus status))
                return string.Empty;

            // Получаем информацию о члене перечисления
            MemberInfo[] memberInfo = status.GetType().GetMember(status.ToString());
            if (memberInfo != null && memberInfo.Length > 0)
            {
                // Ищем атрибут DisplayAttribute
                var attrs = memberInfo[0].GetCustomAttributes(typeof(DisplayAttribute), false);
                if (attrs != null && attrs.Length > 0)
                    return ((DisplayAttribute)attrs[0]).Name;
            }
            // Если атрибут не найден, возвращаем стандартное значение
            return status.ToString();
        }

    }
}