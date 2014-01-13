using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _01_selectOne : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void select_Click(object sender, EventArgs e)
    {
        string id = idTxt.Text;
        string connectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\Jose\\Documents\\WAM.mdf;Integrated Security=True;Connect Timeout=30";
        string queryString = "SELECT * FROM Vertex WHERE Id="+id+";";
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        string result = "";
        if (reader.Read())
        {
            string name = (string)reader["name"];
            int idInt = (int)reader["id"];
            result += idInt + ", " + name + "\n";
        }
        resultTxt.Text = result;
    }
}