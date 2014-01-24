<%@ Page Language="C#" AutoEventWireup="true" CodeFile="35.aspx.cs" Inherits="experiments_database_00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Data List Templates </h1>

        <h2>Applications</h2>

        <p>
            <asp:DataList CssClass="table table-striped" ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-xs-2">
                            <div width="140px">
                                <img class="img-rounded" alt="140x140" style="max-width: 100%;" src="../../images/square.png">
                            </div>
                        </div>
                        <div class="col-xs-10">
                            Name:
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' Font-Bold="true"  Font-Italic="true"/>
                            <br />
                            Price:
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price", "${0:f2}") %>' />
                            <br />
                            Downloads:
                            <asp:Label ID="DownloadsLabel" runat="server" Text='<%# Eval("Downloads") %>' />
                            <br />
                            Category:
                            <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                            <br />
                            Created:
                            <asp:Label ID="CreatedLabel" runat="server" Text='<%# Eval("Created","{0:d}") %>' />
                            <br />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
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
        </p>
        <h2>Source</h2>
       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/35.aspx">ASPX</a><br/>
        <a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/35.aspx.cs">C#</a>
    </div>
    </form>
</body>
</html>
