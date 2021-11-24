package rmhospital.patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import rmhospital.bean.Patient;
import rmhospital.connection.ConnectionProvider;
public class AddPatient {
	public static int register(Patient p) {
		int status = 0;
		int id = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("insert into patient values(?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, p.getPatientname());
			ps.setString(3, p.getEmail());
			ps.setString(4, p.getPwd());
			ps.setString(5, p.getAdd());
			ps.setString(6, p.getPhon());
			ps.setString(7, p.getSex());
			ps.setString(8, p.getBdate());
			ps.setInt(9, p.getAge());
			ps.setString(10, p.getBgroup());
			status = ps.executeUpdate();
		} catch (Exception e) {
		}

		return status;
	}
}
