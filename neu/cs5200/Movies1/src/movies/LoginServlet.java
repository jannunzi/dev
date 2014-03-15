package movies;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	RequestDispatcher dispatcher = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserManager userMgr = new UserManager();
		User user = new User(username, password, null, null);
		user = userMgr.validateUser(user);
		HttpSession session = request.getSession(true);
		if(user != null) {
			session.setAttribute("currentUser", user);
			dispatcher = request.getRequestDispatcher("profile.jsp");
			dispatcher.forward(request, response);
		} else {
			session.setAttribute("currentUser", null);
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
