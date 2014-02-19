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
                <h2>Developers</h2>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="DevelopersDataSource" DataTextField="lastName" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DevelopersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:jgaCS %>" DeleteCommand="DELETE FROM [Developer] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Developer] ([firstName], [lastName]) VALUES (@firstName, @lastName)" ProviderName="<%$ ConnectionStrings:jgaCS.ProviderName %>" SelectCommand="SELECT [Id], [firstName], [lastName] FROM [Developer]" UpdateCommand="UPDATE [Developer] SET [firstName] = @firstName, [lastName] = @lastName WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="firstName" Type="String" />
                        <asp:Parameter Name="lastName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="firstName" Type="String" />
                        <asp:Parameter Name="lastName" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
            <div class="col-md-4">
                Dropdown lists all developers
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <h2>Applications</h2>
                <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ApplicationsDataSource" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True">
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
                <asp:SqlDataSource ID="ApplicationsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:jgaCS %>" DeleteCommand="DELETE FROM [Application] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Application] ([Name], [Price], [Downloads], [Category], [Created], [DeveloperId]) VALUES (@Name, @Price, @Downloads, @Category, @Created, @DeveloperId)" SelectCommand="SELECT [Id], [Name], [Price], [Downloads], [Category], [Created], [DeveloperId] FROM [Application]" UpdateCommand="UPDATE [Application] SET [Name] = @Name, [Price] = @Price, [Downloads] = @Downloads, [Category] = @Category, [Created] = @Created, [DeveloperId] = @DeveloperId WHERE [Id] = @Id">
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
                <p>GridView displays all Applications</p>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
