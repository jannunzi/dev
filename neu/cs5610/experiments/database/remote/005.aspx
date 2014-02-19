<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/css/bootstrap.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Remote Database</h1>
        <div class="row">
            <div class="col-md-8">
                <h2>Applications</h2>
                <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Downloads" HeaderText="Downloads" SortExpression="Downloads" />
                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                        <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                        <asp:BoundField DataField="DeveloperId" HeaderText="DeveloperId" SortExpression="DeveloperId" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jgaCS %>" DeleteCommand="DELETE FROM [Application] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Application] ([Name], [Price], [Downloads], [Category], [Created], [DeveloperId]) VALUES (@Name, @Price, @Downloads, @Category, @Created, @DeveloperId)" SelectCommand="SELECT [Id], [Name], [Price], [Downloads], [Category], [Created], [DeveloperId] FROM [Application]" UpdateCommand="UPDATE [Application] SET [Name] = @Name, [Price] = @Price, [Downloads] = @Downloads, [Category] = @Category, [Created] = @Created, [DeveloperId] = @DeveloperId WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Price" Type="Double" />
                        <asp:Parameter Name="Downloads" Type="Int32" />
                        <asp:Parameter Name="Category" Type="String" />
                        <asp:Parameter Name="Created" Type="DateTime" />
                        <asp:Parameter Name="DeveloperId" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Price" Type="Double" />
                        <asp:Parameter Name="Downloads" Type="Int32" />
                        <asp:Parameter Name="Category" Type="String" />
                        <asp:Parameter Name="Created" Type="DateTime" />
                        <asp:Parameter Name="DeveloperId" Type="Int32" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <div class="col-md-4">
                <h2>Documentation</h2>
                <p>GridView displays all Applications</p>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
