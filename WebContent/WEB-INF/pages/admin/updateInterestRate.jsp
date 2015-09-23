<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
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
<title>Update Interest Rate</title>
</head>
<body ng-controller="adminCtrl">
<!-- Prompt message -->
<%-- <jsp:include page="../prompt.jsp" /> --%>

<!-- Main body -->
<!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="home.html"  onclick = $("#menu-close").click(); >Mortgage Calculator</a>
            </li>
                        
            <li class="dropdown">
		            <a href="" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
		            <ul class="dropdown-menu">
		              	<li><a href="updatePassword.html">Change Password</a></li>
		              	<li><a href="updateEmail.html">Change Email</a></li>
		              	<li><a href="<c:url value='/j_spring_security_logout'/>">Logout</a></li>
		            </ul>
	          </li>
	          
	          <li><a href="calculator.html">Calculator</a></li>
	          
            <li><a href="showInterestRate.html">Interest Rate Table</a></li>
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
<h3 class="signup">Update Interest Rate</h3>
<form id="updateInterestForm" class="form-horizontal" action="updateInterestRate.html" method="POST">
	<div class="form-group">                    
        <label for="state" class="col-sm-4 control-label"><font color="red">* </font>State</label>
        <div class="col-sm-4">
	        <select class="form-control" name="state" id="state" ng-model="state" 
	        	ng-options="key for (key, value) in stateList"
	        	ng-change="getCurrentInterestRate()">
	      		<option value=""></option>
	    	</select>
		</div>
    </div>
    <div class="form-group">                    
        <label for="loanType" class="col-sm-4 control-label"><font color="red">* </font>Loan Type</label>
        <div class="col-sm-4">
	        <select class="form-control" name="loanType" id="loanType" ng-model="loanType" 
	        	ng-options="key for (key, value) in loanTypeList"
	        	ng-change="getCurrentInterestRate()">
	      		<option value=""></option>
	    	</select>
		</div>
    </div>
    <div class="form-group"> 
    	<label for="rate" class="col-sm-4 control-label">Yearly Interest Rate</label>
    	<div class="col-sm-4">                   
		<div class="input-group">
			<div class="input-group-addon">%</div>
			<input type="text" class="form-control" name="newInterestRate" id="newInterestRate" 
				ng-model="rate" ng-disabled="enableInterestRateInput()">
		</div>
	</div>
    </div>
    <div class="form-group">
    	<div class="col-sm-offset-4 col-sm-4">
      		<button type="reset" class="btn btn-primary">Reset</button>
      		<button type="submit" id="updateInterestBtn" class="btn btn-primary">Update</button>
    	</div>
    </div>
</form>
</div>
</header>
<script src="js/controller/adminController.js"></script>


<!--       jQuery
    <script src="js/jquery-1.11.3.min.js"></script> -->

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