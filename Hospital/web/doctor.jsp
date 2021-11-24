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
<li><a href="profile.jsp">Profile</a></li>
</ul>
</div>
<div class="col-md-10 maincontent">
<!--   Menu    -->
<div class="panel panel-default contentinside">
<div class="panel-heading">Doctors</div>
<div class="panel-body">
<ul class="nav nav-tabs doctor">
<li><a href="#doctorlist">Doctor List</a></li>
<li><a href="#adddoctor">Add Doctor</a></li>
</ul>
<!--Doctor List-->

<div id="doctorlist" class="switchgroup">
<table class="table table-bordered table-hover">
<tr class="active">
<td>Doctor ID</td>
<td>Name</td>
<td>Department</td>
<td>Phone No.</td>
<td>Options</td>
</tr>
	<%
Connection conn = ConnectionProvider.getCon();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("select * from doctor");
while (rs.next()) {
%>
<form action="DeleteDoctor" method="post">
<tr>
<td><input type="text" name="pid"value="<%=rs.getInt(1)%>" class="form-control" style="width:40px;"readonly></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(6)%></td>
<td><a href="editDoctor.jsp?id=<%=rs.getInt(1)%>" class="btn btn-primary"		data-toggle="modal"> <span
 aria-hidden="true"></span>Edit
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

<!-- Doctor Edit Info Modal  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
<h4 class="modal-title" id="myModalLabel">Edit Doctor Information</h4>
</div>
<div class="modal-body">
<div class="panel panel-default">
<div class="panel-body">
<form class="form-horizontal" action="editDoct.jsp" method="post">
<div class="form-group">
<label class="col-sm-2 control-label">Doctor Id:</label>
<div class="col-sm-10">
<input type="number" class="form-control" name="doctid"	placeholder="Doctor ID" value="" readonly="readonly">
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">Name</label>
<div class="col-sm-10">
<input type="text" class="form-control" name="doctname">
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">Email</label>
<div class="col-sm-10">
<input type="email" class="form-control" name="email">
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">Password</label>
<div class="col-sm-10">
<input type="password" class="form-control" name="pwd">
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">Address</label>
<div class="col-sm-10">
<input type="text" class="form-control" name="add">
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">Phone</label>
<div class="col-sm-10">
<input type="text" class="form-control" name="phon">
				</div>
				</div>													<div class="form-group">
<label class="col-sm-2 control-label">Department</label>
<div class="col-sm-10">															<select class="form-control" name="dept">
<option selected="selected">Department</option>
<option>Neurology</option>
</select>
</div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
<input type="submit" class="btn btn-primary" value="Update">
</button>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
						</div>
<div id="adddoctor" class="switchgroup">
<div class="panel panel-default">
<div class="panel-body">
<form class="form-horizontal" action="doctorProcess.jsp" method="post">
<div class="form-group">
<label class="col-sm-2 control-label">Name</label>
<div class="col-sm-10">
<input type="text" class="form-control" name="doctname" minlength="4"maxlength="30"required="required">
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">Email</label>
<div class="col-sm-10">
<input type="email" class="form-control" name="email" required="required">											</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label">Password</label>
<div class="col-sm-10">
<input type="password" class="form-control" name="pwd" minlength="8"maxlength="16"required="required">
	</div></div>
<div class="form-group">
<label class="col-sm-2 control-label">Address</label>
<div class="col-sm-10">
<input type="text" class="form-control" name="add" minlength="5"maxlength="30"required="required">
</div>
</div>

<div class="form-group">
<label class="col-sm-2 control-label">Phone</label>
<div class="col-sm-10">
<input type="text" class="form-control" name="phon"minlength="10"maxlength="12" required="required">
</div>
 </div>
<div class="form-group">
<label class="col-sm-2 control-label">Department</label>
<div class="col-sm-10">
    <select class="form-control" name="dept" required>
<option selected="selected">Radiology</option>
<%
Statement stmt = conn.createStatement();
ResultSet resultset = stmt.executeQuery("select dept_name from department");
while (resultset.next()) {
%>
 <option><%=resultset.getString(1)%></option>
		              <%
				}
				%>
		</select>
		</div>
<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
    <br><br>
<input type="submit" class="btn btn-primary"
value="Add Doctor">											</div>
</div></form>
</div>
</div></div></div>
</div>
<div>
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