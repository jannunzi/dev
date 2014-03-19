<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs3200.*,java.util.*"%>

<form action="user.jsp">

<%
	UserDao dao = new UserDao();

	String action = request.getParameter("action");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	User newUser = new User(username, password);
	
	if("create".equals(action)) {
		dao.createUser(newUser);
	} else if("delete".equals(action)) {
		dao.deleteUser(username);
	}

	List<User> users = dao.readAllUsers();
%>	<ol>
<%
	for(User user : users) {
%>		<li><%= user %>
			<a href="user.jsp?action=delete&username=<%= user.getUsername() %>">Delete</a>
		</li>
<%	}
%>	</ol>

	<input name="username"/>
	<input name="password"/>
	<button name="action" value="create">Create</button>
	
	<br/>
	
</form>
