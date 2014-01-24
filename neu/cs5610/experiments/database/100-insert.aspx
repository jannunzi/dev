<%@ Page Language="C#" AutoEventWireup="true" CodeFile="100-insert.aspx.cs" Inherits="experiments_database_100_create_developer_table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../../../css/bootstrap.min.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Insert Develper</h1>
        <p>
            <asp:DetailsView 
                CssClass="table" 
                ID="DetailsView1" 
                runat="server" 
                AutoGenerateRows="False" 
                DataKeyNames="Id" 
                DataSourceID="SqlDataSource1" 
                Height="50px" 
                Width="125px" 
                OnItemInserted="DetailsView1_ItemInserted"
                OnItemCommand="DetailsView1_ItemCommand"
                DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
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
