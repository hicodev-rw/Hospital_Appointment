package rmhospital.department;

import java.sql.*;
import rmhospital.bean.Department;
import rmhospital.connection.ConnectionProvider;

public class EditDepartmentInformation {
	public static int update(Department d) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("update department set dept_name=?,dept_description=? where dept_id=?");
			ps.setString(1, d.getDeptName());
			ps.setString(2, d.getDeptDesc());
			ps.setInt(3, d.getDept_id());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

}
