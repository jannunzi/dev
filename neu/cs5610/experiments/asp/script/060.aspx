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
            width: 75%;
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">


        <div class="row">
            <div class="col-sm-4">
        <h1>Edit Connected Box</h1>
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
                                <button name="update" value="<%= counter %>" class="btn btn-primary btn-sm pull-right">&#10004;</button>
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
                        string gotoParam = value.Substring(parenOpenIndex+1,
                            parenCloseIndex - parenOpenIndex - 1);
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
                                <input placeholder="Type Here" type="text" id="0" name="wam-new-line" autofocus="autofocus" class="wam-width-200 wam-no-borders wam-shadow-border" /><button class="btn btn-success btn-sm pull-right">&#10004;</button>
                            </div>
                        </div>
                </li>
           </ul>
            </div>
            <div class="col-sm-1">

            </div>
            <div class="col-sm-7">
                <h1>Documentation</h1>

                <p> In this experiment we add the ability of editing individual script statements.
                    We'll add an update button to each of the statements that will resubmit the form
                    with any updates we might have made to the statements.
                </p>

                <h2>HTML</h2>

                <pre>
&lt;button
    name=&quot;update&quot;
    value=&quot;&lt;%= counter %&gt;&quot;
    class=&quot;btn btn-primary btn-sm pull-right&quot;&gt;&amp;#10004;
&lt;/button&gt;</pre>
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
