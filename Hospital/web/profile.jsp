<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="rmhospital.connection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
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
<li class="dropdown dmenu"><a href="#" class="dropdown-toggle"data-toggle="dropdown" role="button" aria-haspopup="true"
aria-expanded="false"><%=session.getAttribute("adminuname")%> 
<span class="caret"></span></a>
<ul class="dropdown-menu ">
<li><a href="logout.jsp">Logout</a></li>
</ul></li>
</ul>
</div>
</div>
<%
if (session.getAttribute("adminuname") != null && session.getAttribute("adminuname") != "") 
{
%>
<div class="row">
<!--Menu -->
<div class="col-md-2 menucontent">
<h1>Dashboard</h1><hr/>
<ul class="nav nav-pills nav-stacked">
<li><a href="department.jsp">Department</a></li>
<li><a href="doctor.jsp">Doctors</a></li>
<li><a href="patients.jsp">Patients</a></li>
<li><a href="profile.jsp">Profile</a></li>
</ul>
</div>
<div class="col-md-10 maincontent">
<div class="panel panel-default contentinside">
<div class="panel-heading">Manage Profile</div>
<!--   Panel    -->
<div class="panel-body">
<%
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from user where name='" + session.getAttribute("adminuname") + "' ");
while (rs.next()) {
%>
<form class="form-horizontal" action="UpdateUserDao" method="post">
<div class="form-group">
<label class="col-sm-2 control-label">Name</label>
<div class="col-sm-10">
<input type="text" class="form-control" name="name"value="<%=rs.getString(2)%>"minlength="5"maxlength="30" required>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">Email</label>
<div class="col-sm-10">
<input type="email" class="form-control" name="email"value="<%=rs.getString(3)%>"required>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">Address</label>
<div class="col-sm-10">
									<input type="text" class="form-control" name="address"
                                                                               value="<%=rs.getString(4)%>" minlength="5"maxlength="30" required>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">Phone</label>
<div class="col-sm-10">
<input type="text" class="form-control" name="phone"value="<%=rs.getString(5)%>"minlength="5"maxlength="30" required>
</div>
</div>
<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<input type="submit" class="btn btn-primary" value="Save Changes">
</div>
</div>
</form>
<%
}
%>
</div>

</div>
<div class="panel panel-default contentinside">
<div class="panel-heading">Change Password</div>
<!--  Panel Start  -->
<div class="panel-body">
    
<%
	ResultSet rs1 = st.executeQuery("select * from user where name='" + session.getAttribute("adminuname") + "'");
	if (rs1.next()) {
	%>

<form class="form-horizontal" action="UpdateUserPassword" method="post">
<div class="form-group">
<label class="col-sm-2 control-label">Password</label>
<div class="col-sm-10">
<input type="password" class="form-control" name="password"	value="<%=rs1.getString(6) %>"minlength="8"maxlength="16" required>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">New Password</label>
<div class="col-sm-10">
<input type="password" class="form-control" name="newpwd"placeholder="Enter New Password"minlength="8"maxlength="16" required></div>
</div>

<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<button type="submit" class="btn btn-primary">Update										Password</button>
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
	<script src="js/bootstrap.min.js"></script>
	<%
			}else{
				response.sendRedirect("index.jsp");
			}
	%>
</body>
</html>