<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void submit_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/css/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    
        <div class="row">
            <div class="col-md-8">
                <h2>Render Regions as DIVs</h2>
                    <asp:Repeater ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <div id='<%# Eval("Id") %>'
                                style='z-index:1;background-color:<%# Eval("backgroundColor") %>;position:<%# Eval("position") %>;top:<%# Eval("top") %>px;left:<%# Eval("left") %>px;width:<%# Eval("width") %>px;height:<%# Eval("height") %>px'>
                                <%# Eval("content") %>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8">
                <h2>Regions Editor</h2>

                <asp:TextBox ID="nameform" runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:TextBox ID="contentform" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                <br />
                <asp:Button OnClick="submit_Click" ID="submit" runat="server" Text="Add Region" CssClass="btn btn-primary btn-block" />
                <br />
                <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>

            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <h2>Styles</h2>
                    <asp:GridView CssClass="table" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3" EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="backgroundColor" HeaderText="backgroundColor" SortExpression="backgroundColor" />
                            <asp:BoundField DataField="width" HeaderText="width" SortExpression="width" />
                            <asp:BoundField DataField="height" HeaderText="height" SortExpression="height" />
                            <asp:BoundField DataField="position" HeaderText="position" SortExpression="position" />
                            <asp:BoundField DataField="top" HeaderText="top" SortExpression="top" />
                            <asp:BoundField DataField="left" HeaderText="left" SortExpression="left" />
                            <asp:BoundField DataField="regionId" HeaderText="regionId" SortExpression="regionId" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>" DeleteCommand="DELETE FROM [PLAF] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PLAF] ([backgroundColor], [width], [height], [position], [top], [left], [regionId]) VALUES (@backgroundColor, @width, @height, @position, @top, @left, @regionId)" ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [backgroundColor], [width], [height], [position], [top], [left], [regionId] FROM [PLAF]" UpdateCommand="UPDATE [PLAF] SET [backgroundColor] = @backgroundColor, [width] = @width, [height] = @height, [position] = @position, [top] = @top, [left] = @left, [regionId] = @regionId WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="backgroundColor" Type="String" />
                            <asp:Parameter Name="width" Type="Int32" />
                            <asp:Parameter Name="height" Type="Int32" />
                            <asp:Parameter Name="position" Type="String" />
                            <asp:Parameter Name="top" Type="Int32" />
                            <asp:Parameter Name="left" Type="Int32" />
                            <asp:Parameter Name="regionId" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="backgroundColor" Type="String" />
                            <asp:Parameter Name="width" Type="Int32" />
                            <asp:Parameter Name="height" Type="Int32" />
                            <asp:Parameter Name="position" Type="String" />
                            <asp:Parameter Name="top" Type="Int32" />
                            <asp:Parameter Name="left" Type="Int32" />
                            <asp:Parameter Name="regionId" Type="Int32" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

            </div>
        </div>

    </div>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>"
            DeleteCommand="DELETE FROM [Region] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO [Region] ([name], [content]) VALUES (@name, @content)"
            ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>"
            SelectCommand="SELECT [Id], [name], [content] FROM [Region]"
            UpdateCommand="UPDATE [Region] SET [name] = @name, [content] = @content WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:FormParameter FormField="nameform" Name="name" Type="String" />
                <asp:FormParameter FormField="contentform" Name="content" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="content" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>"
            DeleteCommand="DELETE FROM [Region] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO [Region] ([name], [content]) VALUES (@name, @content)"
            ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>"
            SelectCommand="SELECT r.Id, r.name, r.content, p.backgroundColor, p.position, p.[top], p.[left], p.width, p.height FROM Region r, PLAF p WHERE r.id=p.regionId"
            UpdateCommand="UPDATE [Region] SET [name] = @name, [content] = @content WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="content" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="content" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
