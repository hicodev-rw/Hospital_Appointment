package rmhospital.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import rmhospital.connection.ConnectionProvider;

/**
 * Servlet implementation class UpdateUserDao
 */
@WebServlet("/UpdateUserDao")
public class UpdateUserDao extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUserDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		HttpSession session = request.getSession();
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			int update = st.executeUpdate("update user set name='" + name + "' , email='" + email + "' , address='"
					+ address + "' , phone='" + phone + "' where name='" + session.getAttribute("uname") + "'");
			if (update > 0) {
				response.sendRedirect("UserProfileUpdateSuccessfully.jsp");
			} else {
				response.sendRedirect("profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
