package rmhospital.user;

import java.sql.*;

import rmhospital.bean.User;
import rmhospital.connection.ConnectionProvider;

public class RegisterDao {

	public static int register(User u) {
		int status = 0;
		int id = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, u.getName());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getAddress());
			ps.setString(5, u.getPhone());
			ps.setString(6, u.getPassword());

			status = ps.executeUpdate();
		} catch (Exception e) {
		}

		return status;
	}

}
