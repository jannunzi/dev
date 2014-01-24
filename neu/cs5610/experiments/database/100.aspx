<%@ Page Language="C#" AutoEventWireup="true" CodeFile="100.aspx.cs" Inherits="experiments_database_100_create_developer_table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../../../css/bootstrap.min.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>List of Developers</h1>
        <a class="btn btn-primary" href="100-insert.aspx">Add Developer</a>
        <p>
            <asp:GridView
                CssClass="table"
                ID="GridView1" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True" 
                AutoGenerateColumns="False" 
                DataKeyNames="Id" 
                DataSourceID="SqlDataSource1" 
                EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                    <ControlStyle CssClass="btn btn-primary" />
                    </asp:CommandField>
                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="100-update.aspx?id={0}" Text="Edit Page" >
                    <ControlStyle CssClass="btn btn-primary" />
                    </asp:HyperLinkField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource 
                ID="SqlDataSource1" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" 
                DeleteCommand="DELETE FROM [Developer] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [Developer] ([firstName], [lastName], [email]) VALUES (@firstName, @lastName, @email)" 
                ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" 
                SelectCommand="SELECT [Id], [firstName], [lastName], [email] FROM [Developer]" 
                UpdateCommand="UPDATE [Developer] SET [firstName] = @firstName, [lastName] = @lastName, [email] = @email WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <ol>
            <li> First create the table with the following SQL
                <pre>
CREATE TABLE [dbo].[Developer]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [firstName] VARCHAR(50), 
    [lastName] VARCHAR(50) NULL, 
    [email] VARCHAR(50) NULL
)</pre>
            </li>
            <li>
                Then connect to the database with a data source such as:
                <pre>
&lt;asp:SqlDataSource 
    ID=&quot;SqlDataSource1&quot; 
    runat=&quot;server&quot; 
    ConnectionString=&quot;&lt;%$ ConnectionStrings:dbConnectionString1 %&gt;&quot; 
    DeleteCommand=&quot;DELETE FROM [Developer] WHERE [Id] = @Id&quot; 
    InsertCommand=&quot;INSERT INTO [Developer] ([firstName], [lastName], [email]) VALUES (@firstName, @lastName, @email)&quot; 
    ProviderName=&quot;&lt;%$ ConnectionStrings:dbConnectionString1.ProviderName %&gt;&quot; 
    SelectCommand=&quot;SELECT [Id], [firstName], [lastName], [email] FROM [Developer]&quot; 
    UpdateCommand=&quot;UPDATE [Developer] SET [firstName] = @firstName, [lastName] = @lastName, [email] = @email WHERE [Id] = @Id&quot;&gt;
    &lt;DeleteParameters&gt;
        &lt;asp:Parameter Name=&quot;Id&quot; Type=&quot;Int32&quot; /&gt;
    &lt;/DeleteParameters&gt;
    &lt;InsertParameters&gt;
        &lt;asp:Parameter Name=&quot;firstName&quot; Type=&quot;String&quot; /&gt;
        &lt;asp:Parameter Name=&quot;lastName&quot; Type=&quot;String&quot; /&gt;
        &lt;asp:Parameter Name=&quot;email&quot; Type=&quot;String&quot; /&gt;
    &lt;/InsertParameters&gt;
    &lt;UpdateParameters&gt;
        &lt;asp:Parameter Name=&quot;firstName&quot; Type=&quot;String&quot; /&gt;
        &lt;asp:Parameter Name=&quot;lastName&quot; Type=&quot;String&quot; /&gt;
        &lt;asp:Parameter Name=&quot;email&quot; Type=&quot;String&quot; /&gt;
        &lt;asp:Parameter Name=&quot;Id&quot; Type=&quot;Int32&quot; /&gt;
    &lt;/UpdateParameters&gt;
&lt;/asp:SqlDataSource&gt;</pre>
            </li>
            <li>
                Finally use a GridView control to display the table data:
                <pre>
&lt;asp:GridView
    CssClass=&quot;table&quot;
    ID=&quot;GridView1&quot; 
    runat=&quot;server&quot; 
    AllowPaging=&quot;True&quot; 
    AllowSorting=&quot;True&quot; 
    AutoGenerateColumns=&quot;False&quot; 
    DataKeyNames=&quot;Id&quot; 
    DataSourceID=&quot;SqlDataSource1&quot; 
    EmptyDataText=&quot;There are no data records to display.&quot;&gt;
    &lt;Columns&gt;
        &lt;asp:BoundField DataField=&quot;Id&quot; HeaderText=&quot;Id&quot; ReadOnly=&quot;True&quot; SortExpression=&quot;Id&quot; /&gt;
        &lt;asp:BoundField DataField=&quot;firstName&quot; HeaderText=&quot;firstName&quot; SortExpression=&quot;firstName&quot; /&gt;
        &lt;asp:BoundField DataField=&quot;lastName&quot; HeaderText=&quot;lastName&quot; SortExpression=&quot;lastName&quot; /&gt;
        &lt;asp:BoundField DataField=&quot;email&quot; HeaderText=&quot;email&quot; SortExpression=&quot;email&quot; /&gt;
        &lt;asp:CommandField ShowDeleteButton=&quot;True&quot; ShowEditButton=&quot;True&quot;&gt;
        &lt;ControlStyle CssClass=&quot;btn btn-primary&quot; /&gt;
        &lt;/asp:CommandField&gt;
    &lt;/Columns&gt;
&lt;/asp:GridView&gt;</pre>
            </li>
        </ol>
        <h2>Source</h2>

       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100.aspx">Main ASPX</a><br/>
        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100.aspx.cs">Main C#</a>
       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100-insert.aspx">Insert ASPX</a><br/>
        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100-insert.aspx.cs">Insert C#</a>
       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100-update.aspx">Update ASPX</a><br/>
        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/100-update.aspx.cs">Update C#</a>
    </div>
    </form>
</body>
</html>
