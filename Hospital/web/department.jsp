<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="rmhospital.connection.*"%>
<%@ page import="rmhospital.bean.Department"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="images/logo.png" rel="icon" />
<title>Online Hospital Management System</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script type="text/javascript">
    //to switch tabs
	$(document).ready(function() {

		$('#doctorlist').show();
		$('.doctor li:first-child a').addClass('active');
		$('.doctor li a').click(function(e) {

			var tabDiv = this.hash;
			$('.doctor li a').removeClass('active');
			$(this).addClass('.active');
			$('.switchgroup').hide();
			$(tabDiv).fadeIn();
			e.preventDefault();

		});

	});
</script>
</head>
<body>
<div class="container-fluid">
<div class="row header">
<div class="col-md-10">
<a class="navbar-brand logo" href="#"> <img alt="Brand"
src="images/logo.png">
</a>
<div class="navbar-text title">
<p>
Rwanda Military Hospital 
</p>
</div>
</div>
<div class="col-md-2 ">
<ul class="nav nav-pills ">
<li class="dropdown dmenu"><a href="#" class="dropdown-toggle"
data-toggle="dropdown" role="button" aria-haspopup="true"
aria-expanded="false"><%=session.getAttribute("adminuname")%> <span
class="caret"></span></a>
<ul class="dropdown-menu ">
<li><a href="logout.jsp">Logout</a></li>
</ul></li>
</ul>
</div>
</div>
		<%
			if (session.getAttribute("adminuname") != null && session.getAttribute("adminuname") != "") {
		%>
<div class="row">
<div class="col-md-2 menucontent">
<h1>Dashboard</h1><hr/>
<ul class="nav nav-pills nav-stacked">
<li><a href="department.jsp">Department</a></li>
<li><a href="doctor.jsp">Doctors</a></li>
<li><a href="patients.jsp">Patients</a></li>
<li><a href="user_register.jsp">User Registration</a></li>
<li><a href="profile.jsp">Profile</a></li>
</ul>
</div>
<div class="col-md-10 maincontent">
<div class="panel panel-default contentinside">
<div class="panel-heading">Departments</div>
<div class="panel-body">
<ul class="nav nav-tabs doctor">
<li><a href="#doctorlist">Department List</a></li>
<li><a href="#adddoctor">Add Department</a></li>
						</ul>
						<div id="doctorlist" class="switchgroup">
							<table class="table table-bordered table-hover">
								<tr class="active">
                                                                    <td>Dep Id</td>
									<td>Department Name</td>
									<td>Department Description</td>
									<td>Options</td>
								</tr>
								<%
									int deptId = 0;
                                                                        
										Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select * from department");
										while (rs.next()) {
											deptId = rs.getInt(1);
											session.setAttribute("deptId", deptId);
								%>
								<form action="DeleteServlet" method="post">
									<tr>
							<td><input type="text" name="did"value="<%=rs.getInt(1)%>" class="form-control" style="width:40px;"readonly></td>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(3)%></td>
										<td><a href="editDepartment.jsp?id=<%=rs.getInt(1)%>" class="btn btn-primary"
											data-toggle="modal">Edit
										</a> <input type="submit" class="btn btn-danger" value="Delete"
											class="glyphicon glyphicon-trash" aria-hidden="true">

										</td>
									</tr>
								</form>
								<%
									}
								%>

							</table>
						</div>

						<!-- Edit Department -->


						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">

							<div class="modal-dialog" role="document">
								<div class="modal-content">


									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Edit Department
											Information</h4>
									</div>

									<div class="modal-body">
										<div class="panel panel-default">
											<div class="panel-body">
												<%
													ResultSet resultset = st.executeQuery(
																"select * from department where dept_id='" + session.getAttribute("deptId") + "'");
														while (resultset.next()) {
												%>
												<form class="form-horizontal" action="#">

													<div class="form-group">
														<label class="col-sm-4 control-label">Department
															ID</label>
														<div class="col-sm-4">
															<input type="number" class="form-control" name="deptId"
																value="<%=session.getAttribute("deptId")%>"
																readonly="readonly">
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4 control-label">Department
															Name</label>
														<div class="col-sm-4">
															<input type="text" class="form-control" name="deptName"
																value="<%=resultset.getString(2)%>" required>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4 control-label">Department
															Description</label>
														<div class="col-sm-4">
															<input type="text" class="form-control" name="deptDesc"
																value="<%=resultset.getString(3)%>" required>
														</div>
													</div>
													<%
														}
													%>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
														<input type="submit" class="btn btn-primary"
															value="Update">
														</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						




						<!--   Add Department -->
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="departmentProcess.jsp"
										method="post">
										<div class="form-group">
											<label class="col-sm-4 control-label">Department Name</label>
											<div class="col-sm-4">
                                                                                            <input type="text" class="form-control" name="deptName" minlength="3" maxlength="30" required
													>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Department
												Description</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="deptDesc" minlength="3" maxlength="100" required
													>
											</div>
										</div>


										<div class="form-group">
											<div class="col-sm-offset-4 col-sm-10">
												<button type="submit" class="btn btn-primary">Add
													Department</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						
					</div>
					
				</div>
				
			</div>
			
		</div>
		<script src="js/bootstrap.min.js"></script>
		<%
			} else {
				response.sendRedirect("index.jsp");
			}
		%>
	
</body>
</html>