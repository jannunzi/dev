using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _04_crud : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void update_Click(object sender, EventArgs e)
    {
        string id = idTxt.Text;
        string newName = nameTxt.Text;
        string newLabel = labelTxt.Text;
        string newX = xTxt.Text;
        string newY = yTxt.Text;
        string newW = widthTxt.Text;
        string newH = heightTxt.Text;

        String sql = "UPDATE Vertex SET name='" + newName + "', label='" + newLabel + "', x=" + newX + ", y=" + newY + ", height=" + newH + ", width=" + newW + " WHERE Id=" + id + ";";

        string connString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\Jose\\Documents\\WAM.mdf;Integrated Security=True;Connect Timeout=30";
        SqlConnection conn = new SqlConnection(connString);
        conn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = sql;
        cmd.Connection = conn;
        int result = cmd.ExecuteNonQuery();
        resultTxt.Text = result + "";

        conn.Close();
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
        resultTxt.Text = result + "";

        conn.Close();
    }
    protected void insert_Click(object sender, EventArgs e)
    {
        string name = nameTxt.Text;// Request.QueryString["name"];
        string label = labelTxt.Text;//Request.QueryString["label"];
        string x = xTxt.Text;//Request.QueryString["top"];
        string y = yTxt.Text;//Request.QueryString["left"];
        string width = widthTxt.Text;//Request.QueryString["width"];
        string height = heightTxt.Text;//Request.QueryString["height"];

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
    protected void selectById_Click(object sender, EventArgs e)
    {
        string id = idTxt.Text;
        string connectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\Jose\\Documents\\WAM.mdf;Integrated Security=True;Connect Timeout=30";
        string queryString = "SELECT * FROM Vertex WHERE Id=" + id + ";";
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        string result = "";
        if (reader.Read())
        {
            string name = (string)reader["name"];
            int idInt = (int)reader["id"];
            int xInt = (int)reader["x"];
            int yInt = (int)reader["y"];
            int widthInt = (int)reader["width"];
            int heightInt = (int)reader["height"];
            result += idInt + ", " + name + "\n";

            idTxt.Text = idInt + "";
            nameTxt.Text = (string)reader["name"];
            labelTxt.Text = (string)reader["label"];
            xTxt.Text = xInt + "";
            yTxt.Text = yInt + "";
            widthTxt.Text = widthInt + "";
            heightTxt.Text = heightInt + "";
        
        }
        resultTxt.Text = result;
    }

    protected void selectAll_Click(object sender, EventArgs e)
    {
        string connectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\Jose\\Documents\\WAM.mdf;Integrated Security=True;Connect Timeout=30";
        string queryString = "SELECT * FROM Vertex;";
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        string result = "";
        while (reader.Read())
        {
            string name = (string)reader["name"];
            string label = (string)reader["label"];
            int idInt = (int)reader["id"];
            int xInt = (int)reader["x"];
            int yInt = (int)reader["y"];
            int widthInt = (int)reader["width"];
            int heightInt = (int)reader["height"];

            result += idInt + ", " + name + ", " + label + ", " + xInt + ", " + yInt + ", " + widthInt + ", " + heightInt + "\n";
        }
        resultTxt.Text = result;
    }

}