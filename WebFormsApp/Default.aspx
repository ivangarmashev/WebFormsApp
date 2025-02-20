<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebFormsApp.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Список задач</title>
    <!-- Подключение Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h1>Список задач</h1>
                <asp:Button ID="btnAddTask" runat="server" Text="Добавить задачу" PostBackUrl="~/TaskForm.aspx" CssClass="btn btn-primary custom-button" />
            </div>
            <div class="row mb-3">
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlStatusFilter" runat="server" AutoPostBack="true" 
                        OnSelectedIndexChanged="ddlStatusFilter_SelectedIndexChanged" CssClass="form-control">
                        <asp:ListItem Value="" Text="Все" />
                        <asp:ListItem Value="InProgress" Text="В процессе" />
                        <asp:ListItem Value="Completed" Text="Завершена" />
                    </asp:DropDownList>
                </div>
            </div>
            <asp:GridView ID="gvTasks" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
                OnRowCommand="gvTasks_RowCommand" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Title" HeaderText="Название" />
                    <asp:BoundField DataField="Description" HeaderText="Описание" />
                    <asp:BoundField DataField="CreatedDate" HeaderText="Дата создания" 
                        DataFormatString="{0:dd.MM.yyyy}" />
                    <asp:TemplateField HeaderText="Статус">
                        <ItemTemplate>
                            <%# GetStatusDisplayName(Eval("Status")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Right" />
                        <ItemTemplate>
                            <a href='<%# "TaskForm.aspx?id=" + Eval("Id") %>' class="btn btn-sm btn-secondary custom-button">Редактировать</a>
                            <asp:LinkButton ID="lbDelete" runat="server" 
                                CommandArgument='<%# Eval("Id") %>' CommandName="DeleteTask" Text="Удалить" CssClass="btn btn-sm btn-danger ml-2 custom-button"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="alert alert-info" role="alert">
                        Список задач пуст.
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
    <!-- Подключение Bootstrap JS и зависимостей -->
    <script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDuq/78T0SRJEA0bXKa2C5rD/2rKfSLG3I3DBeVXFe/TN+KzT" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
