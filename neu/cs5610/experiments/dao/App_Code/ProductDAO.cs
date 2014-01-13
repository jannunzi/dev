using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductDAO
/// </summary>
public class ProductDAO
{
	public ProductDAO()
	{
        using (var db = new ProductsDataContext())
        {
            var products = db.Products.Take(100);
            foreach (var p in products)
                Console.WriteLine(p.name);
        }
	}
}