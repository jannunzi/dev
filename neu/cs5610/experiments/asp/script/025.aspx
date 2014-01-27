<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Goto Renderer</h1>

        <div class="row">
            <div class="col-sm-3">
                <h2>Top Connection</h2>

                <div class="wam-cb" id="10">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>

                <div class="wam-line-vertical-middle wam-height-50"></div>

                <div class="wam-cb wam-top" id="20">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>

                <div class="wam-line-vertical-middle wam-height-50"></div>

                <div class="wam-cb wam-top" id="30">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>

                <div class="wam-line-vertical-middle wam-height-50"></div>

                <div class="wam-cb wam-top" id="40">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
            </div>
        </div>

        <br />

        <rasala:FileView ID="fileView" runat="server" />

    </div>
    </form>
    <script>
        $(function () {
            gotoRenderer(30, 20);
            gotoRenderer(40, 10);
            gotoRenderer(40, 20);
            gotoRenderer(30, 10);
        });

        function gotoRenderer(from, to) {

            var state = $(this).data("gotoRendererState");
            if (typeof state === "undefined") {
                state = {level : 1};
                $(this).data("gotoRendererState", state);
            }

            fromDiv = $("#" + from);
            fromHeight = fromDiv.outerHeight();
            fromWidth = fromDiv.outerWidth();
            fromPosition = fromDiv.offset();
            fromLeft = fromPosition.left;
            fromTop = fromPosition.top;

            toDiv = $("#" + to);
            toHeight = toDiv.outerHeight();
            toWidth = toDiv.outerWidth();
            toPosition = toDiv.offset();
            toLeft = toPosition.left;
            toTop = toPosition.top;

            gotoDiv = $("<div>").
                css({
                    position: "absolute",
                    top : fromTop>toTop? toTop+toHeight/2 : fromTop+fromHeight/2,
                    left: fromLeft + fromWidth / 2,
                    height: Math.abs(fromTop - toTop),
                    width: fromWidth > toWidth ? fromWidth/2+state.level*50 : toWidth/2+state.level*50,
                    zIndex : -1
                }).addClass("wam-border-no-left");

            $("body").append(gotoDiv);

            toDiv.find(".wam-right").show();

            state.level++;
            $(this).data("gotoRendererState", state);
        }
    </script>
</body>
</html>
