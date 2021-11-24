package rmhospital.appointment;
import rmhospital.connection.ConnectionProvider;
import java.sql.*;
import rmhospital.bean.Appointment;
public class BookAppointment {
	public static int register(Appointment a) {
	int status = 0;
	int ApId=0;
	try {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("insert into appointment values(?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1,ApId);
		ps.setString(2,a.getName());
		ps.setString(3,a.getEmail());
		ps.setString(4,a.getContact());
		ps.setString(5,a.getAge());
		ps.setString(6,a.getDay());
		ps.setString(7, a.getSpeciality());
		ps.setString(8,a.getDescription());
		ps.setInt(9,a.getId());
                ps.setString(10,"Pending");
		status=ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return status;
}
}