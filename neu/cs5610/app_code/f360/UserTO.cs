using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class UserTO
{
	public UserTO(){}
    public UserTO(string username, string password, string passwordValidation)
    {
        this.username = username;
        this.password = password;
        this.passwordValidation = passwordValidation;
    }
    public string username { set; get; }
    public string password { set; get; }
    public string passwordValidation { set; get; }
}