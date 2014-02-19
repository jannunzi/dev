<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/css/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h2>Pages</h2>
                    <asp:DropDownList CssClass="form-control" ID="pageId" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="Id" AutoPostBack="True">
                    </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <h2>Regions</h2>
                <p>
                    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                            <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                            <asp:BoundField DataField="pageId" HeaderText="pageId" SortExpression="pageId" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>"
                        DeleteCommand="DELETE FROM [Region] WHERE [Id] = @Id"
                        InsertCommand="INSERT INTO [Region] ([name], [content], [pageId]) VALUES (@name, @content, @pageId)" ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>"
                        SelectCommand="SELECT [Id], [name], [content], [pageId] FROM [Region] WHERE pageId=@pid"
                        UpdateCommand="UPDATE [Region] SET [name] = @name, [content] = @content, [pageId] = @pageId WHERE [Id] = @Id">
                        <SelectParameters>
                            <asp:FormParameter FormField="pageId" Name="pid" Type="Int32" DefaultValue="1" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="content" Type="String" />
                            <asp:Parameter Name="pageId" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="content" Type="String" />
                            <asp:Parameter Name="pageId" Type="Int32" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
        </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>" DeleteCommand="DELETE FROM [Page] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Page] ([name]) VALUES (@name)" ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [name] FROM [Page]" UpdateCommand="UPDATE [Page] SET [name] = @name WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
