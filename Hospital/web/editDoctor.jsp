<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="rmhospital.connection.*"%>
<%@ page import="rmhospital.bean.Doctor"%>
<%@ page import="rmhospital.doctor.*"%>
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
		<%
			String id = request.getParameter("id");
				Doctor d = DoctorDao.getRecordById(Integer.parseInt(id));
		%>
		<div class="row">

			<div class="col-md-2 menucontent">

				<h1>Dashboard</h1><hr/>

				<ul class="nav nav-pills nav-stacked">
					<li><a href="department.jsp">Department</a></li>
					<li><a href="doctor.jsp">Doctors</a></li>
					<li><a href="patients.jsp">Patients</a></li>
					<li><a href="nurse.jsp">Nurse</a></li>
					<li><a href="profile.jsp">Profile</a></li>
				</ul>
			</div>
			<!--- Contents--->
			<div class="col-md-10 maincontent">
				
				<div class="panel panel-default contentinside">
					<div class="panel-heading">Edit Doctor Info</div>
					
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">
							<li role="presentation"><a href="#adddoctor">Click Here
									To Edit Doctor Infomation</a></li>
						</ul>
						
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="editDoc.jsp" method="post">
										<div class="form-group">
											<label class="col-sm-2 control-label">Doctor Id</label>
											<div class="col-sm-10">
												<input type="number" class="form-control" name="doctor_id"
													placeholder="Doctor ID" value="<%=d.getDoctor_id()%>"
													readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="doctname"
													placeholder="Name" required="required"
													value="<%=d.getDoctname()%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" name="email"
													placeholder="Email" required="required"
													value="<%=d.getEmail()%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="pwd"
													placeholder="Password" required="required"
													value="<%=d.getPwd()%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Address</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="add"
													placeholder="Address" required="required"
													value="<%=d.getAdd()%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="phon"
													placeholder="Phone No." required="required"
													value="<%=d.getPhon()%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Department</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="dept"
													placeholder="Phone No." required="required"
													value="<%=d.getDept()%>">
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<input type="submit" class="btn btn-primary"
													value="Save Changes">
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