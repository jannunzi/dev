using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;
using wam;

public partial class _04_crud : System.Web.UI.Page
{
    VertexDAO dao = new VertexDAO();

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

//        resultTxt.Text = dao.update(id, newName, newLabel, newX, newY, newH, newW);
    }
    protected void delete_Click(object sender, EventArgs e)
    {
        string id = idTxt.Text;
//        resultTxt.Text = dao.delete(id);
    }
    protected void insert_Click(object sender, EventArgs e)
    {
        string name = nameTxt.Text;
        string label = labelTxt.Text;
        string x = xTxt.Text;
        string y = yTxt.Text;
        string width = widthTxt.Text;
        string height = heightTxt.Text;

//        resultTxt.Text = dao.insert(name, label, x, y, width, height);
    }
    protected void selectById_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(idTxt.Text);
//        wam.Vertex v = dao.selectById(id);
//        resultTxt.Text += v;
    }

    protected void selectAll_Click(object sender, EventArgs e)
    {
//        ArrayList vertices = dao.selectAll();
        string result = "";
//        foreach (Vertex v in vertices)
//            result += v + "\n";
//        resultTxt.Text = result;
    }

}