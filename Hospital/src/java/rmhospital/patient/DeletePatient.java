package rmhospital.patient;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rmhospital.connection.ConnectionProvider;

/**
 * Servlet implementation class DeletePatient
 */
@WebServlet("/DeletePatient")
public class DeletePatient extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sid = request.getParameter("pid");
		int id = Integer.parseInt(sid);
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			int deleteRecord = st.executeUpdate("delete from patient where patient_id='" + id + "'");
			if (deleteRecord > 0) {
				response.sendRedirect("patients.jsp");
			} else {
				response.sendRedirect("patients.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
