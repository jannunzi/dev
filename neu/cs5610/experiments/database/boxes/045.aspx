<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void BoxUpdate(object sender, EventArgs e)
    {
        SqlDataSource1.Update();
    }

    protected void BoxDelete(object sender, EventArgs e)
    {
        SqlDataSource1.Delete();
    }

    // @new
    protected void BoxCreate(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
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

        .boxdelete {
            cursor : pointer;
            z-index : 1;
            float : right;
            position:relative;
            right:5px;
        }

    </style>
</head>
<body>

    <form id="form1" runat="server">
    <div class="container">

        <h1>Create Box</h1>

        <div class="wam-hidden">
            <asp:TextBox ID="boxid"      runat="server" CssClass="boxid"/>
            <asp:TextBox ID="boxtop"     runat="server" CssClass="boxtop"/>
            <asp:TextBox ID="boxleft"    runat="server" CssClass="boxleft"/>
            <asp:TextBox ID="boxwidth"   runat="server" CssClass="boxwidth"/>
            <asp:TextBox ID="boxheight"  runat="server" CssClass="boxheight"/>
            <asp:TextBox ID="boxcontent" runat="server" CssClass="boxcontent"/>

            <asp:Button  ID="boxsave" runat="server" CssClass="boxsave" Text="save" OnClick="BoxUpdate" />
            <asp:Button  ID="boxdelete" runat="server" CssClass="boxdeleteBtn" Text="delete" OnClick="BoxDelete" />

        </div>

        <!-- @new insert -->
        <asp:Button  ID="boxcreate" runat="server" CssClass="boxcreateBtn btn btn-primary" Text="create" OnClick="BoxCreate" />

        <asp:Repeater ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div contenteditable="true" class="box" id="<%# Eval("Id") %>"
                    style='width:<%# Eval("width") %>px;height:<%# Eval("height") %>px;position:absolute;top:<%# Eval("top") %>px;left:<%# Eval("left") %>px;background-color:<%# Eval("bgColor") %>;color:<%# Eval("fgColor") %>;'>
                    <%# Eval("content") %>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div class="boxdelete wam-hidden">&times;</div>

        <rasala:FileView ID="fileView" runat="server" />

    </div>

    <script>

        var box = null;

        var textBefore = null;
        $(function () {

            $(".box").draggable({
                stop: updateDatabase,
                grid : [5,5]
            }).resizable({
                stop: updateDatabase,
                grid: [5, 5]
            });

            boxdelete = $(".boxdelete");
            $("body").on("click", ".boxdelete", deleteBox);
            boxdelete = $(".boxdelete");
            function deleteBox() {
                boxdelete
                    .appendTo("body")
                    .hide();
                var id = box.attr("id");
                box.remove();
                $(".boxdeleteBtn")
                    .val(id)
                    .click();
            }

            $(".box").hover(makeEditable, makeUneditable);
            function makeEditable(event) {
                box = $(this)
                textBefore = box.text().trim();
                box.focus();

                boxdelete
                    .prependTo(box)
                    .show();
            }
            function makeUneditable(event) {

                boxdelete
                    .prependTo("body")
                    .hide();

                box.blur();
                var textAfter = box.text().trim();
                $(".boxcontent").val(textAfter);

                if (textBefore != textAfter) {
                    updateDatabase(event);
                }
            }

            function updateDatabase(event) {

                var box = $(event.currentTarget);
                if (!box.hasClass("box")) {
                    box = $(this);
                }

                var id = box.attr("id");
                $(".boxid").val(id);

                var position = box.position();
                $(".boxtop").val(position.top);
                $(".boxleft").val(position.left);
                $(".boxwidth").val(box.width());
                $(".boxheight").val(box.height());

                boxdelete
                    .prependTo("body")
                    .hide();

                var text = box.text().trim();
                $(".boxcontent").val(text);

                $(".boxsave").click();
            }
        });
    </script>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>"
            DeleteCommand="DELETE FROM [Box] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO [Box] ([width], [height], [top], [left], [bgColor], [fgColor], [content]) VALUES (@width, @height, @top, @left, @bgColor, @fgColor, @content)"
            ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>"
            SelectCommand="SELECT [Id], [width], [height], [top], [left], [bgColor], [fgColor], [content] FROM [Box]"
            UpdateCommand="UPDATE [Box] SET [top] = @top, [left] = @left, [width]=@width, [height]=@height, [content]=@content WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:FormParameter FormField="boxdelete" Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="width" Type="Int32" DefaultValue="100" />
                <asp:Parameter Name="height" Type="Int32" DefaultValue="100" />
                <asp:Parameter Name="top" Type="Int32" DefaultValue="100"/>
                <asp:Parameter Name="left" Type="Int32" DefaultValue="100"/>
                <asp:Parameter Name="bgColor" Type="String" DefaultValue="lightgray"/>
                <asp:Parameter Name="fgColor" Type="String" DefaultValue="black"/>
                <asp:Parameter Name="content" Type="String" DefaultValue="Content"/>
            </InsertParameters>
            <UpdateParameters>
                <asp:FormParameter FormField="boxcontent"  Name="content" Type="String" />
                <asp:FormParameter FormField="boxwidth"  Name="width" Type="Int32" />
                <asp:FormParameter FormField="boxheight" Name="height" Type="Int32" />
                <asp:FormParameter FormField="boxtop"  Name="top" Type="Int32" />
                <asp:FormParameter FormField="boxleft" Name="left" Type="Int32" />
                <asp:FormParameter FormField="boxid"   Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </form>

    </body>
</html>
