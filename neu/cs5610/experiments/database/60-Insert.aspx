<%@ Page Language="C#" AutoEventWireup="true" CodeFile="60-Insert.aspx.cs" Inherits="experiments_database_00" %>

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
            <asp:DetailsView CssClass="table" ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" 
                DataSourceID="SqlDataSource1" Height="50px" Width="125px" AllowPaging="True" DefaultMode="Insert" 
                OnItemInserted="DetailView_ItemInsert"
                OnItemCommand="DetailView_ItemCommand">
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
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Prev" />
            </asp:DetailsView>
            <asp:SqlDataSource
                ID="SqlDataSource1" 
                runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" DeleteCommand="DELETE FROM [Application] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [Application] ([Name], [Price], [Downloads], [Category], [Created]) VALUES (@Name, @Price, @Downloads, @Category, @Created)"
                ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [Name], [Price], [Downloads], [Category], [Created] FROM [Application]" UpdateCommand="UPDATE [Application] SET [Name] = @Name, [Price] = @Price, [Downloads] = @Downloads, [Category] = @Category, [Created] = @Created WHERE [Id] = @Id">
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
            <li>Change default mode to Insert
                <pre>
&lt;asp:DetailsView CssClass=&quot;table&quot; ID=&quot;DetailsView1&quot; runat=&quot;server&quot;
     AutoGenerateRows=&quot;False&quot; DataKeyNames=&quot;Id&quot; DataSourceID=&quot;SqlDataSource1&quot;
     Height=&quot;50px&quot; Width=&quot;125px&quot; AllowPaging=&quot;True&quot;
<strong style="color:red">     <span class="auto-style1">DefaultMode=&quot;Insert&quot;</span></strong>&gt;</pre>
            </li>
            <li>Create event handler for insert and cancel to redirect to grid
                <pre>
protected void <span class="auto-style1"><strong style="color:red">DetailView_ItemInsert</strong></span>(object sender,
    DetailsViewInsertedEventArgs e)
{
    if (e.AffectedRows == 1)
    {
        Response.Redirect("60-link-to-details-insert.aspx");
    }
}</pre>
            </li>
            <li>Add OnItemInserted attribute to DetailsView tag

                <pre>
&lt;asp:DetailsView CssClass=&quot;table&quot; ID=&quot;DetailsView1&quot; runat=&quot;server&quot;
     AutoGenerateRows=&quot;False&quot; DataKeyNames=&quot;Id&quot; DataSourceID=&quot;SqlDataSource1&quot;
     Height=&quot;50px&quot; Width=&quot;125px&quot; AllowPaging=&quot;True&quot;
     <strong style="color:red"><span class="auto-style1">DefaultMode=&quot;Insert&quot;</span>
     <span class="auto-style1">OnItemInserted=&quot;DetailView_ItemInsert&quot;</span></strong>&gt;</pre>

            </li>
            <li>Add OnItemCommand attribute to DetailsView tag

                <pre>
&lt;asp:DetailsView CssClass=&quot;table&quot; ID=&quot;DetailsView1&quot; runat=&quot;server&quot;
     AutoGenerateRows=&quot;False&quot; DataKeyNames=&quot;Id&quot; DataSourceID=&quot;SqlDataSource1&quot;
     Height=&quot;50px&quot; Width=&quot;125px&quot; AllowPaging=&quot;True&quot;
     <strong style="color:red"><span class="auto-style1">DefaultMode=&quot;Insert&quot;</span>
</strong>     <strong style="color:red"><span class="auto-style1">OnItemInserted=&quot;DetailView_ItemInsert&quot;</span>
</strong>     <span class="auto-style1"><strong style="color:red">OnItemCommand=&quot;DetailView_ItemCommand&quot;</strong></span>&gt;</pre>

            </li>
        </ul>
        <h2>Source</h2>
       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/60-Insert.aspx">Insert ASPX</a><br/>
       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/60-Insert.aspx.cs">Insert C#</a><br/>
    </div>
    </form>
</body>
</html>
