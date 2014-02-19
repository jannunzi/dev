<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void InsertNewPresentation(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/css/bootstrap.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    
        <h1>New Presentation Form</h1>

        <div class="row">
            <div class="col-md-8">

                <asp:TextBox CssClass="form-control" ID="name" runat="server" placeholder="Name"></asp:TextBox>
                <br />
                <asp:TextBox CssClass="form-control" ID="content" runat="server" TextMode="MultiLine" placeholder="Content"></asp:TextBox>
                <br />
                <asp:Button CssClass="btn btn-primary btn-block" ID="submit" runat="server" Text="Add Presentation" OnClick="InsertNewPresentation" />
                <br />
                <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
    
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>"
            DeleteCommand="DELETE FROM [Presentation] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO [Presentation] ([name], [content]) VALUES (@name, @content)"
            ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>"
            SelectCommand="SELECT [Id], [parentView], [name], [content], [created], [modified], [file], [path], [description] FROM [Presentation]"
            UpdateCommand="UPDATE [Presentation] SET [parentView] = @parentView, [name] = @name, [content] = @content, [created] = @created, [modified] = @modified, [file] = @file, [path] = @path, [description] = @description WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:FormParameter FormField="name" Name="name" Type="String" />
                <asp:FormParameter FormField="content" Name="content" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="parentView" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="content" Type="String" />
                <asp:Parameter DbType="Date" Name="created" />
                <asp:Parameter DbType="Date" Name="modified" />
                <asp:Parameter Name="file" Type="String" />
                <asp:Parameter Name="path" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

