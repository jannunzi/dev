<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.db.http.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="client.jsp">
	<input name="search"/>
	<button>Search</button>
</form>
<%
	String search = request.getParameter("search");
	if(search != null && !search.equals(""))
	{
		search = search.replaceAll(" ", ",");
		FlickrClient client = new FlickrClient();
		Rsp rsp = client.search(search);
		List<Photo> photos = rsp.photos.photo;
		if(photos != null)
		{
			for(Photo photo:photos)
			{
				String src=photo.getSrc();
			%>
				<img src="<%= src %>" title="<%=photo.title%>" height="100"/>
			<%
			}
		}
		
	}
%>
</body>
</html>