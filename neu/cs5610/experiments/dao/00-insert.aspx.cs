using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _00_insert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        string name = nameTxt.Text;
        string label = labelTxt.Text;
        string x = xTxt.Text;
        string y = yTxt.Text;
        string width = widthTxt.Text;
        string height = heightTxt.Text;

        String sql = "INSERT INTO Vertex(name, label, x, y, width, height) values ('" + name + "', '" + label + "', " + x + ", " + y + ", " + width + ", " + height + ")";

        sqlTxt.Text = sql;
        sqlTxt.Rows = 5;

        string connString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\Jose\\Documents\\WAM.mdf;Integrated Security=True;Connect Timeout=30";
        SqlConnection conn = new SqlConnection(connString);
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = sql;
        cmd.Connection = conn;
        cmd.ExecuteNonQuery();

        conn.Close();
    }
}