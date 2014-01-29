<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script src="../../../javascript/wam.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">

        <h1>Goto Renderer Generalization</h1>

        <div class="row">
            <div class="col-sm-3">

                <h2>Script</h2>

                <div class="wam-script">

                </div>
            </div>

            <div class="col-sm-3">

            </div>

            <div class="col-sm-6">

                <h2>HTML</h2>

                <pre>
&lt;div class=&quot;wam-script&quot;&gt;

&lt;/div&gt;</pre>

                <h2>JavaScript</h2>

                <pre>
$(function () {
    renderBox(10, &quot;Content 10&quot;);
    renderDownArrow();
    renderBox(20, &quot;Content 20&quot;);
    renderDownArrow();
    renderBox(30, &quot;Content 30&quot;);
    renderDownArrow();
    renderBox(40, &quot;Content 40&quot;);

    gotoRenderer(30, 20);
    gotoRenderer(40, 10);
});</pre>

            </div>

        </div>

        <div class="row">
            <div class="col-lg-12">
                <h2>Render Box and Render Arrow Functions</h2>
                <pre>
function renderBox(id, content) {
    var html = &apos;&lt;div class=&quot;wam-cb wam-top&quot; id=&quot;40&quot;&gt;&apos; +
        &apos;&lt;div class=&quot;wam-left&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9658;&lt;/span&gt;&lt;/div&gt;&apos; +
        &apos;&lt;div class=&quot;wam-bottom&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9650&lt;/span&gt;&lt;/div&gt;&apos; +
        &apos;&lt;div class=&quot;wam-top&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9660;&lt;/span&gt;&lt;/div&gt;&apos; +
        &apos;&lt;div class=&quot;wam-right&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9668;&lt;/span&gt;&lt;/div&gt;&apos; +
        &apos;&lt;div class=&quot;wam-content&quot;&gt;&apos; +
        &apos;Text&apos; +
        &apos;&lt;/div&gt;&apos; +
        &apos;&lt;/div&gt;&apos;;
    var dom = $(html);
    dom.attr(&quot;id&quot;, id);
    dom.find(&quot;.wam-content&quot;).html(content);

    var scriptDom = $(&quot;.wam-script&quot;);
    scriptDom.append(dom);
}

function renderDownArrow() {
    var html = &apos;&lt;div class=&quot;wam-line-vertical-middle wam-height-50&quot;&gt;&lt;/div&gt;&apos;;
    var dom = $(html);

    var scriptDom = $(&quot;.wam-script&quot;);
    scriptDom.append(dom);
}</pre>
            </div>
        </div>

        <br />

        <rasala:FileView ID="fileView" runat="server" />

    </div>
    </form>
    <script>
        $(function () {
            renderBox(10, "Content 10");
            renderDownArrow();
            renderBox(20, "Content 20");
            renderDownArrow();
            renderBox(30, "Content 30");
            renderDownArrow();
            renderBox(40, "Content 40");

            gotoRenderer(30, 20);
            gotoRenderer(40, 10);
        });
    </script>
</body>
</html>
