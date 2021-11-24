<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="rmhospital.connection.*"%>
<%@ page import="rmhospital.bean.Patient"%>
<%@ page import="rmhospital.patient.*"%>
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
aria-expanded="false"><%=session.getAttribute("doctoruname")%> <span
class="caret"></span></a>
<ul class="dropdown-menu ">
<li><a href="logoutDoct.jsp">Logout</a></li>
</ul></li>
</ul>
</div>
</div>
<%
if (session.getAttribute("doctoruname") != null && session.getAttribute("doctoruname") != "") {
%>
<div class="row">
<div class="col-md-2 menucontent">
<h1>Dashboard</h1><hr/>
<ul class="nav nav-pills nav-stacked">
<li><a href="afterDoctorLogin.jsp">Appointment</a></li>
<li><a href="UpdateDoctorProfile.jsp">Profile</a></li>
</ul>
</div>
<div class="col-md-10 maincontent">
<div class="panel panel-default contentinside">
<div class="panel-heading">Edit Doctor Profile</div>
<div class="panel-body">
<ul class="nav nav-tabs doctor">
<li><a href="#adddoctor">
 Update Profile</a></li>
</ul>

<%
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from doctor where doc_name='" + session.getAttribute("doctoruname") + "'");
while (rs.next()) {
						%>

						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="UpdateDoctorInfo"
										method="post">
										<div class="form-group">

											<div class="col-sm-4">
												<input type="hidden" class="form-control" name="doctor_id"
													value="<%=rs.getInt(1)%>" >
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="doctorname"
													placeholder="Name" value="<%=rs.getString(2)%>"minlength="5"maxlength="30"required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" name="email"
													placeholder="Email" value="<%=rs.getString(3)%>"requred>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="pwd"
													placeholder="Password" value="<%=rs.getString(4)%>" minlength="8" maxlength="16"required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Address</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="add"
													placeholder="Address" value="<%=rs.getString(5)%>"minlength="5"maxlength="30"required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="phon"
													placeholder="Phone No." value="<%=rs.getString(6)%>"minlength="10"maxlength="12"required>
											</div>
										</div>
										

										<div class="form-group">
											<label class="col-sm-2 control-label">Department</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="department"
													placeholder="Age" value="<%=rs.getString(7)%>"minlength="5"maxlength="30"required>
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<input type="submit" class="btn btn-primary"
													value="Save Changes">
											</div>
										</div>
									</form>
									<%
										}
									%>

								</div>
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
			response.sendRedirect("doctorLogin.jsp");
		}
	%>
</body>
</html>l>