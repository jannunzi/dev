<%@ page import="java.sql.*,test.*,java.util.*" %>

<%
	DeveloperManager mgr = new DeveloperManager();

	Developer newDeveloper = new Developer(123, "Jason", "Statham", 1234432);
	
//	mgr.insertWhileSelecting(newDeveloper);

	mgr.deleteWithResultSet("Statham");

	List<Developer> devs = mgr.listAllDevelopers();
	for(Developer dev : devs) {
		out.println(dev);
		out.println("<br/>");
	}
	out.println("<br/>");
	
	devs = mgr.listAllDevelopersReverse();
	for(Developer dev : devs) {
		out.println(dev);
		out.println("<br/>");
	}
	out.println("<br/>");
	
	devs = mgr.giveRaiseToEveryone(100.0f);
	for(Developer dev : devs) {
		out.println(dev);
		out.println("<br/>");
	}
	out.println("<br/>");
	
	ApplicationManager aMgr = new ApplicationManager();
	List<Application> apps = aMgr.listAllApplications();
	for(Application app : apps) {
		out.println(app);
		out.println("<br/>");
	}
	
%>