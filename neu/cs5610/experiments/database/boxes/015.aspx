<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    // @new added click event handler to execute update
    protected void boxsave_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Update();
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.css" />
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.js"></script>
    <style>

        .wam-hidden {
            display : none;
        }

        .box {
            width : 100px;
            height : 100px;
            position : absolute;
            top:100px;
            left:100px;
            background-color:yellow;
        }
    </style>
</head>
<body>

    <!-- @new removed method -->
    <form id="form1" runat="server">
    <div class="container">

        <h1>Repeater renders boxes, dragging them updates database</h1>

        <div class="wam-hidden">
            <asp:TextBox ID="boxid"   runat="server" CssClass="boxid"/>
            <asp:TextBox ID="boxtop"  runat="server" CssClass="boxtop"/>
            <asp:TextBox ID="boxleft" runat="server" CssClass="boxleft"/>

            <!-- @new changed from button to asp:Button so that we can invoke click event to execute update -->
            <asp:Button  ID="boxsave" runat="server" CssClass="boxsave" Text="save" OnClick="boxsave_Click" />

        </div>

        <!-- @new added repeater to draw boxes from database -->
        <asp:Repeater ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="box" id="<%# Eval("Id") %>"
                    style='width:<%# Eval("width") %>px;height:<%# Eval("height") %>px;position:absolute;top:<%# Eval("top") %>px;left:<%# Eval("left") %>px;background-color:<%# Eval("bgColor") %>;color:<%# Eval("fgColor") %>;'>
                    <%# Eval("content") %>
                </div>
            </ItemTemplate>
        </asp:Repeater>


        <rasala:FileView ID="fileView" runat="server" />

    </div>

    <script>
        $(function () {
            $(".box").draggable({
                stop: function (event, ui) {

                    var id = ui.helper.attr("id");
                    $(".boxid").val(id);

                    var position = ui.position;
                    $(".boxtop").val(position.top);
                    $(".boxleft").val(position.left);
                    $(".boxsave").click();
                }
            });
        });
    </script>

        <!-- @new this is the datasource used by the repeater.
            UpdateCommand has been changed so that we only update top and left.
            UpdateParameters has been changed to use FormParameters instead -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>"
            DeleteCommand="DELETE FROM [Box] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO [Box] ([width], [height], [top], [left], [bgColor], [fgColor], [content]) VALUES (@width, @height, @top, @left, @bgColor, @fgColor, @content)"
            ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>"
            SelectCommand="SELECT [Id], [width], [height], [top], [left], [bgColor], [fgColor], [content] FROM [Box]"
            UpdateCommand="UPDATE [Box] SET [top] = @top, [left] = @left WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="width" Type="Int32" />
                <asp:Parameter Name="height" Type="Int32" />
                <asp:Parameter Name="top" Type="Int32" />
                <asp:Parameter Name="left" Type="Int32" />
                <asp:Parameter Name="bgColor" Type="String" />
                <asp:Parameter Name="fgColor" Type="String" />
                <asp:Parameter Name="content" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:FormParameter FormField="boxtop"  Name="top" Type="Int32" />
                <asp:FormParameter FormField="boxleft" Name="left" Type="Int32" />
                <asp:FormParameter FormField="boxid"   Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </form>

    </body>
</html>
