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

		<!--- Header Start -------->
		<div class="row header">

			<div class="col-md-10">
                                     <a class="navbar-brand logo" href="#"> <img alt="logo"
src="images/logo.png">
</a>
			<h2>
			Rwanda Military Hospital
			</h2>
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
		<!--- Header Ends --------->
		<%
			if (session.getAttribute("adminuname") != null && session.getAttribute("adminuname") != "") {
		%>
		<%
			String id = request.getParameter("id");
				Patient p = PatientDao.getRecordById(Integer.parseInt(id));
		%>
		<div class="row">

			<!----- Menu Area Start ------>
			<div class="col-md-2 menucontent">

				<a href="#"><h1>Dashboard</h1></a>

				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="department.jsp">Department</a></li>
					<li role="presentation"><a href="doctor.jsp">Doctors</a></li>
					<li role="presentation"><a href="patients.jsp">Patients</a></li>
					<li role="presentation"><a href="nurse.jsp">Nurse</a></li>
					<li role="presentation"><a href="profile.jsp">Profile</a></li>
				</ul>
			</div>
			<!---- Menu Ares Ends  -------->
			<!---- Content Ares Start  -------->
			<div class="col-md-10 maincontent">
				<!----------------   Menu Tab   --------------->

				<div class="panel panel-default contentinside">
					<div class="panel-heading">Edit Patient Information</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">
							<li role="presentation"><a href="#adddoctor">Edit
									Patient Information</a></li>
						</ul>



						<!----------------   Display Patient Data List Ends  --------------->

						<!----------------   Add Patient Start   --------------->
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="editPatie.jsp"
										method="post">
										<div class="form-group">

											<div class="col-sm-4">
												<input type="hidden" class="form-control" name="patient_id"
													value="<%=p.getPatient_id()%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="patientname"
													placeholder="Name" value="<%=p.getPatientname()%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" name="email"
													placeholder="Email" value="<%=p.getEmail()%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="pwd"
													placeholder="Password" value="<%=p.getPwd()%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Address</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="add"
													placeholder="Address" value="<%=p.getAdd()%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="phon"
													placeholder="Phone No." value="<%=p.getPhon()%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Sex</label>
											<div class="col-sm-2">
												<select class="form-control" name="sex"
													value="<%=p.getSex()%>">
													<option>Male</option>
													<option>Female</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Age</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="age"
													placeholder="Age" value="<%=p.getAge()%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Blood Group</label>
											<div class="col-sm-2">
												<select class="form-control" name="bgroup" value="<%=p.getBgroup()%>">
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
													value="Update Patient Info">
											</div>
										</div>
									</form>

								</div>
							</div>
						</div>
						<!----------------   Add Patients Ends   --------------->
					</div>
					<!----------------   Panel body Ends   --------------->
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