<%@ Page Language="C#"%>
<%@ Import Namespace="edu.neu.ccis.jga" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<%
    string json = "{\"name\":\"Joe\"}";
    Response.Clear();
    Response.ContentType = "application/json; charset=utf-8";
    Response.Write(json);
    Response.End();
%>