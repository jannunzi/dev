<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void insertBox_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
    }

    protected void updateBox_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Update();
    }

    protected void deleteBox_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Delete();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="~/css/jquery/jquery-ui.css" />
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.js"></script>

    <style>
        .boxdelete {
            cursor : pointer;
            float : right;
            display : none;
        }
        .wam-hidden {
            display : none;
        }
        .wam-toolbar {
            height : 5px;
            overflow-y : hidden;
        }
        /*
        body {
            position : relative;
        }
            */
    </style>

</head>
<body>

    <form id="form1" runat="server">
    <div class="container">

        <div class="wam-toolbar">
            <asp:DropDownList ID="boxbgcolor" runat="server" CssClass="form-control">
                <asp:ListItem Value="yellow">Yellow</asp:ListItem>
                <asp:ListItem Value="blue">Blue</asp:ListItem>
                <asp:ListItem Value="red">Red</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="boxfgcolor" runat="server" CssClass="form-control">
                <asp:ListItem Value="black">Black</asp:ListItem>
                <asp:ListItem Value="white">White</asp:ListItem>
                <asp:ListItem Value="yellow">Yellow</asp:ListItem>
                <asp:ListItem Value="blue">Blue</asp:ListItem>
                <asp:ListItem Value="red">Red</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="createBox" runat="server" CssClass="boxdeleteBtn btn btn-primary" Text="Create Box" OnClick="insertBox_Click" />
        </div>
        <div class="wam-hidden">
            <asp:TextBox ID="id" runat="server" CssClass="boxid"/>
            <asp:TextBox ID="content" runat="server" CssClass="boxcontent"/>
            <asp:TextBox ID="left" runat="server" CssClass="boxleft"/>
            <asp:TextBox ID="top" runat="server" CssClass="boxtop"/>
            <asp:TextBox ID="width" runat="server" CssClass="boxwidth"/>
            <asp:TextBox ID="height" runat="server" CssClass="boxheight"/>
            <asp:Button  ID="updateBox" runat="server" CssClass="boxupdate" Text="Update Box" OnClick="updateBox_Click" />
            <asp:Button  ID="deleteBox" runat="server" CssClass="boxdeleteBtn" Text="Delete Box" OnClick="deleteBox_Click" />
        </div>

        <asp:Repeater ID="DataList2" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div contenteditable="true" id="<%# Eval("Id") %>" class="box"
                    style="width:<%# Eval("width") %>px;height:<%# Eval("height") %>px;position:absolute;left:<%# Eval("left") %>px;top:<%# Eval("top") %>px;background-color:<%# Eval("bgColor") %>;color:<%# Eval("fgColor") %>;">
                    <%# Eval("content") %>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div class="boxdelete">&times;</div>

    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>"
            DeleteCommand="DELETE FROM [Box] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO [Box] ([width], [height], [top], [left], [bgColor], [fgColor], [content]) VALUES (@width, @height, @top, @left, @bgColor, @fgColor, @content)"
            ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>"
            SelectCommand="SELECT [Id], [width], [height], [top], [left], [bgColor], [fgColor], [content] FROM [Box]"
            UpdateCommand="UPDATE [Box] SET [content] = @content, [width] = @width, [height] = @height, [top] = @top, [left] = @left WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:FormParameter FormField="deleteBox" Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="width" Type="Int32" DefaultValue="100" />
                <asp:Parameter Name="height" Type="Int32" DefaultValue="100" />
                <asp:Parameter Name="top" Type="Int32" DefaultValue="100" />
                <asp:Parameter Name="left" Type="Int32" DefaultValue="100" />
                <asp:FormParameter FormField="boxbgcolor" Name="bgColor" Type="String" DefaultValue="yellow" />
                <asp:FormParameter FormField="boxfgcolor" Name="fgColor" Type="String" DefaultValue="black" />
                <asp:Parameter Name="content" Type="String" DefaultValue="Content" />
            </InsertParameters>
            <UpdateParameters>
                <asp:FormParameter FormField="content" Name="content" Type="String" />
                <asp:FormParameter FormField="width" Name="width" Type="Int32" />
                <asp:FormParameter FormField="height" Name="height" Type="Int32" />
                <asp:FormParameter FormField="top" Name="top" Type="Int32" />
                <asp:FormParameter FormField="left" Name="left" Type="Int32" />
                <asp:FormParameter FormField="id" Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>

    <script>
        var box = null;
        var boxdelete = null;
        $(function () {

            $(".wam-toolbar").hover(toolbarHoverOn, toolbarHoverOut);

            function toolbarHoverOn() {
                $(".wam-toolbar").animate({ "height": "200px" });
            }

            function toolbarHoverOut() {
                $(".wam-toolbar").animate({ "height": "5px" });
            }

            $(".box").draggable({
                grid: [5, 5],
                stop: updateBox
            }).resizable({
                handles: "n, e, s, w",
                grid : [5,5],
                stop: updateBox
            }).hover(hoverOn, hoverOut);

            boxdelete = $(".boxdelete").click(deleteBox);

            function deleteBox(event) {
                box = boxdelete.parent();
                var id = box.attr("id");

                $(".boxdeleteBtn").val(id);
                $(".boxdeleteBtn").click();
            }

            function updateBox(event) {
                var div = $(this);
                if (!div.hasClass("box")) {
                    div = $(event.currentTarget);
                }

                boxdelete
                    .appendTo("body")
                    .hide();

                var id = div.attr("id");
                var content = div.text();
                var position = div.position();
                var left = position.left;
                var top = position.top;
                var width = div.width();
                var height = div.height();
                console.log([left, top, width, height]);

                $(".boxid").val(id);
                $(".boxcontent").val(content);
                $(".boxleft").val(left);
                $(".boxtop").val(top);
                $(".boxwidth").val(width);
                $(".boxheight").val(height);
                $(".boxupdate").click();

            }
            function hoverOn(event) {
                box = $(this);
                box.focus();

                $(".box").css("z-index", 0);
                box.css("z-index", 1);

                boxdelete
                    .prependTo(box)
                    .show();
            }
            function hoverOut(event) {
                box = $(this);
                box.blur();

                updateBox(event);
            }

        });
    </script>

</body>
</html>
