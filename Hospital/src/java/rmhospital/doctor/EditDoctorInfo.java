package rmhospital.doctor;

import java.sql.Connection;
import java.sql.PreparedStatement;

import rmhospital.bean.Doctor;
import rmhospital.connection.ConnectionProvider;

public class EditDoctorInfo {
	public static int update(Doctor d) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("update doctor set doc_name=?,email=?,password=?,address=?,phone=?,department=? where doctor_id=?");
			ps.setString(1, d.getDoctname());
			ps.setString(2, d.getEmail());
			ps.setString(3, d.getPwd());
			ps.setString(4, d.getAdd());
			ps.setString(5, d.getPhon());
			ps.setString(6, d.getDept());
			ps.setInt(7, d.getDoctor_id());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
