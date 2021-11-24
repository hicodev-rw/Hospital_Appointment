<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Rwanda Military Hospital</title>
<!--Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/jquery.js"></script>
</head>
<body>
<div class="maindiv-home">
<div class="container-fluid">
<div class="row navbar-fixed-top">
<nav class="navbar navbar-default header">
<div class="container-fluid">
<div class="navbar-header">
<a class="navbar-brand logo" href="#"> <img alt="logo"
src="images/logo.png">
</a>
<div class="navbar-text title">
<p>
Rwanda Military Hospital 
</p>
</div>
</div>
</div>
</nav>
</div>
</div>
<div class="main-block">
<div class="formcontainerhome">
<form class="form-horizontal center-block" role="form" action="LoginDao" method="post">
<h1>Admin Login</h1>
<hr/>
<div class="flex-container">
<div style="font-size: 30px;" class="left">
<i class="fa fa-user" aria-hidden="true"></i>
</div>
<div class="right">
<input type="email" class="form-control" name="email"
placeholder="example@gmail.com" required></div><br/>
<div style="font-size: 35px;" class="left">
<i class="fa fa-lock" aria-hidden="true"></i></div>
<div class="right">
<input type="password" name="password" class="form-control"
placeholder="Password" required>
</div>
</div>
<br />
<input type="submit" class="btn btn-primary btn-block btn-lg" value="Login"><br>
<div class="base">

<a href="selfRegistration.jsp">Self Registration</a> | <a href="doctorLogin.jsp">Doctor Login</a> | <a href="patientLogin.jsp">Patient Login</a>
</div>
</form></div></div></div>
<div class="copyright">
<p>Copyrights © Rwanda Military Hospital 2021. All rights reserved.</p>

</div> 
	<script src="js/bootstrap.min.js"></script>

</body>
</html>