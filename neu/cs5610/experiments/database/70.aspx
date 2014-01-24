<%@ Page Language="C#" AutoEventWireup="true" CodeFile="70.aspx.cs" Inherits="experiments_database_70" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="~/css/bootstrap.min.css" />
    </head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Linking GridViews Update Link to Update Page</h1>
            <h2>Applications</h2>
            <a class="btn btn-primary" href="70-Insert.aspx">Add New Application</a><br />
&nbsp;<asp:GridView
                ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Id"
                DataSourceID="SqlDataSource1"
                EmptyDataText="There are no data records to display."
                CssClass="table" AllowPaging="True" AllowSorting="True" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Downloads" HeaderText="Downloads" SortExpression="Downloads" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                    <asp:CommandField ControlStyle-CssClass="btn btn-primary btn-sm" ShowDeleteButton="True" >
<ControlStyle CssClass="btn btn-primary btn-sm"></ControlStyle>
                    </asp:CommandField>
                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="70-Update.aspx?id={0}" Text="Edit">
                    <ControlStyle CssClass="btn btn-primary btn-sm" />
                    </asp:HyperLinkField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jgaCS %>" DeleteCommand="DELETE FROM [Application] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Application] ([Name], [Price], [Downloads], [Category], [Created]) VALUES (@Name, @Price, @Downloads, @Category, @Created)" ProviderName="<%$ ConnectionStrings:jgaCS.ProviderName %>" SelectCommand="SELECT [Id], [Name], [Price], [Downloads], [Category], [Created] FROM [Application]" UpdateCommand="UPDATE [Application] SET [Name] = @Name, [Price] = @Price, [Downloads] = @Downloads, [Category] = @Category, [Created] = @Created WHERE [Id] = @Id">
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
        <h2>Documentation</h2>

        <ul>
            <li>Create a Web form, e.g., 70-GridView.aspx</li>
            <li>Add bootstrap
                <pre>
&lt;link type=&quot;text/css&quot; rel=&quot;stylesheet&quot; href=&quot;~/css/bootstrap.min.css&quot; /&gt;</pre>
            </li>
            <li>From the Server Explorer window, drag a table into the page, e.g., Application table</li>
            <li>Add attribute CssClass to the GridView control
                <pre>
&lt;asp:GridView
    ID=&quot;GridView1&quot;
    runat=&quot;server&quot;
    AutoGenerateColumns=&quot;False&quot;
    DataKeyNames=&quot;Id&quot;
    DataSourceID=&quot;SqlDataSource1&quot;
    EmptyDataText=&quot;There are no data records to display.&quot;
    <strong style="color:red">CssClass=&quot;table&quot;</strong>&gt;</pre>
            </li>
            <li>
                Configure GridView for Sorting, Paging, and Delete</li>
            <li>
                Add a button to an insert page, e.g., 70-DetailsView-Insert.aspx
                <pre>
&lt;a class=&quot;btn btn-primary&quot; href=&quot;70-DetailsView-Insert.aspx&quot;&gt;Add New Application&lt;/a&gt;&lt;br /&gt;</pre>
            </li>
            <li>
                Add a new column to the GridView
                <ul>
                    <li>
                        From GridView Tasks, click Add New Column</li>
                    <li>
                        Select HyperLinkField</li>
                    <li>
                        Specify the text of the link: Edit</li>
                    <li>
                        Select Get URL from data field</li>
                    <li>
                        Type Id as the field from where to get the data</li>
                    <li>
                        In the URL format string field, link to the update page: </li>
                    <li>
                        70-DetailsView-Update.aspx?param_id={0} </li>
                    <li>
                        Style the link as a button
                        <pre>
&lt;asp:HyperLinkField ControlStyle-CssClass=&quot;btn btn-primary btn-sm&quot; DataNavigateUrlFields=&quot;Id&quot; DataNavigateUrlFormatString=&quot;70-DetailsView-Update.aspx&quot; Text=&quot;Edit&quot; /&gt;</pre></li>
                </ul>
            </li>
        </ul>
    </div>
    </form>
</body>
</html>
