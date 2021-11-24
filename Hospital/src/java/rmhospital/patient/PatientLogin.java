package rmhospital.patient;

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
 * Servlet implementation class PatientLogin
 */
@WebServlet("/PatientLogin")
public class PatientLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			HttpSession hs = request.getSession();
			Connection con = ConnectionProvider.getCon();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select patient_name,password from patient where email='" + email + "'and password='" + password + "'");
			if (rs.next()) {
				hs.setAttribute("patientuname", rs.getString(1));
				response.sendRedirect("afterPatientLogin.jsp");
			} else {
				response.sendRedirect("patientLogin.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
