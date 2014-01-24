<%@ Page Language="C#" AutoEventWireup="true" CodeFile="70-Insert.aspx.cs" Inherits="experiments_database_70" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" rel="stylesheet" href="~/css/bootstrap.min.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>DetailsView Insert</h1>
        <div class="row">
            <div class="col-lg-4">
                <h2>Create New Application
                </h2>
            <asp:DetailsView
                CssClass="table"
                ID="DetailsView1"
                runat="server"
                AutoGenerateRows="False" 
                DataKeyNames="Id"
                DataSourceID="SqlDataSource1" 
                Height="50px"
                Width="325px"
                OnItemInserted="DetailView_ItemInsert"
                OnItemCommand="DetailView_ItemCommand"
                DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Downloads" HeaderText="Downloads" SortExpression="Downloads" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource
                ID="SqlDataSource1"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:jgaCS %>"
                DeleteCommand="DELETE FROM [Application] WHERE [Id] = @Id"
                InsertCommand="INSERT INTO [Application] ([Name], [Price], [Downloads], [Category]) VALUES (@Name, @Price, @Downloads, @Category)"
                ProviderName="<%$ ConnectionStrings:jgaCS.ProviderName %>"
                SelectCommand="SELECT [Id], [Name], [Price], [Downloads], [Category], [Created] FROM [Application]"
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
            </div>
            <div class="col-lg-8">
                <h2>Documentation</h2>
                <ul>
                    <li>Drag a database table into the Web form.</li>
                    <li>Remove the GridView, but keep the SqlDataSource</li>
                    <li>Add DetailsView instead</li>
                    <li>Add table class to the DetailsView control
                        and configure the data source
                        <pre>
&lt;asp:DetailsView
    ID=&quot;DetailsView1&quot;
    runat=&quot;server&quot;
    Height=&quot;50px&quot;
    Width=&quot;125px&quot;
    CssClass=&quot;table&quot;
    DataSourceID=&quot;SqlDataSource1&quot;&gt;
&lt;/asp:DetailsView&gt;</pre>
                    </li>
                    <li>From DetailsView Tasks window, Enable Inserting</li>
                    <li>From Properties window, configure the DefaultMode as Insert</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul>
                    <li>In the CS file, create event handlers for insert and cancel buttons to go back to the GridView page
                        <pre>
protected void DetailView_ItemInsert(object sender,
    DetailsViewInsertedEventArgs e)
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
                <h2>Source</h2>
       	        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/70.aspx">Main ASPX</a><br/>
       	        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/70.aspx.cs">Main C#</a><br/>
       	        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/70-Insert.aspx">Insert ASPX</a><br/>
       	        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/70-Insert.aspx.cs">Insert C#</a><br/>
       	        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/70-Update.aspx">Update ASPX</a><br/>
       	        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/70-Update.aspx.cs">Update C#</a><br/>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
