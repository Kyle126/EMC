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
<title>Update Email</title>
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
<h3 calss="signup">Update Email</h3>
<form id="updateEmailForm" class="form-horizontal" action="updateEmail.html" method="post">
	<div class="form-group">                    
        <label for="newEmail" class="col-sm-4 control-label"><font color="red">* </font>New Email Address</label>
        <div class="col-sm-4">
            <input type="email" class="form-control" id="newEmail" name="newEmail" placeholder="New Email Address">
        </div>
    </div>
    <div class="form-group">
    	<div class="col-sm-offset-4 col-sm-4">
      		<button type="reset" class="btn btn-primary">Reset</button>
      		<button type="submit" id="updateEmailBtn" class="btn btn-primary">Update</button>
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