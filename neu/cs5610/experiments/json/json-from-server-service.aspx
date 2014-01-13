<%@ Page Language="C#"%>

<%
    string json = "{\"first\": \"John\", \"last\": \"Doe\", \"dob\": \"11/22/68\"}";
    Response.Clear();
    Response.ContentType = "application/json; charset=utf-8";
    Response.Write(json);
    Response.End();
%>