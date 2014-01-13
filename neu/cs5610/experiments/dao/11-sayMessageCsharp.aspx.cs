using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using wam;

public partial class _10_sayHelloCsharp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void sayHello_Click(object sender, EventArgs e)
    {
        VertexDAO dao = new VertexDAO();
        string message = messageTxt.Text;
//        outputTxt.Text = dao.sayHelloMessage(message);
    }
}