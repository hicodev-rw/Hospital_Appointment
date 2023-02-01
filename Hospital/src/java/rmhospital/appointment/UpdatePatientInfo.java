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
 * Servlet implementation class UpdatePatientInfo
 */
//@WebServlet("/UpdatePatientInfo")
public class UpdatePatientInfo extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String patient_id = request.getParameter("patient_id");
		int id = Integer.parseInt(patient_id);
		String patientname = request.getParameter("patientname");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String add = request.getParameter("add");
		String phon = request.getParameter("phon");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String bgroup = request.getParameter("bgroup");

		try {
			Connection con = (Connection) ConnectionProvider.getCon();
			Statement st = con.createStatement();
			int updatePatientProfile = st.executeUpdate("update patient set patient_name='" + patientname + "',email='"
					+ email + "',password='" + pwd + "',address='" + add + "',phone='" + phon + "',sex='" + sex
					+ "',age='" + age + "',blood_group='" + bgroup + "' where patient_id='" + id + "'");
			if (updatePatientProfile > 0) {
				response.sendRedirect("updatePatientProfile.jsp");
			} else {
				response.sendRedirect("updatePatientProfile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
