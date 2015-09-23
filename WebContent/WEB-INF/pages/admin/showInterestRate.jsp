<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>

<link rel="stylesheet" type="text/css" href="css/to-top.css"/>

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
<title>Show Interest Rate</title>
</head>
<body ng-controller="adminCtrl">

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
	          
         	<li><a href="updateInterestRate.html">Interest Rate Management</a></li>
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
    
        <header id="top" class="header">
        <div class="text-vertical-center">

<h3 class="signup">Interest Rate Table</h3>



<table class="table table-striped table-hover emc-table" >

	<thead>
		<tr>
			<th>State</th>
			<th>Fixed 30 Years</th>
			<th>Fixed 20 Years</th>
			<th>Fixed 15 Years</th>
			<th>3-year ARM</th>
			<th>5-year ARM</th>
			<th>7-year ARM</th>
			<th>10-year ARM</th>
		</tr>
	</thead>
	
	<tbody>
		<tr ng-repeat="row in rows">
			<td>{{row.state}}</td>
			<td>{{row.fix_30}}%</td>
			<td>{{row.fix_20}}%</td>
			<td>{{row.fix_15}}%</td>
			<td>{{row.arm_3}}%</td>
			<td>{{row.arm_5}}%</td>
			<td>{{row.arm_7}}%</td>
			<td>{{row.arm_10}}%</td>
		</tr>
	</tbody>
	
</table>



</div>
</header>



<script src="js/controller/adminController.js"></script>


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
    
      <img src="img/back_to_top.png" id="toTop"/>
  <script style="text/javascript" src="js/to-top.js"></script>
    
</body>
</html>