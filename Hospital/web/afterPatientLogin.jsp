<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="rmhospital.connection.*"%>
<%@ page import="rmhospital.bean.Appointment"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="images/logo.png" rel="icon" />
<title>Rwanda Military Hospital</title>
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
						aria-expanded="false"> <%
 	out.print((String) session.getAttribute("patientuname"));
 %> <span class="caret"></span>
					</a>
						<ul class="dropdown-menu ">


							<li><a href="logoutPat.jsp">Logout</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
		
		<%
			if (session.getAttribute("patientuname") != null && session.getAttribute("patientuname") != "") {
		%>

		<div class="row">

			
			<div class="col-md-2 menucontent">

				<h1>Dashboard</h1><hr/>

				<ul class="nav nav-pills nav-stacked">
					<li><a href="afterPatientLogin.jsp">Book
							An Appointment</a></li>
					<li><a href="updatePatientProfile.jsp">Update
							Profile</a></li>
					<li><a href="viewAppointment.jsp">View
							Appointment</a></li>
					
				</ul>
			</div>
			

			
			<div class="col-md-10 maincontent">

				
				<div class="panel panel-default contentinside">
					<div class="panel-heading">Book An Appointment</div>

					
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">


							<li><a href="#doctorlist">Doctor
									List</a></li>
							<li><a href="#adddoctor">Book An
									Appointment</a></li>
						</ul>


						


						




						
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="appointmentProcess.jsp"
										method="post">
										<div class="form-group">
											<label class="col-sm-4 control-label">Name</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="name"
													placeholder="Name"minlength="5"maxlength="30"required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Email</label>
											<div class="col-sm-4">
												<input type="email" class="form-control" name="email"
													placeholder="Email..."required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Contact</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="contact"
													placeholder="Contact..." minlength="5"maxlength="30"required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Age</label>
											<div class="col-sm-4">
												<input type="number" class="form-control" name="age"
													placeholder="Age..."minlength="1"maxlength="3"required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Day</label>
											<div class="col-sm-4">
												<input type="date" class="form-control" name="day"
													placeholder="Day..."required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Speciality</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="speciality"
													placeholder="Speciality..."minlength="5"maxlength="30"required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Description</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="description"
													placeholder="Description..."minlength="10"maxlength="100"required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Doctor Id</label>
											<div class="col-sm-4">
												<input type="number" class="form-control" name="id"
													placeholder="Doctor Id...">
											</div>
										</div>



										<div class="form-group">
											<div class="col-sm-offset-4 col-sm-10">
												<button type="submit" class="btn btn-primary">Book
													Appointment</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						
						<div id="doctorlist" class="switchgroup">
							<table class="table table-bordered table-hover">
								<tr class="active">
									<td>Doctor ID</td>
									<td>Doctor Name</td>
									<td>Department</td>
									<td>Email</td>

								</tr>
								<%
									int docId = 0;
										Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select * from doctor");
										while (rs.next()) {
											docId = rs.getInt(1);
											session.setAttribute("docId", docId);
								%>

								<tr>
									<td><input type="text" name="did" style="width:40px;"
										value="<%=rs.getInt(1)%>" class="form-control"readonly></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(7)%></td>
									<td><%=rs.getString(3)%></td>
								</tr>

								<%
									}
								%>

							</table>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
		<script src="js/bootstrap.min.js"></script>
		<%
			} else {
				response.sendRedirect("patientLogin.jsp");
			}
		%>
	
</body>
</html>