<%@ page import="edu.neu.cs5200.mongo.*, edu.neu.cs5200.model.*, com.mongodb.*, java.util.*" %>

<h1>Insert Document Form</h1>

<form action="06-insertDocumentForm.jsp">
	First: <input name="first" value="<%= request.getParameter("first") %>"/><br/>
	Last:  <input name="last" value="<%= request.getParameter("last") %>"/><br/>
	Age:   <input name="age" type="number" value="<%= request.getParameter("age") %>"/><br/>
	<button name="insert" type="submit">Insert</button>
</form>
<%
	String first  = (String)request.getParameter("first");
	String last   = (String)request.getParameter("last");
	String ageStr = (String)request.getParameter("age");
	if(first != null && !first.equals("")) {
		int age = Integer.parseInt(ageStr);
		InsertDocumentParams.insert(first, last, age);
	}
%>
