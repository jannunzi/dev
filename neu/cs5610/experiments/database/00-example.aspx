<%@ Page Language="C#" AutoEventWireup="true" CodeFile="00-example.aspx.cs" Inherits="experiments_database_100_create_developer_table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../../../css/bootstrap.min.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">

        <h1>Pages and Widgets</h1>

        <div class="row">
            <div class="col-sm-6">
                <h2>Web Pages</h2>
                <p>
                    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" DeleteCommand="DELETE FROM [Webpage] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Webpage] ([Name], [Created]) VALUES (@Name, @Created)" ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [Name], [Created] FROM [Webpage]" UpdateCommand="UPDATE [Webpage] SET [Name] = @Name, [Created] = @Created WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter DbType="Date" Name="Created" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter DbType="Date" Name="Created" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
            <div class="col-sm-6">
                <h2>Widgets</h2>
                <p>
                    <asp:GridView CssClass="table" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                            <asp:BoundField DataField="Html" HeaderText="Html" SortExpression="Html" />
                            <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                            <asp:BoundField DataField="Style" HeaderText="Style" SortExpression="Style" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" DeleteCommand="DELETE FROM [Widget] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Widget] ([Width], [Height], [Html], [Class], [Style], [Name]) VALUES (@Width, @Height, @Html, @Class, @Style, @Name)" ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [Width], [Height], [Html], [Class], [Style], [Name] FROM [Widget]" UpdateCommand="UPDATE [Widget] SET [Width] = @Width, [Height] = @Height, [Html] = @Html, [Class] = @Class, [Style] = @Style, [Name] = @Name WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Width" Type="Int32" />
                            <asp:Parameter Name="Height" Type="Int32" />
                            <asp:Parameter Name="Html" Type="String" />
                            <asp:Parameter Name="Class" Type="String" />
                            <asp:Parameter Name="Style" Type="String" />
                            <asp:Parameter Name="Name" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Width" Type="Int32" />
                            <asp:Parameter Name="Height" Type="Int32" />
                            <asp:Parameter Name="Html" Type="String" />
                            <asp:Parameter Name="Class" Type="String" />
                            <asp:Parameter Name="Style" Type="String" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
        </div>

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
