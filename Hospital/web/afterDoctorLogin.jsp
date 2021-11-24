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
out.print((String) session.getAttribute("doctoruname"));
 %> <span class="caret"></span>
					</a>
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
					<li><a href="afterDoctorLogin.jsp">My Appointment</a></li>
					<li><a href="UpdateDoctorProfile.jsp">Update Profile</a></li>
				</ul>
			</div>
			<div class="col-md-10 maincontent">
				<div class="panel panel-default contentinside">
					<div class="panel-heading">My Appointment</div>
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">
							<li role="presentation"><a href="#doctorlist">My
									Appointment</a></li>
						</ul>

						<!--Display Appointment-->

						<div id="doctorlist" class="switchgroup">
							<table class="table table-bordered table-hover">
								<tr class="active">
									<td>Apointment ID</td>
									<td>Name</td>
									<td>Email
									<td>Contact</td>
									<td>Age</td>
									<td>Day</td>
									<td>Description</td>
                                                                        <td>Status</td>
									<td>Action</td>
								</tr>
								<%
									int deptId = 0;
										Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery(
												"select * from appointment where id='" + session.getAttribute("doctor_id") + "' order by day");
										while (rs.next()) {
								%>
								<form action="DeleteAppointment" method="post">
									<tr>
                                                                            <td><input type="text" name="apid" value="<%=rs.getInt(1)%>" class="form-control" style="width:40px;" readonly></td>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(3)%></td>
										<td><%=rs.getString(4)%></td>
										<td><%=rs.getString(5)%></td>
										<td><%=rs.getString(6)%></td>
										
										<td><%=rs.getString(8)%></td>
										<td><%=rs.getString(10)%></td>
										<td>
                                                                                 <input type="submit" class="btn btn-primary" value="Accept" name="accept"
											class="glyphicon glyphicon-trash" aria-hidden="true">
                                                                                 <input type="submit" class="btn btn-danger" value="Reject" name="reject"
											class="glyphicon glyphicon-trash" aria-hidden="true">
                                                                                 <input type="submit" class="btn btn-danger" value="Delete" name="delete"
											class="glyphicon glyphicon-trash" aria-hidden="true">

										</td>
									</tr>
								</form>
								<%
									}
								%>

							</table>
						</div>

					</div>
					<!----------------   Panel Body Ends   --------------->
				</div>
				<!-----------  Content Menu Tab Ends   ------------>
			</div>
			<!-------   Content Area Ends  --------->
		</div>
		<script src="js/bootstrap.min.js"></script>
		<%
			} else {
				response.sendRedirect("doctorLogin.jsp");
			}
		%>
	
</body>
</html>