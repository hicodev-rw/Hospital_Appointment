<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="rmhospital.connection.*"%>
<%@ page import="rmhospital.bean.Patient"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

		<!-- Menu -->
		<div class="col-md-2 menucontent">

		<h1>Dashboard</h1>
                <hr/>

		<ul class="nav nav-pills nav-stacked">
		<li><a href="department.jsp">Department</a></li>
		<li><a href="doctor.jsp">Doctors</a></li>
		<li><a href="patients.jsp">Patients</a></li>
		
		
		<li><a href="profile.jsp">Profile</a></li>
		</ul>
			</div>
	
			<!-- Contents Ares -->
			<div class="col-md-10 maincontent">
			<!----------------   Menu Tab   --------------->

			<div class="panel panel-default contentinside">
			<div class="panel-heading">Manage Patient</div>
			<!--  Panel body -->
			<div class="panel-body">
			<ul class="nav nav-tabs doctor">
			<li><a href="#doctorlist">Patient List</a></li>
			<li><a href="#adddoctor">Add Patient</a></li>
			</ul>


			<!-- Patients Data  --------------->
			<div id="doctorlist" class="switchgroup">
			<table class="table table-bordered table-hover">
			<tr class="active">
			<td>Patient Id</td>
			<td>Patient Name</td>
			<td>Age</td>
			<td>Sex</td>
			<td>Blood Group</td>
			<td>Action</td>

			</tr>
			<%
				Connection con = ConnectionProvider.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from patient");
				while (rs.next()) {
				%>
				<form action="DeletePatient" method="post">
				<tr>
                                    <td><input type="text" name="pid"value="<%=rs.getInt(1)%>" class="form-control" style="width:40px;"readonly></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(10)%></td>
				<td><a href="editPatients.jsp?id=<%=rs.getInt(1)%>" class="btn btn-primary">Edit</a>
				<input type="submit" class="btn btn-danger" value="Delete"
				class="glyphicon glyphicon-trash" aria-hidden="true">
				</td>
				</tr>
					</form>
					<%
						}
					%>
							</table>
						</div>
		<!-- Add Patient -->
		<div id="adddoctor" class="switchgroup">
		<div class="panel panel-default">
		<div class="panel-body">
		<form class="form-horizontal" action="patientProcess.jsp" method="post">
		<div class="form-group">
		<label class="col-sm-2 control-label">Name</label>
		<div class="col-sm-10">
                    <input type="text" class="form-control" name="patientname"minlength="5"maxlength="30" required>
		</div>
		</div>
	<div class="form-group">
	<label class="col-sm-2 control-label">Email</label>
	<div class="col-sm-10">
	<input type="email" class="form-control" name="email"required>
	</div>
	</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">Password</label>
			<div class="col-sm-10">
			<input type="password" class="form-control" name="pwd"minlength="8"maxlength="16"required>
			</div>
			</div>

			<div class="form-group">
			<label class="col-sm-2 control-label">Address</label>
			<div class="col-sm-10">
			<input type="text" class="form-control" name="add"minlength="5"maxlength="30"required>
			</div></div>
                                           <div class="form-group">
					   <label class="col-sm-2 control-label">Phone</label>
					   <div class="col-sm-10">
                                               <input type="text" class="form-control" name="phon"minlength="10"maxlength="12" required>
					</div>
						</div>
						<div class="form-group">
						<label class="col-sm-2 control-label">Sex</label>
						<div class="col-sm-2">
						<select class="form-control" name="sex" required>
						<option>Male</option>
						<option>Female</option>
						</select>
						</div>
						</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Birth Date</label>
			<div class="col-sm-10">
			<input type="date" class="form-control" name="bdate"required>
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Age</label>
			<div class="col-sm-10">
			<input type="number" class="form-control" name="age" minlength="1"maxlength="3" required>
			</div>
			</div>
			<div class="form-group">
			<label class="col-sm-2 control-label">Blood Group (Optional)</label>
			<div class="col-sm-2">
				<select class="form-control" name="bgroup"required>
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
					<input type="submit" class="btn btn-primary" value="Add Patient">
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
	</div>

	<script src="js/bootstrap.min.js"></script>
	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>