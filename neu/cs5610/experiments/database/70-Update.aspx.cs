using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class experiments_database_70_DetailsView_Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DetailView_ItemUpdate(object sender,
        DetailsViewUpdatedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {
            Response.Redirect("70.aspx");
        }
    }
    protected void DetailView_ItemCommand(object sender,
        DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("70.aspx");
        }
    }
}