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
        <h1>Images</h1>
        <div class="row">
            <div class="col-md-8">
                <h2>ImageField</h2>
                <p>
                    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" />
                            <asp:ImageField DataImageUrlField="url" HeaderText="ImageField">
                            </asp:ImageField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>" DeleteCommand="DELETE FROM [Image] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Image] ([url]) VALUES (@url)" ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [url] FROM [Image]" UpdateCommand="UPDATE [Image] SET [url] = @url WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="url" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="url" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
            <div class="col-md-4">

            </div>
        </div>
    </div>
    </form>
</body>
</html>
