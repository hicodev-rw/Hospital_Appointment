package rmhospital.appointment;
import rmhospital.connection.ConnectionProvider;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

/**
 * Servlet implementation class CancelAppointment
 */
public class CancelAppointment extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String apid = request.getParameter("apid");
		int id = Integer.parseInt(apid);
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			int cancelAppointment = st.executeUpdate("delete from appointment where apid='" + id + "'");
			if (cancelAppointment > 0) {
				response.sendRedirect("viewAppointment.jsp");
			} else {
				response.sendRedirect("viewAppointment.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
