<%@ Page Language="C#"%>
<%@ Import Namespace="edu.neu.ccis.jga" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<%
    Person john = new Person("John", "Doe", new DateTime(1968,11,22));
    
    JavaScriptSerializer serializer = new JavaScriptSerializer();
    string json = serializer.Serialize(john);
    
    Response.Clear();
    Response.ContentType = "application/json; charset=utf-8";
    Response.Write(json);
    Response.End();
%>