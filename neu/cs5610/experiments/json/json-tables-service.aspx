<%@ Page Language="C#"%>
<%@ Import Namespace="edu.neu.ccis.jga.tables" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<%
    string tableName = Request.QueryString["tableName"];
    
    edu.neu.ccis.jga.tables.Table table = TableService.getTableByName(tableName);
    
    JavaScriptSerializer serializer = new JavaScriptSerializer();
    string json = serializer.Serialize(table);
    
    Response.Clear();
    Response.ContentType = "application/json; charset=utf-8";
    Response.Write(json);
    Response.End();
%>