using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _03_update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void update_Click(object sender, EventArgs e)
    {
        string id = idTxt.Text;
        string newName = newNameTxt.Text;

        String sql = "UPDATE Vertex SET name='"+newName+"' WHERE Id=" + id + ";";

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

//http://stackoverflow.com/questions/8339107/prepared-statement-in-asp-net-c-sharp-when-using-sql-server