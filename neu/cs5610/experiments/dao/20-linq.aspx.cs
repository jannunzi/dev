using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _20_linq : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void getProducts_Click(object sender, EventArgs e)
    {
        /*
        using (var db = new ProductsDataContext())
        {
            var products = db.Products.Take(100);
            foreach (var p in products)
            {
                resultTxt.Text += p.name + " $" + p.price + " " + p.description;
            }
        }
         * */
    }
}