package rmhospital.department;

import java.sql.Connection;
import java.sql.PreparedStatement;

import rmhospital.bean.*;
import rmhospital.connection.ConnectionProvider;

public class AddDepartment {
	public static int register(Department d) {
		int status = 0;
		int id = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("insert into department values(?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, d.getDeptName());
			ps.setString(3, d.getDeptDesc());
			status = ps.executeUpdate();
		} catch (Exception e) {
		}

		return status;
	}

}
