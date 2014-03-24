<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="jdbchw.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Hello World</h1>
<%
	BookManager bm = new BookManager();
//	Book book = new Book(123, "The Lord");
	//bm.createBook(book);
	
	List<Book> books = bm.listAllBooks();
	for(Book b : books) {
		out.println(b.getTitle());
	}
%>
</body>
</html>