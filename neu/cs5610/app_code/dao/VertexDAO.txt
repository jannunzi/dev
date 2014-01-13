using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;
using wam;

namespace wam
{
    public class VertexDAO
    {
        VertexLinqDataContext db = new VertexLinqDataContext();
        public VertexDAO() {}
        public ArrayList selectAll()
        {
            var vertexRows = db.WAM_VERTEXes.Take(100);
            ArrayList vertices = new ArrayList();
            foreach (var v in vertexRows)
            {
                wam.Vertex vertex = new wam.Vertex((int)v.Id, v.name, v.label, (int)v.x, (int)v.y, (int)v.width, (int)v.height);
                vertices.Add(vertex);
            }
            return vertices;
        }
        public wam.Vertex selectById(int id)
        {
            var v = db.WAM_VERTEXes.FirstOrDefault(i => i.Id == id);
            wam.Vertex vertex = new wam.Vertex((int)v.Id, v.name, v.label, (int)v.x, (int)v.y, (int)v.width, (int)v.height);
            return vertex;
        }
        public string insert(string name, string label, string x, string y, string width, string height)
        {
            return "deprecated";
        }
        public Vertex insert(Vertex vertex)
        {
            WAM_VERTEX v = new WAM_VERTEX
            {
                name = vertex.name,
                label = vertex.label,
                x = vertex.x,
                y = vertex.y,
                width = vertex.width,
                height = vertex.height
            };
            db.WAM_VERTEXes.InsertOnSubmit(v);

            db.SubmitChanges();

            vertex.id = v.Id;

            return vertex;
        }
        public string delete(string id)
        {
            return "deprecated";
        }
        public void delete(int id)
        {
            WAM_VERTEX v = db.WAM_VERTEXes.FirstOrDefault(i => i.Id == id);
            db.WAM_VERTEXes.DeleteOnSubmit(v);
            db.SubmitChanges();
        }
        public string update(string id, string newName, string newLabel, string newX, string newY, string newH, string newW)
        {
            return "deprecated";
        }
        public void update(Vertex vertex)
        {
            WAM_VERTEX v = db.WAM_VERTEXes.FirstOrDefault(i => i.Id == vertex.id);
            v.name = vertex.name;
            v.label = vertex.label;
            v.width = vertex.width;
            v.height = vertex.height;
            v.x = vertex.x;
            v.y = vertex.y;

            db.SubmitChanges();
        }
        public string sayHelloMessage(string message)
        {
            return "hello " + message;
        }
        public string sayHello()
        {
            return "hello";
        }
        public string selectAllAsString()
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
    }
}