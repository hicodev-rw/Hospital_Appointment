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

		<!-- Header -->
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
						aria-expanded="false"><%=session.getAttribute("patientuname")%> <span
							class="caret"></span></a>
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
					<li><a href="updatePatientProfile.jsp">Update Profile</a></li>
					<li><a href="viewAppointment.jsp">View Appointment</a></li>
				</ul>
			</div>
			
			
			<div class="col-md-10 maincontent">
				<!--  Menu -->

				<div class="panel panel-default contentinside">
					<div class="panel-heading">Edit Patient Information</div>
					
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">
							<li><a href="#adddoctor">Click Here to Edit
									Patient Information</a></li>
						</ul>



						
						<%
								Connection con = ConnectionProvider.getCon();
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select * from patient where patient_name='" + session.getAttribute("patientuname") + "'");
								while (rs.next()) {
						%>
						
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="UpdatePatientInfo"
										method="post">
										<div class="form-group">

											<div class="col-sm-4">
												<input type="hidden" class="form-control" name="patient_id"
													value="<%=rs.getInt(1)%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="patientname"
													placeholder="Name" value="<%=rs.getString(2)%>"minlength="5" maxlength="30" required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" name="email"
													placeholder="Email" value="<%=rs.getString(3)%>"required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="pwd"
													placeholder="Password" value="<%=rs.getString(4)%>"minlength="8" maxlength="16" required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Address</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="add"
													placeholder="Address" value="<%=rs.getString(5)%>"minlength="3" maxlength="30" required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="phon"
													placeholder="Phone No." value="<%=rs.getString(6)%>"minlength="10" maxlength="12" required>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Sex</label>
											<div class="col-sm-2">
												<select class="form-control" name="sex"
                                                                                                        value="<%=rs.getString(7)%>" required>
													<option>Male</option>
													<option>Female</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Age</label>
											<div class="col-sm-10">
												<input type="number" class="form-control" name="age"
													placeholder="Age" value="<%=rs.getInt(9)%>"minlength="1" maxlength="3" required>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Blood Group</label>
											<div class="col-sm-2">
												<select class="form-control" name="bgroup"
													value="<%=rs.getString(10)%>"required>
													<option>A<sup>+</sup></option>
													<option>A<sup>-</sup></option>
													<option>B<sup>+</sup></option>
													<option>B<sup>-</sup></option>
													<option>AB<sup>+</sup></option>
													<option>AB<sup>-</sup></option>
													<option>O<sup>+</sup></option>
													<option>O<sup>-</sup></option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<input type="submit" class="btn btn-primary"
													value="Save changes">
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
			response.sendRedirect("patientLogin.jsp");
		}
	%>
</body>
</html>