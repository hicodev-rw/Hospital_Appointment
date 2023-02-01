package rmhospital.doctor;

import rmhospital.connection.ConnectionProvider;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

/**
 * Servlet implementation class DeleteDoctor
 */
@WebServlet("/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sid = request.getParameter("docId");
		int id = Integer.parseInt(sid);
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			int deleteRecord = st.executeUpdate("delete from doctor where doctor_id='" + id + "'");
			if (deleteRecord > 0) {
				response.sendRedirect("doctor.jsp");
			} else {
				response.sendRedirect("doctor.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
