<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskForm.aspx.cs" Inherits="WebFormsApp.TaskForm" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Форма задачи</title>
    <!-- Подключение Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="mb-4">
                <asp:Label ID="lblFormTitle" runat="server" Text="Новая задача"></asp:Label>
            </h2>
            <!-- Скрытое поле для идентификатора задачи -->
            <asp:HiddenField ID="hfTaskId" runat="server" />
            <div class="form-group">
                <label for="txtTitle">Название:</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtDescription">Описание:</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" Columns="40" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="ddlStatus">Статус:</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Value="InProgress" Text="В процессе" />
                    <asp:ListItem Value="Completed" Text="Завершена" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Сохранить" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancel" runat="server" Text="Отмена" PostBackUrl="~/Default.aspx" CssClass="btn btn-secondary ml-2" />
            </div>
        </div>
    </form>
    <!-- Подключение Bootstrap JS и зависимостей -->
    <script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDuq/78T0SRJEA0bXKa2C5rD/2rKfSLG3I3DBeVXFe/TN+KzT" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
