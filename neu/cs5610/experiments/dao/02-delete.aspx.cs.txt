using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _02_delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void delete_Click(object sender, EventArgs e)
    {
        string id = idTxt.Text;

        String sql = "DELETE FROM Vertex WHERE Id=" + id + ";";

        string connString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\Jose\\Documents\\WAM.mdf;Integrated Security=True;Connect Timeout=30";
        SqlConnection conn = new SqlConnection(connString);
        conn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = sql;
        cmd.Connection = conn;
        int result = cmd.ExecuteNonQuery();
        resultTxt.Text = result+"";

        conn.Close();
    }
}