using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class examples_asp_07_TestEnvironment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void run_Click(object sender, EventArgs e)
    {
        output.Text += "Hello World\n";
    }
    protected void clear_Click(object sender, EventArgs e)
    {
        output.Text = "";
    }
}