<%@ Page Language="C#"%>
<%@ Import Namespace="edu.neu.ccis.jga.forms" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<%
    Form form = FormService.getFormByName("test");
    
    JavaScriptSerializer serializer = new JavaScriptSerializer();
    string json = serializer.Serialize(form);
    
    Response.Clear();
    Response.ContentType = "application/json; charset=utf-8";
    Response.Write(json);
    Response.End();
%>