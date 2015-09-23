<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Reset Password</title>
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
<!-- Prompt message -->
<jsp:include page="../prompt.jsp" />

<!-- Main body -->

    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="home.html"  onclick = $("#menu-close").click(); >Mortgage Calculator</a>
            </li>
                        
            
            <li>
                <a href="signup.html" onclick = $("#menu-close").click(); >Sing Up</a>
            </li>
            
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
<h3 class="signup">Reset Password</h3>
	<form id="resetPasswordForm" class="form-horizontal" action="resetPassword.html" method="post">
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
	      		<button type="submit" id="submitBtn" class="btn btn-primary">Submit</button>
	      		<input type="hidden" value="${username}" name="username">
	    	</div>
		</div>
	</form>
	
	
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