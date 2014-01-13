using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class examples_asp_08_ReadDirectories : System.Web.UI.Page
{
    protected DirectoryInfo directory = null;
    protected FileInfo[] files = null;
    protected DirectoryInfo[] directories = null;
    protected string basePath = "";
    protected string paramPath = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        basePath = "~\\wam\\";
        paramPath = Request.QueryString["path"];
        if (paramPath == null)
            paramPath = "";
        string path = basePath + paramPath;
        string mappedPath = Server.MapPath(path);
        directory = new DirectoryInfo(mappedPath);

        string deleteParam = Request.QueryString["delete"];
        if (deleteParam != null)
        {
            if (deleteParam.EndsWith("/"))
                Directory.Delete(mappedPath + deleteParam);
            else
                File.Delete(mappedPath + "\\" + deleteParam);
        }

        // new {
        string renameParam = Request.QueryString["rename"];
        string newName = name.Text;
        System.Diagnostics.Debug.WriteLine(renameParam);
        System.Diagnostics.Debug.WriteLine(newName);
        if (renameParam != null && newName != null && !newName.Equals(""))
        {
            System.Diagnostics.Debug.WriteLine(newName);
            System.Diagnostics.Debug.WriteLine(mappedPath + newName);
            if (renameParam.EndsWith("/"))
                Directory.Move(mappedPath + renameParam, mappedPath + newName);
            else
                File.Move(mappedPath + "\\" + renameParam, mappedPath + "\\" + newName);
        }
        // } new

        files = directory.GetFiles();
        directories = directory.GetDirectories();
    }
}