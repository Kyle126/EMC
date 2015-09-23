<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- Custom CSS -->
<link href="css/stylish-portfolio.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/validation.js"></script>
<script src="js/jquery.validate.min.js"></script>
<title>Update Password</title>

</head>
<style>
div.panel{
background:rgba(255, 255, 255, 0.8);
}
form{
margin-left:50px;
}
div.container{
width:900px;

}
</style>
<body>


<!-- Main body -->

<!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="home.html"  onclick = $("#menu-close").click(); >Mortgage Calculator</a>
            </li>
            
            
             	<li><a href="calculator.html">Calculator</a></li>
			<li class="dropdown">
		            <a href="" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
		            <ul class="dropdown-menu">
		              	<li><a href="updatePassword.html">Change Password</a></li>
		              	<li><a href="updateEmail.html">Change Email</a></li>
		              	<li><a href="<c:url value='/j_spring_security_logout'/>">Logout</a></li>
		            </ul>
	          </li>
	          
           <sec:authorize access="hasRole('ROLE_ADMIN')">          		
            			<li><a href="showInterestRate.html">Interest Rate Table</a></li>
		              	<li><a href="updateInterestRate.html">Interest Rate Management</a></li>	            		          	
			</sec:authorize>
           
           
            <li>
                <a href="home.html" onclick = $("#menu-close").click(); >Home</a>
            </li>
            <li>
                <a href="home.html#callout" onclick = $("#menu-close").click(); >About</a>
            </li>
    
                
            <li>
                <a href="home.html#contact" onclick = $("#menu-close").click(); >Contact</a>
            </li>
        </ul>
    </nav>

    <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center">
           <div class='container'>
    <div class='panel panel-primary dialog-panel'>
      <div class='panel-heading'>
        <h5>Almaguin Campground - Reservation</h5>
      </div>
      <div class='panel-body'>
	<br/>  
<h3 class="signup">Update Password</h3>
<form id="updatePassowrdForm" class="form-horizontal" action="updatePassword.html" method="post">
	<div class="form-group">                    
        <label for="oldPassword" class="col-sm-4 control-label"><font color="red">* </font>Old Password</label>
        <div class="col-sm-4">
            <input type="password" class="form-control" id="oldPassword" name="oldPassword" placeholder="Old Password">
        </div>
    </div>
	<div class="form-group">                    
        <label for="newPassword" class="col-sm-4 control-label"><font color="red">* </font>New Password</label>
        <div class="col-sm-4">
            <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New Password">
        </div>
    </div>
    <div class="form-group">                    
        <label for="confirmedPassword" class="col-sm-4 control-label"><font color="red">* </font>Confirmed Password</label>
        <div class="col-sm-4">
			<input type="password" class="form-control" id="confirmedPassword" name="confirmedPassword" placeholder="Confirmed Password">
        </div>
    </div>
    <div class="form-group">
    	<div class="col-sm-offset-4 col-sm-4">
      		<button type="reset" class="btn btn-primary">Reset</button>
      		<button type="submit" id="updatePasswordBtn" class="btn btn-primary">Update</button>
    	</div>
    </div>
</form>
</div>
</header>

  <!-- jQuery -->
    <script src="js/jquery-1.11.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
  <script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    </script>
</body>
</html>