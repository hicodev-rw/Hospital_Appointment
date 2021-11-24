package rmhospital.department;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
import rmhospital.bean.Department;
import rmhospital.connection.ConnectionProvider;  
public class DepartmentDao {
	public static Department getRecordById(int id){  
	    Department d=null;  
	    try{  
	        Connection con=ConnectionProvider.getCon();
	        PreparedStatement ps=con.prepareStatement("select * from department where dept_id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            d=new Department(); 
	            d.setDept_id(rs.getInt("dept_id"));
	            d.setDeptName(rs.getString("dept_name"));
	            d.setDeptDesc(rs.getString("dept_description"));
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return d;  
	}  
}
