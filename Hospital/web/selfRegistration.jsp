<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		</div>

		<div class="row">
		<!-- Register -->
                <div class="main-blockReg">
                <div class="formcontainerReg">
		<form class="form-horizontal center-block" action="patientProcess.jsp" method="post">
				<div class="form-group">
                                    <center><h3>Patient Self-Registration</3></center><hr/>

		</div>
                    <div class="form-group">
		<label class="col-sm-2 control-label">Name</label>
		<div class="col-sm-10">
		<input type="text" class="form-control" minlength="4"maxlength="30"name="patientname" required>
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
			<input type="password" class="form-control" minlength="8"maxlength="16"name="pwd"required>
			</div>
			</div>

			<div class="form-group">
			<label class="col-sm-2 control-label">Address</label>
			<div class="col-sm-10">
			<input type="text" class="form-control" minlength="5"maxlength="20" name="add"required>
			</div></div>
                                           <div class="form-group">
					   <label class="col-sm-2 control-label">Phone</label>
					   <div class="col-sm-10">
					   <input type="text" class="form-control" minlength="10"maxlength="12" name="phon"required>
					</div>
						</div>
						<div class="form-group">
						<label class="col-sm-2 control-label">Sex</label>
						<div class="col-sm-2">
						<select class="form-control" name="sex"required>
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
                                            <center><input type="submit" class="btn btn-primary" value="Register"></center>
					</div>
					</div>
					</form>

		</div>
		</div>
		</div>
		</div>
		
	</div>

	<script src="js/bootstrap.min.js"></script>
</body>
</html>
