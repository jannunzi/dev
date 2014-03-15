<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs3200.*,java.util.*"%>

<%
	UserManager mgr = new UserManager();
	out.println(mgr);
	
	out.println("<br/>");
	
	mgr.deleteUser("user3");
		
	out.println("<br/>");
	
	List<User> users = mgr.readAllUsers();
	for(User user : users) {
		out.println(user);
		out.println("<br/>");
	}
%>