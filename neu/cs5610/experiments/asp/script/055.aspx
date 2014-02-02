<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected string rawUrl;
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
    <script src="../../../javascript/wam.js"></script>
    <style>
        ul.wam-script {
            padding : 0px;
        }
        ul.wam-script input[type=text] {
            width: 85%;
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">


        <div class="row">
            <div class="col-sm-4">

            <h1>Goto</h1>

           <ul class="wam-no-bullets wam-script">
        <% int counter = 0;
           ArrayList gotoFrom = new ArrayList();
           ArrayList gotoTo   = new ArrayList();
           string delete = Request.Params["delete"];
           foreach(object param in Request.Params) {
               if (param.ToString().StartsWith("wam")) {
                   string value = Request.Params[param.ToString()];
                   if (value == "" || value.Length == 0)
                   {
                       continue;
                   }
                   if ((counter + "") != delete) {
        %>         <li>
                        <div class="wam-cb wam-top" id="<%= counter %>">
                            <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                            <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                            <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                            <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                            <div class="wam-content">
                                <%= counter %> <input class="wam-width-200 wam-shadow-border wam-no-borders" type="text" name="wam-<%= counter %>" value="<%= value %>"/>
                                <button name="delete" value="<%= counter %>" class="btn btn-danger btn-sm pull-right">&times;</button>
                            </div>
                        </div>

                        <div class="wam-line-vertical-middle wam-height-50"></div>
                    </li>
        <%          if (value.Contains("goto"))
                    {
                        int gotoIndex = value.IndexOf("goto");
                        int parenOpenIndex = value.IndexOf("(", gotoIndex);
                        int parenCloseIndex = value.IndexOf(")", gotoIndex);
                        string gotoParam = value.Substring(parenOpenIndex+1, parenCloseIndex - parenOpenIndex - 1);
                        gotoFrom.Add(counter + "");
                        gotoTo.Add(gotoParam);
                    }
                    counter++;
                   }
                   else
                   {
                       delete = "";
                   }
                   
               }
           }
        %>     <li>
                        <div class="wam-cb wam-top" id="-1">
                            <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                            <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                            <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                            <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                            <div class="wam-content">
                                <input placeholder="Type Here" type="text" id="0" name="wam-new-line" autofocus="autofocus" class="wam-width-200 wam-no-borders wam-shadow-border" /><button class="btn btn-success btn-sm pull-right">&plus;</button>
                            </div>
                        </div>
                </li>
           </ul>
            </div>
            <div class="col-sm-1"></div>
            <div class="col-sm-7">

                <h1>Documentation</h1>

                <h2>ASP</h2>

                <p> Using ASP we iterate over the parameters looking for goto commands.
                    If we find one we parse the goto label and store it in a gotoTo array list.
                    We also store the current line where we found the goto command in the
                    gotoFrom array list.
                </p>

                <pre>
ArrayList gotoFrom = new ArrayList();
ArrayList gotoTo   = new ArrayList();
foreach(object param in Request.Params) {
    if (param.ToString().StartsWith("wam")) {
        string value = Request.Params[param.ToString()];
        ...
        if (value.Contains("goto"))
        {
            int gotoIndex = value.IndexOf("goto");
            int parenOpenIndex = value.IndexOf("(", gotoIndex);
            int parenCloseIndex = value.IndexOf(")", gotoIndex);
            string gotoParam = value.Substring(parenOpenIndex+1,
                    parenCloseIndex - parenOpenIndex - 1);
            gotoFrom.Add(counter + "");
            gotoTo.Add(gotoParam);
        }
    }
}</pre>

                <h2>JavaScript</h2>

                <p> Now that we know what gotos we need to render, we'll iterate over
                    them and render each one at a time. We will use the JavaScript
                    we used earlier to draw the gotos
                </p>

                <pre>
&lt;script&gt;
    $(function () {
        &lt;%
    for (int i = 0; i &lt; gotoFrom.Count; i++ )
    {
        string from = gotoFrom[i].ToString();
        string to = gotoTo[i].ToString();
    %&gt;
        gotoRenderer(&lt;%= from %&gt;, &lt;%= to %&gt;);
    &lt;%
    }
    %&gt;
    });
&lt;/script&gt;</pre>
            </div>
        </div>

        <rasala:FileView ID="fileView" runat="server" />

    <script>
        $(function () {
            <%
        for (int i = 0; i < gotoFrom.Count; i++ )
        {
            string from = gotoFrom[i].ToString();
            string to = gotoTo[i].ToString();
        %>
            gotoRenderer(<%= from %>, <%= to %>);
        <%
        }
        %>
        });
    </script>

        </div>
    </form>
</body>
</html>
