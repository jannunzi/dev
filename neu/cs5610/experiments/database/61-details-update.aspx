<%@ Page Language="C#" AutoEventWireup="true" CodeFile="61-details-update.aspx.cs" Inherits="experiments_database_00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.min.css" />
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Details View Insert</h1>

        <h2>Applications</h2>

        <p>
            <asp:DetailsView CssClass="table" ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="50px" Width="125px" DefaultMode="Edit">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Downloads" HeaderText="Downloads" SortExpression="Downloads" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created">
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Prev" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" DeleteCommand="DELETE FROM [Application] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Application] ([Name], [Price], [Downloads], [Category], [Created]) VALUES (@Name, @Price, @Downloads, @Category, @Created)" ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>"
                SelectCommand="SELECT [Id], [Name], [Price], [Downloads], [Category], [Created] FROM [Application] WHERE [Id] = @param_id"
                UpdateCommand="UPDATE [Application] SET [Name] = @Name, [Price] = @Price, [Downloads] = @Downloads, [Category] = @Category, [Created] = @Created WHERE [Id] = @Id">
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
        <h2>Documentation</h2>
        <ul>
            <li>Enable editing, disable insert</li>
            <li>Change the default mode to editing<pre>
&lt;asp:DetailsView CssClass=&quot;table&quot; ID=&quot;DetailsView1&quot; runat=&quot;server&quot;
    AutoGenerateRows=&quot;False&quot; DataKeyNames=&quot;Id&quot; DataSourceID=&quot;SqlDataSource1&quot;
    Height=&quot;50px&quot; Width=&quot;125px&quot; <span class="auto-style1"><strong>DefaultMode=&quot;Edit&quot;</strong></span>&gt;</pre>
            </li>
            <li>Modify the SQL Select command to filter by param

                <pre>

&lt;asp:SqlDataSource ID=&quot;SqlDataSource1&quot; runat=&quot;server&quot;
    ConnectionString=&quot;&lt;%$ ConnectionStrings:dbConnectionString1 %&gt;&quot;
    DeleteCommand=&quot;DELETE FROM [Application] WHERE [Id] = @Id&quot;
    InsertCommand=&quot;INSERT INTO [Application] ([Name], [Price], [Downloads], [Category], [Created]) VALUES (@Name, @Price, @Downloads, @Category, @Created)&quot; ProviderName=&quot;&lt;%$ ConnectionStrings:dbConnectionString1.ProviderName %&gt;&quot;
    SelectCommand=&quot;SELECT [Id], [Name], [Price], [Downloads], [Category], [Created] FROM [Application] WHERE [Id] = @param_id&quot;
    UpdateCommand=&quot;UPDATE [Application] SET [Name] = @Name, [Price] = @Price, [Downloads] = @Downloads, [Category] = @Category, [Created] = @Created WHERE [Id] = @Id&quot;&gt;</pre>

            </li>
        </ul>
    </div>
    </form>
</body>
</html>
