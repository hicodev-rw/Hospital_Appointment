package rmhospital.appointment;

import rmhospital.connection.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

/**
 * Servlet implementation class UpdateDoctorInfo
 */
//@WebServlet("/UpdateDoctorInfo")
public class UpdateDoctorInfo extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String doctor_id = request.getParameter("doctor_id");
		int id = Integer.parseInt(doctor_id);
		String doctorname = request.getParameter("doctorname");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String add = request.getParameter("add");
		String phon = request.getParameter("phon");
		String department = request.getParameter("department");

		try {
			Connection con = (Connection) ConnectionProvider.getCon();
			Statement st = con.createStatement();
			int updatePatientProfile = st.executeUpdate("update doctor set doc_name='" + doctorname + "',email='"
					+ email + "',password='" + pwd + "',address='" + add + "',phone='" + phon + "',department='"
					+ department + "' where doctor_id='" + id + "'");
			if (updatePatientProfile > 0) {
				response.sendRedirect("UpdateDoctorProfile.jsp");
			} else {
				response.sendRedirect("UpdateDoctorProfile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
