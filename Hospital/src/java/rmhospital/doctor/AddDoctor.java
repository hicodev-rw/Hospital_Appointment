package rmhospital.doctor;

import java.sql.Connection;
import java.sql.PreparedStatement;

import rmhospital.bean.Department;
import rmhospital.bean.Doctor;
import rmhospital.connection.ConnectionProvider;

public class AddDoctor {
	public static int register(Doctor d) {
		int status = 0;
		int id = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("insert into doctor values(?,?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, d.getDoctname());
			ps.setString(3, d.getEmail());
			ps.setString(4, d.getPwd());
			ps.setString(5, d.getAdd());
			ps.setString(6, d.getPhon());
			ps.setString(7, d.getDept());
			status = ps.executeUpdate();
		} catch (Exception e) {
		}

		return status;
	}
}
