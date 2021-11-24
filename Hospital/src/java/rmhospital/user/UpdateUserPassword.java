package rmhospital.user;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rmhospital.connection.ConnectionProvider;
import java.sql.*;

/**
 * Servlet implementation class UpdateUserPassword
 */
@WebServlet("/UpdateUserPassword")
public class UpdateUserPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUserPassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String passwordChange = request.getParameter("newpwd");
		try {
			HttpSession session = request.getSession();
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			int updatePassword = st.executeUpdate("update user set password='" + passwordChange + "' where name='"+ session.getAttribute("uname") + "'");
			if (updatePassword > 0) {
				response.sendRedirect("UserProfileUpdateSuccessfully.jsp");
			} else {
				response.sendRedirect("UserProfileUpdateSuccessfully.jsp");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
