<%@ Page Language="C#" AutoEventWireup="true" CodeFile="00-dropdown.aspx.cs" Inherits="experiments_database_100_create_developer_table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../../../css/bootstrap.min.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">

        <h1>Dropdown from Table</h1>

        <h2>Webpages</h2>
        <p>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" DeleteCommand="DELETE FROM [Webpage] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Webpage] ([Name], [Created]) VALUES (@Name, @Created)" ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [Name], [Created] FROM [Webpage]" UpdateCommand="UPDATE [Webpage] SET [Name] = @Name, [Created] = @Created WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter DbType="Date" Name="Created" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter DbType="Date" Name="Created" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>

        <h2>Widgets</h2>
        <p>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" DeleteCommand="DELETE FROM [Widget] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Widget] ([Width], [Height], [Html], [Class], [Style], [Name]) VALUES (@Width, @Height, @Html, @Class, @Style, @Name)" ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [Width], [Height], [Html], [Class], [Style], [Name] FROM [Widget]" UpdateCommand="UPDATE [Widget] SET [Width] = @Width, [Height] = @Height, [Html] = @Html, [Class] = @Class, [Style] = @Style, [Name] = @Name WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Width" Type="Int32" />
                    <asp:Parameter Name="Height" Type="Int32" />
                    <asp:Parameter Name="Html" Type="String" />
                    <asp:Parameter Name="Class" Type="String" />
                    <asp:Parameter Name="Style" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Width" Type="Int32" />
                    <asp:Parameter Name="Height" Type="Int32" />
                    <asp:Parameter Name="Html" Type="String" />
                    <asp:Parameter Name="Class" Type="String" />
                    <asp:Parameter Name="Style" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>

       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100.aspx">Main ASPX</a><br/>
        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100.aspx.cs">Main C#</a>
       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100-insert.aspx">Insert ASPX</a><br/>
        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100-insert.aspx.cs">Insert C#</a>
       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100-update.aspx">Update ASPX</a><br/>
        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100-update.aspx.cs">Update C#</a>
    </div>
    </form>
</body>
</html>
