<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>    

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>"
            DeleteCommand="DELETE FROM [Presentation] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO [Presentation] ([parentView], [name], [content], [created], [modified], [file], [path], [description]) VALUES (@parentView, @name, @content, @created, @modified, @file, @path, @description)"
            SelectCommand="SELECT p.Id, p.content, s.backgroundColor, s.width, s.height, s.position, s.[top], s.[left] FROM Presentation p, STYLE s where s.id=p.id"
            UpdateCommand="UPDATE [Presentation] SET [parentView] = @parentView, [name] = @name, [content] = @content, [created] = @created, [modified] = @modified, [file] = @file, [path] = @path, [description] = @description WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="parentView" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="content" Type="String" />
                <asp:Parameter DbType="Date" Name="created" />
                <asp:Parameter DbType="Date" Name="modified" />
                <asp:Parameter Name="file" Type="String" />
                <asp:Parameter Name="path" Type="String" />
                <asp:Parameter Name="description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="parentView" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="content" Type="String" />
                <asp:Parameter DbType="Date" Name="created" />
                <asp:Parameter DbType="Date" Name="modified" />
                <asp:Parameter Name="file" Type="String" />
                <asp:Parameter Name="path" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>    
        <asp:Repeater ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div id="<%# Eval("Id") %>"
                    style='background-color:<%# Eval("backgroundColor") %>; width:<%# Eval("width") %>px; height:<%# Eval("height") %>px; position:<%# Eval("position") %>; top:<%# Eval("top") %>px; left:<%# Eval("left") %>px;'
                    >
                    <%# Eval("content") %>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>
