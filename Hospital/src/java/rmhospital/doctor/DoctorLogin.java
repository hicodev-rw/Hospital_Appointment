package rmhospital.doctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rmhospital.connection.ConnectionProvider;

/**
 * Servlet implementation class DoctorLogin
 */
@WebServlet("/DoctorLogin")
public class DoctorLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			HttpSession hs = request.getSession();
			Connection con = ConnectionProvider.getCon();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select doc_name,password,doctor_id from doctor where email='" + email + "'and password='" + password + "'");
			if (rs.next()) {
				hs.setAttribute("doctoruname", rs.getString(1));
				hs.setAttribute("doctor_id",rs.getInt(3));
				response.sendRedirect("afterDoctorLogin.jsp");
			} 
                        else {
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
