<%@ Page Language="C#" AutoEventWireup="true" CodeFile="70-Update.aspx.cs" Inherits="experiments_database_70_DetailsView_Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>DetailsView Update</h1>

        <div class="row">
            <div class="col-lg-4">
                <h2>Update Application</h2>
                <asp:DetailsView
                    ID="DetailsView1"
                    runat="server"
                    AutoGenerateRows="False"
                    DataKeyNames="Id"
                    Height="50px"
                    Width="325px"
                    CssClass="table"
                    DataSourceID="SqlDataSource1"
                    DefaultMode="Edit"
                    OnItemCommand="DetailView_ItemCommand"
                    OnItemUpdated="DetailView_ItemUpdate">
                    <Fields>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Downloads" HeaderText="Downloads" SortExpression="Downloads" />
                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource
                    ID="SqlDataSource1"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:jgaCS %>"
                    DeleteCommand="DELETE FROM [Application] WHERE [Id] = @Id"
                    InsertCommand="INSERT INTO [Application] ([Name], [Price], [Downloads], [Category], [Created]) VALUES (@Name, @Price, @Downloads, @Category, @Created)"
                    ProviderName="<%$ ConnectionStrings:jgaCS.ProviderName %>"
                    SelectCommand="SELECT [Id], [Name], [Price], [Downloads], [Category], [Created] FROM [Application] WHERE [Id] = @id"
                    UpdateCommand="UPDATE [Application] SET [Name] = @Name, [Price] = @Price, [Downloads] = @Downloads, [Category] = @Category, [Created] = @Created WHERE [Id] = @Id">
                    <SelectParameters>
                        <asp:QueryStringParameter
                            Name="id"
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
            </div><!-- col-lg-4 -->
            <div class="col-lg-8">
                <h2>Documentation</h2>
                <ul>
                    <li>Drag a database table to the page</li>
                    <li>Remove the GridView control, but keep the SqlDataSource</li>
                    <li>Add a DetailsView instead</li>
                    <li>Configure the DetailsView as follows
                        <pre>
&lt;asp:DetailsView
    ...
    CssClass=&quot;table&quot;
    DataSourceID=&quot;SqlDataSource1&quot;
    DefaultMode=&quot;Edit&quot;
    OnItemCommand=&quot;DetailView_ItemCommand&quot;
    OnItemUpdated=&quot;DetailView_ItemUpdate&quot;&gt;</pre>
                    </li>
                </ul>
            </div><!-- col-lg-8 -->
        </div><!-- row -->
        <div class="row">
            <div class="col-lg-12">
                <ul>
                    <li>Configure select statement to use a query string parameter
                        <pre>
&lt;asp:SqlDataSource
    ...
    SelectCommand=&quot;SELECT [Id], [Name], [Price], [Downloads], [Category], [Created]
                    FROM [Application] WHERE [Id] = @id&quot;&gt;
    &lt;SelectParameters&gt;
        &lt;asp:QueryStringParameter
	        Name=&quot;id&quot;
	        Type=&quot;Int32&quot;
	        QueryStringField=&quot;id&quot; /&gt;
    &lt;/SelectParameters&gt;
    ...
&lt;/asp:SqlDataSource&gt;</pre>
                    </li>
                    <li>Create event handlers
                        <pre>
protected void DetailView_ItemUpdate(object sender,
    DetailsViewUpdatedEventArgs e)
{
    if (e.AffectedRows == 1)
    {
        Response.Redirect("70-GridView.aspx");
    }
}
protected void DetailView_ItemCommand(object sender,
    DetailsViewCommandEventArgs e)
{
    if (e.CommandName == "Cancel")
    {
        Response.Redirect("70-GridView.aspx");
    }
}</pre>
                    </li>
                </ul>
            </div><!-- col-lg-12 -->
        </div><!-- row -->
    </div><!-- container -->
    </form>
</body>
</html>
