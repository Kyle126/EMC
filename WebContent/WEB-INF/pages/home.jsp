<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html lang="en">

<head>

<link rel="stylesheet" type="text/css" href="css/to-top.css"/>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Enhanced Mortgage Calculator</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">


 <style>
      #map-canvas {
        width: 100%;
        height: 500px;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script>
    function initialize() {
    	  var myLatlng = new google.maps.LatLng(40.3376975,-74.5873233);
    	  var mapOptions = {
    	    zoom: 12,
    	    center: myLatlng
    	  }
    	  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    	  var marker = new google.maps.Marker({
    	      position: myLatlng,
    	      map: map,
    	      title: 'Mercury System,Inc'
    	  });
    	}
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>

</head>

<body>

    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="#top"  onclick = $("#menu-close").click(); >Mortgage Calculator</a>
            </li>
            <sec:authorize access="isAnonymous()">
             <li class="dropdown">
					<a href="" class="dropdown-toggle" data-toggle="dropdown">Sign In <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<form id="loginForm" action="<c:url value='/j_spring_security_check'/>" method="post" class="login-form">
							<div class="form-group">
								<label for="email">Username</label> 
								<input type="text" class="form-control" name="j_username" id="j_username" placeholder="Username">
							</div>
							<div class="form-group">
								<label for="password">Password</label>
								<input type="password" class="form-control" name="j_password" id="j_password" placeholder="Password">
							</div>
							<div class="checkbox">
								<label><input type="checkbox" name="_spring_security_remember_me" checked> Remember me for 30 days</label>
							</div>
							
							<a href="forgetPassword.html" >Forget Password?</a>
							<button type="submit" class="btn btn-primary pull-right">Sign In</button>
						</form>
					</ul>
				</li>
           
            <li>
                <a href="signup.html" onclick = $("#menu-close").click(); >Sing Up</a>
            </li>
            </sec:authorize>
            
            
            <sec:authorize access="isAuthenticated()">
				<li><a href="calculator.html">Calculator</a></li>
			</sec:authorize>
			
			
			<sec:authorize access="isAuthenticated()">
				<li class="dropdown">
		            <a href="" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
		            <ul class="dropdown-menu">
		              	<li><a href="updatePassword.html">Change Password</a></li>
		              	<li><a href="updateEmail.html">Change Email</a></li>
		              	<li><a href="<c:url value='/j_spring_security_logout'/>">Logout</a></li>
		            </ul>
	          	</li>
			</sec:authorize>
			
			
			<!-- Admin can access -->
			<sec:authorize access="hasRole('ROLE_ADMIN')">          		
            			<li><a href="showInterestRate.html">Interest Rate Table</a></li>
		              	<li><a href="updateInterestRate.html">Interest Rate Management</a></li>
	            	
	          	
			</sec:authorize>
			
            <li>
                <a href="#top" onclick = $("#menu-close").click(); >Home</a>
            </li>
            <li>
                <a href="#callout" onclick = $("#menu-close").click(); >About</a>
            </li>
              
            <li>
                <a href="#contact" onclick = $("#menu-close").click(); >Contact</a>
            </li>
        </ul>
    </nav>

    <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center">
            <h1>Enhanced Mortgage Calculator</h1>
            <h3>your free mortgage calculator</h3>
            <br>
            <a href="#callout" class="btn btn-dark btn-lg">Find Out More</a>
        </div>
    </header>

    <!-- About -->
    <section id="callout" class="callout">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1>Enhancd Mortgage Calculator</h1>
                    <br/>
                    <p class="lead">Mortgage calculators are automated tools that enable users to
                determine the financial implications of changes in one or more
                variables in a mortgage financing arrangement. Mortgage calculators
                are used by consumers to determine monthly repayments, and by mortgage
                providers to determine the financial suitability of a home loan
                applicant.</p>
                <br/>
	<p class="lead">
		The major variables in a mortgage calculation include loan
		principal, balance, periodic compound interest rate, number of
		payments per year, total number of payments and the regular payment
		amount. More complex calculators can take into account other costs
		associated with a mortgage, such as local and state taxes, and
		insurance.
	</p>
    <br/>
    <br/>
	<p class="alert alert-info">
		EMC is enhanced mortgage calculator that help you to calculate loans with some additional features. You needs to log in the system 
		and input the necessary information. Then EMC will output the monthly payment with 
		the payment schedule. You can also add additional principals for each month and EMC 
		will calculate how much you can save for interest.
	</p>
                </div>
            </div>
         
        </div>

</section>

    
    


    <!-- Map -->
    <section id="contact" class="map">
    
    <div id="map-canvas"></div>
  </body>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>Enhanced Mortgage Calculator</strong>
                    </h4>
                    <p>5 Independence Waye<br>Suit 140</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> (609) 243-0230</li>
                        <li> <a href="http://www.mercurysystemsinc.com/">http://www.mercurysystemsinc.com/</a>
                        </li>
                    </ul>
                    <br>
                   
                 
                    <p class="text-muted">Copyright &copy;Mercury System,Inc</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery-1.11.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
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

   
      <img src="img/back_to_top.png" id="toTop"/>
  <script style="text/javascript" src="js/to-top.js"></script>
    

</body>

</html>
