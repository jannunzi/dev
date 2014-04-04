<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="edu.neu.db.http.*,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="flickrhash.jsp">
	<input name="search"/>
	<button>Search</button>
</form>

<%
	String search = request.getParameter("search");

	if(search != null && !search.equals(""))
	{

	FlickrClient client = new FlickrClient();
	Rsp resp = client.search(search);
	List<Photo> photos = resp.photos.photo;
	for(Photo photo : photos)
	{
		String imgUrl = "http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}_m.jpg";
		imgUrl = imgUrl.replace("{farm-id}", photo.farm);
		imgUrl = imgUrl.replace("{server-id}", photo.server);
		imgUrl = imgUrl.replace("{id}", photo.id);
		imgUrl = imgUrl.replace("{secret}", photo.secret);
		imgUrl = imgUrl.replace("{farm-id}", photo.farm);
		%>
<img src="<%= imgUrl %>" height="100"/>		
		
		<%
	}
	}
%>
<script src="js/jquery.js"></script>
<script src="js/jquery.ba-bbq.js"></script>
<script>
	$(function(){
		$(window).hashchange(handleHashChange);
		handleHashChange();
	});
	
	function handleHashChange() {
		var search = $.bbq.getState("search1");
		console.log(search);
		console.log(jQuery.deparam.querystring());
	}
</script>
</body>
</html>