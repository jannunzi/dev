<%@ Page Language="C#" AutoEventWireup="true" CodeFile="215.aspx.cs" Inherits="experiments_database_100_create_developer_table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../../../css/bootstrap.min.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">

        <h1>Association Tables with Joined Tables</h1>

        <div class="row">
            <div class="col-sm-6">
                <h2>Association Editor</h2>
                <p>
                    <asp:DetailsView CssClass="table" ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="50px" Width="125px" DefaultMode="Insert">
                        <Fields>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Developer" HeaderText="Developer" SortExpression="Developer" />
                            <asp:BoundField DataField="Application" HeaderText="Application" SortExpression="Application" />
                            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                            <asp:CommandField ShowInsertButton="True">
                            <ControlStyle CssClass="btn btn-primary btn-sm" />
                            </asp:CommandField>
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" DeleteCommand="DELETE FROM [DEV2APP] WHERE [Id] = @Id" InsertCommand="INSERT INTO [DEV2APP] ([Developer], [Application], [Role]) VALUES (@Developer, @Application, @Role)" ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [Developer], [Application], [Role] FROM [DEV2APP]" UpdateCommand="UPDATE [DEV2APP] SET [Developer] = @Developer, [Application] = @Application, [Role] = @Role WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Developer" Type="Int32" />
                            <asp:Parameter Name="Application" Type="Int32" />
                            <asp:Parameter Name="Role" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Developer" Type="Int32" />
                            <asp:Parameter Name="Application" Type="Int32" />
                            <asp:Parameter Name="Role" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
            <div class="col-sm-6">
                <h2>Association Table Data</h2>
                <p>
                    <asp:GridView CssClass="table" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Developer" HeaderText="Developer" SortExpression="Developer" />
                            <asp:BoundField DataField="Application" HeaderText="Application" SortExpression="Application" />
                            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                            <ControlStyle CssClass="btn btn-primary btn-sm" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource 
                        ID="SqlDataSource1" 
                        runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>"
                        DeleteCommand="DELETE FROM [DEV2APP] WHERE [Id] = @Id" 
                        InsertCommand="INSERT INTO [DEV2APP] ([Developer], [Application], [Role]) VALUES (@Developer, @Application, @Role)" 
                        ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" 
                        SelectCommand="SELECT [DEV2APP].Id, [Developer].firstName AS Developer, [Application].Name AS Application, [Role] FROM [DEV2APP], [Application], [Developer] WHERE [Developer].Id = [DEV2APP].Developer AND [DEV2APP].Application = [Application].Id" 
                        UpdateCommand="UPDATE [DEV2APP] SET [Developer] = @Developer, [Application] = @Application, [Role] = @Role WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Developer" Type="Int32" />
                            <asp:Parameter Name="Application" Type="Int32" />
                            <asp:Parameter Name="Role" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Developer" Type="Int32" />
                            <asp:Parameter Name="Application" Type="Int32" />
                            <asp:Parameter Name="Role" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <h2>Developers</h2>
                <p>
                    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" DataSourceID="SqlDataSource3" EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                            <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                            <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                            <ControlStyle CssClass="btn btn-primary btn-sm" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" DeleteCommand="DELETE FROM [Developer] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Developer] ([firstName], [lastName], [email], [gender]) VALUES (@firstName, @lastName, @email, @gender)" ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [firstName], [lastName], [email], [gender] FROM [Developer]" UpdateCommand="UPDATE [Developer] SET [firstName] = @firstName, [lastName] = @lastName, [email] = @email, [gender] = @gender WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="firstName" Type="String" />
                            <asp:Parameter Name="lastName" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="gender" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="firstName" Type="String" />
                            <asp:Parameter Name="lastName" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="gender" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
            <div class="col-sm-6">
                <h2>Applications</h2>
                <p>
                    <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" DataSourceID="SqlDataSource4" EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                            <ControlStyle CssClass="btn btn-primary btn-sm" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" DeleteCommand="DELETE FROM [Application] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Application] ([Name], [Price], [Downloads], [Category], [Created]) VALUES (@Name, @Price, @Downloads, @Category, @Created)" ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [Name], [Price], [Downloads], [Category], [Created] FROM [Application]" UpdateCommand="UPDATE [Application] SET [Name] = @Name, [Price] = @Price, [Downloads] = @Downloads, [Category] = @Category, [Created] = @Created WHERE [Id] = @Id">
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
            </div>
        </div>

        <h2>Source</h2>

       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/215.aspx">Main ASPX</a><br/>
    </div>
    </form>
</body>
</html>
