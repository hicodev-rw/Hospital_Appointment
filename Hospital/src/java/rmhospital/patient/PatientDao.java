package rmhospital.patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import rmhospital.bean.Patient;
import rmhospital.connection.ConnectionProvider;

public class PatientDao {
	public static Patient getRecordById(int id) {
		Patient p= null;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("select * from patient where patient_id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new Patient();
				p.setPatient_id(rs.getInt("patient_id"));
				p.setPatientname(rs.getString("patient_name"));
				p.setEmail(rs.getString("email"));
				p.setPwd(rs.getString("password"));
				p.setAdd(rs.getString("address"));
				p.setPhon(rs.getString("phone"));
				p.setSex(rs.getString("sex"));
				p.setBdate(rs.getString("birthdate"));
				p.setAge(rs.getInt("age"));
				p.setBgroup(rs.getString("blood_group"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}
}
