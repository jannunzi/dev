<%@ Page Language="C#" %>

<%@ Import Namespace="edu.neu.ccis.rasala" %>

<script runat="server">

    static string validchars = "^[A-Za-z0-9_]+$";
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/plain";
        Response.Write("");
        
        string key = RequestTools.Query(Request);

        if (StringTools.IsTrivial(key))
            return;

        bool valid = Regex.IsMatch(key, validchars,
            RegexOptions.IgnoreCase);

        if (!valid)
        {
            // Response.Write("Regex Failure");
            return;
        }
        
        string secret = KeyTools.GetKey(this, key);
        
        Response.Write(secret);
    }

</script>