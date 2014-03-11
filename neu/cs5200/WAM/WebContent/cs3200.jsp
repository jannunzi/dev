<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="cs3200.*,java.util.*"
    %>

<%
	DeveloperManager mgr = new DeveloperManager();
	out.println(mgr);
	
	out.println("<br/>");
	
	Developer json = new Developer("Jason", "Statham", 10000000f);
	
	mgr.insertDeveloper(json);
	
	mgr.removeByLastName("Statham");
	
	mgr.giveEveryoneBonus(3000.0f);
	
	List<Developer> devs = mgr.readAllDevelopers();
	out.println(devs);

	out.println("<h1>Developers in Order</h1>");
	
	for(Developer dev : devs) {
		out.println(dev);
		out.println("<br/>");
	}

	out.println("<h1>Developers in Reverse Order</h1>");

	devs = mgr.readDevelopersReverse();
	
	for(Developer dev : devs) {
		out.println(dev);
		out.println("<br/>");
	}
%>