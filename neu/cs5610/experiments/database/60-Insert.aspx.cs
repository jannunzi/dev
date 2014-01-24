using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class experiments_database_00 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DetailView_ItemInsert(object sender,
        DetailsViewInsertedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {
            Response.Redirect("60.aspx");
        }
    }
    protected void DetailView_ItemCommand(object sender,
        DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("60.aspx");
        }
    }
}