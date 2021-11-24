package rmhospital.appointment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rmhospital.connection.ConnectionProvider;

/**
 * Servlet implementation class DeleteAppointment
 */
@WebServlet("/DeleteAppointment")
public class DeleteAppointment extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String apid = request.getParameter("apid");
                String del=request.getParameter("delete");
                String acc=request.getParameter("accept");
                String reject=request.getParameter("reject");
		int id = Integer.parseInt(apid);
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
                if(del!=null){
			int cancelAppointment = st.executeUpdate("delete from appointment where apid='" + id + "'");
			if (cancelAppointment > 0) {
				response.sendRedirect("afterDoctorLogin.jsp");
			
                        } else {
				response.sendRedirect("afterDoctorLogin.jsp");
			}
		        }
                if(acc!=null)
                {
                    String q="update appointment set status=? where apid=" +id;
                    PreparedStatement stmt=con.prepareStatement(q);
			stmt.setString(1,"Accepted");
                        int updated=stmt.executeUpdate();
                        if (updated > 0) {
				response.sendRedirect("afterDoctorLogin.jsp");
			} else {
				response.sendRedirect("afterDoctorLogin.jsp");
			}
		        }  
                       if(reject!=null)
                {
                    String q="update appointment set status=? where apid=" +id;
                    PreparedStatement stmt=con.prepareStatement(q);
			stmt.setString(1,"Rejected");
                        int rejected=stmt.executeUpdate();
                        if (rejected > 0) {
				response.sendRedirect("afterDoctorLogin.jsp");
			} else {
				response.sendRedirect("afterDoctorLogin.jsp");
			}
		        } 
                }
                
                        catch (Exception e) {
			e.printStackTrace();
		}
	}

}
