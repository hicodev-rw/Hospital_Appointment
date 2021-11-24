<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="images/logo.png" rel="icon"/>
        <title>Online Hospital Management System</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <script src="js/jquery.js"></script>
        <script type="text/javascript">
                $(document).ready(function()
                {

                        $('#doctorlist').show();
                        $('.doctor li:first-child a').addClass('active');
                        $('.doctor li a').click(function(e){

                                var tabDiv=this.hash;
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

            <div class="col-md-2 ">
                <ul class="nav nav-pills ">
                    <li class="dropdown dmenu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("uname") %> <span class="caret"></span></a>
                            <ul class="dropdown-menu ">
                                
							<li><a href="profile.jsp">Change Profile</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout.jsp">Logout</a></li>
						
                            </ul>
                     </li>
                </ul>
            </div>
        </div>
       
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
