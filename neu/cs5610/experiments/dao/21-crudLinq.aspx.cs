using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;


public partial class _04_crud : System.Web.UI.Page
{
    wam.VertexDAO dao = new wam.VertexDAO();

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

        wam.Vertex changedVertex = new wam.Vertex(Convert.ToInt32(id), newName, newLabel, Convert.ToInt32(newX), Convert.ToInt32(newY), Convert.ToInt32(newW), Convert.ToInt32(newH));

//        dao.update(changedVertex);
////      resultTxt.Text = dao.update(vertex);
//        resultTxt.Text = dao.update(id, newName, newLabel, newX, newY, newH, newW);
    }
    protected void delete_Click(object sender, EventArgs e)
    {
        string id = idTxt.Text;
   //     dao.delete(Convert.ToInt32(id));
    }
    protected void insert_Click(object sender, EventArgs e)
    {
        string name = nameTxt.Text;
        string label = labelTxt.Text;
        string x = xTxt.Text;
        string y = yTxt.Text;
        string width = widthTxt.Text;
        string height = heightTxt.Text;

        wam.Vertex vertex = new wam.Vertex(0, name, label, Convert.ToInt32(x), Convert.ToInt32(y), Convert.ToInt32(width), Convert.ToInt32(height));
//        vertex = dao.insert(vertex);

  //      resultTxt.Text += vertex.ToString() + "\n";
    }
    protected void selectById_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(idTxt.Text);
        /*
        wam.Vertex v = dao.selectById(id);
        resultTxt.Text += v + "\n";

        nameTxt.Text = v.name;
        labelTxt.Text = v.label;
        xTxt.Text = v.x + "";
        yTxt.Text = v.y + "";
        widthTxt.Text = v.width + "";
        heightTxt.Text = v.height + "";
         */
    }

    protected void selectAll_Click(object sender, EventArgs e)
    {
        /*
        ArrayList vertices = dao.selectAll();
        foreach (var v in vertices)
        {
            resultTxt.Text += v.ToString() +"\n";
        }
         * */
    }
}