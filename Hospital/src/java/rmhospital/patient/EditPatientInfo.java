package rmhospital.patient;

import java.sql.Connection;
import java.sql.PreparedStatement;

import rmhospital.bean.Patient;
import rmhospital.connection.ConnectionProvider;

public class EditPatientInfo {
	public static int update(Patient p) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("update patient set patient_name=?,email=?,password=?,address=?,phone=?,sex=?,birthdate=?,age=?,blood_group=? where patient_id=?");
			ps.setString(1,p.getPatientname());
			ps.setString(2,p.getEmail());
			ps.setString(3,p.getPwd());
			ps.setString(4,p.getAdd());
			ps.setString(5, p.getPhon());
			ps.setString(6,p.getSex());
			ps.setString(7,p.getBdate());
			ps.setInt(8,p.getAge());
			ps.setString(9,p.getBgroup());
			ps.setInt(10, p.getPatient_id());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
