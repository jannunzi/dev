<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void boxsave_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Update();
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
    </style>
</head>
<body>

    <form id="form1" runat="server">
    <div class="container">

        <h1>Save Content</h1>

        <div class="wam-hiddenf">
            <asp:TextBox ID="boxid"     runat="server" CssClass="boxid"/>
            <asp:TextBox ID="boxtop"    runat="server" CssClass="boxtop"/>
            <asp:TextBox ID="boxleft"   runat="server" CssClass="boxleft"/>
            <asp:TextBox ID="boxwidth"  runat="server" CssClass="boxwidth"/>
            <asp:TextBox ID="boxheight" runat="server" CssClass="boxheight"/>

            <!-- @new -->
            <asp:TextBox ID="boxcontent" runat="server" CssClass="boxcontent"/>

            <asp:Button  ID="boxsave" runat="server" CssClass="boxsave" Text="save" OnClick="boxsave_Click" />

        </div>

        <asp:Repeater ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div contenteditable="true" class="box" id="<%# Eval("Id") %>"
                    style='width:<%# Eval("width") %>px;height:<%# Eval("height") %>px;position:absolute;top:<%# Eval("top") %>px;left:<%# Eval("left") %>px;background-color:<%# Eval("bgColor") %>;color:<%# Eval("fgColor") %>;'>
                    <%# Eval("content") %>
                </div>
            </ItemTemplate>
        </asp:Repeater>


        <rasala:FileView ID="fileView" runat="server" />

    </div>

    <script>
        var textBefore = null;
        $(function () {

            $(".box").draggable({
                stop: updateDatabase
            }).resizable({
                stop: updateDatabase
            });

            // @new
            $(".box").hover(makeEditable, makeUneditable);
            function makeEditable(event) {
                textBefore = $(this).text().trim();

                $(this).focus();
            }
            function makeUneditable(event) {
                $(this).blur();
                var textAfter = $(this).text().trim();
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

                // @new
                var text = box.text().trim();
                $(".boxcontent").val(text);

                $(".boxsave").click();
            }
        });
    </script>

        <!-- @new added content -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>"
            DeleteCommand="DELETE FROM [Box] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO [Box] ([width], [height], [top], [left], [bgColor], [fgColor], [content]) VALUES (@width, @height, @top, @left, @bgColor, @fgColor, @content)"
            ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>"
            SelectCommand="SELECT [Id], [width], [height], [top], [left], [bgColor], [fgColor], [content] FROM [Box]"
            UpdateCommand="UPDATE [Box] SET [top] = @top, [left] = @left, [width]=@width, [height]=@height, [content]=@content WHERE [Id] = @Id">
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
