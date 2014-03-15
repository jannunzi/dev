<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5200.*,java.util.*" %>

<%
	UserManager uMgr = new UserManager();
	
	List<User> users = uMgr.selectAllUsers();
	for(User user : users) {
		out.println(user);
		out.println("<br/>");
	}
%>