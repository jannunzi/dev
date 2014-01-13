using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class examples_asp_04_SimpleForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        firstNameLabel.Text = firstNameInput.Text;
        lastNameLabel.Text = lastNameInput.Text;
        dobLabel.Text = dobInput.TodaysDate.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
    }
}