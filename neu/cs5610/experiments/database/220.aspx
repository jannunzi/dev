<%@ Page Language="C#" AutoEventWireup="true" CodeFile="220.aspx.cs" Inherits="experiments_database_100_create_developer_table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../../../css/bootstrap.min.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">

        <h1>Table Drill Down</h1>

        <h2>Developers</h2>
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                    <ControlStyle CssClass="btn btn-primary btn-sm" />
                    </asp:CommandField>
                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="220.aspx?id={0}" Text="Drill Down">
                    <ControlStyle CssClass="btn btn-primary btn-sm" />
                    </asp:HyperLinkField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" DeleteCommand="DELETE FROM [Developer] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Developer] ([firstName], [lastName], [email], [gender]) VALUES (@firstName, @lastName, @email, @gender)" ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [firstName], [lastName], [email], [gender] FROM [Developer]" UpdateCommand="UPDATE [Developer] SET [firstName] = @firstName, [lastName] = @lastName, [email] = @email, [gender] = @gender WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>

        <h2>Applications</h2>
        <p>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Downloads" HeaderText="Downloads" SortExpression="Downloads" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                    <ControlStyle CssClass="btn btn-primary btn-sm" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource 
                ID="SqlDataSource2" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" 
                DeleteCommand="DELETE FROM [Application] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [Application] ([Name], [Price], [Downloads], [Category], [Created]) VALUES (@Name, @Price, @Downloads, @Category, @Created)" 
                ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" 
                SelectCommand="SELECT Application.[Id], Application.[Name], Application.[Price], Application.[Downloads], Application.[Category], Application.[Created] FROM [Application], [Developer], [Dev2App] WHERE Developer.[Id]=@param_id AND Developer.Id = Dev2App.Developer AND Dev2App.Application = Application.Id"
                UpdateCommand="UPDATE [Application] SET [Name] = @Name, [Price] = @Price, [Downloads] = @Downloads, [Category] = @Category, [Created] = @Created WHERE [Id] = @Id">
                <SelectParameters>
                    <asp:QueryStringParameter
                        Name="param_id"
                        Type="Int32"
                        QueryStringField="id" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Price" Type="Double" />
                    <asp:Parameter Name="Downloads" Type="Int32" />
                    <asp:Parameter Name="Category" Type="String" />
                    <asp:Parameter DbType="Date" Name="Created" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Price" Type="Double" />
                    <asp:Parameter Name="Downloads" Type="Int32" />
                    <asp:Parameter Name="Category" Type="String" />
                    <asp:Parameter DbType="Date" Name="Created" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>

        <h2>Source</h2>

       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/220.aspx">Main ASPX</a><br/>
    </div>
    </form>
</body>
</html>
