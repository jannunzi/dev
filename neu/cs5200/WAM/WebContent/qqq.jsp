<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="qqq.*,java.util.*"%>

<%
	DevMgr mgr = new DevMgr();
	out.println(mgr);
	
	out.println("<br/>");
	
	List<Developer> devs = mgr.readAll();
//	out.println(devs);
	
	for(Developer dev : devs) {
		out.println(dev);
		out.println("<br/>");
	}
%>