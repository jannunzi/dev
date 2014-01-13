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

        // new {
        string deleteParam = Request.QueryString["delete"];
        if (deleteParam != null)
        {
            System.Diagnostics.Debug.WriteLine(deleteParam);
            System.Diagnostics.Debug.WriteLine(mappedPath + deleteParam);
            if(deleteParam.EndsWith("/"))
                Directory.Delete(mappedPath + deleteParam);
            else
                File.Delete(mappedPath + "\\" + deleteParam);
        }
        // } new

        files = directory.GetFiles();
        directories = directory.GetDirectories();
    }
}