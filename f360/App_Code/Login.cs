using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Login
/// </summary>
public class Login
{
	public Login()
	{
	}
    public Login(string username, string password)
    {
        this.username = username;
        this.password = password;
    }
    public string username;
    public string password;
}