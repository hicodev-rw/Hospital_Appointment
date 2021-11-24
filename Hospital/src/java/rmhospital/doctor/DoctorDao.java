package rmhospital.doctor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import rmhospital.bean.Doctor;
import rmhospital.connection.ConnectionProvider;

public class DoctorDao {
	public static Doctor getRecordById(int id) {
		Doctor d = null;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("select * from doctor where doctor_id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Doctor();
				d.setDoctor_id(rs.getInt("doctor_id"));
				d.setDoctname(rs.getString("doc_name"));
				d.setEmail(rs.getString("email"));
				d.setPwd(rs.getString("password"));
				d.setAdd(rs.getString("address"));
				d.setPhon(rs.getString("phone"));
				d.setDept(rs.getString("department"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return d;
	}
}
