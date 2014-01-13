using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;

namespace version0
{
    public class VertexDAO
    {
        public VertexDAO()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public ArrayList selectAllAsArrayList()
        {
            string connectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\Jose\\Documents\\WAM.mdf;Integrated Security=True;Connect Timeout=30";
            string queryString = "SELECT * FROM Vertex;";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(queryString, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            ArrayList vertices = new ArrayList();
            while (reader.Read())
            {
                string name = (string)reader["name"];
                string label = (string)reader["label"];
                int idInt = (int)reader["id"];
                int xInt = (int)reader["x"];
                int yInt = (int)reader["y"];
                int widthInt = (int)reader["width"];
                int heightInt = (int)reader["height"];
                wam.Vertex v = new wam.Vertex(idInt, name, label, xInt, yInt, widthInt, heightInt);
                vertices.Add(v);
            }
            connection.Close();

            return vertices;
        }
        public string selectAll()
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
            connection.Close();

            return result;
        }
        //  public Vertex selectById(string id)
        public string selectById(string id)
        {
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
                string label = (string)reader["name"];
                int idInt = (int)reader["id"];
                int xInt = (int)reader["x"];
                int yInt = (int)reader["y"];
                int widthInt = (int)reader["width"];
                int heightInt = (int)reader["height"];
                result += idInt + ", " + name + ", " + label + ", " + xInt + ", " + yInt + ", " + widthInt + ", " + heightInt + "\n";
            }
            connection.Close();

            return result;
        }
        //  public Vertex insert(Vertex vertex)
        public string insert(string name, string label, string x, string y, string width, string height)
        {
            String sql = "INSERT INTO Vertex(name, label, x, y, width, height) values ('" + name + "', '" + label + "', " + x + ", " + y + ", " + width + ", " + height + ")";

            String sqlTxt = sql;

            string connString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\Jose\\Documents\\WAM.mdf;Integrated Security=True;Connect Timeout=30";
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = sql;
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();

            conn.Close();

            return sqlTxt;
        }
        //  public boolean delete(string id)
        public string delete(string id)
        {
            String sql = "DELETE FROM Vertex WHERE Id=" + id + ";";

            string connString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\Jose\\Documents\\WAM.mdf;Integrated Security=True;Connect Timeout=30";
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = sql;
            cmd.Connection = conn;
            int result = cmd.ExecuteNonQuery();
            conn.Close();

            return result + "";
        }
        //  public boolean update(Vertex vertex)
        public string update(string id, string newName, string newLabel, string newX, string newY, string newH, string newW)
        {
            String sql = "UPDATE Vertex SET name='" + newName + "', label='" + newLabel + "', x=" + newX + ", y=" + newY + ", height=" + newH + ", width=" + newW + " WHERE Id=" + id + ";";

            string connString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=C:\\Users\\Jose\\Documents\\WAM.mdf;Integrated Security=True;Connect Timeout=30";
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = sql;
            cmd.Connection = conn;
            int result = cmd.ExecuteNonQuery();
            conn.Close();

            return result + "";
        }
        public string sayHelloMessage(string message)
        {
            return "hello " + message;
        }
        public string sayHello()
        {
            return "hello";
        }
    }
}