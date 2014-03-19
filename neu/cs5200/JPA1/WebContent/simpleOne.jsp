<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="jpa.sqlfirst.simple.*,java.util.*"%>

<%
	SimpleOne one = new SimpleOne();
	one.setName("sdf");
	one.setDate(Calendar.getInstance().getTime());
	
	SimpleOneDao dao = new SimpleOneDao();
	dao.create(one);
%>