<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
<title>Mortgage Calculator</title>
</head>
<body ng-controller="calculatorCtrl">

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


<!-- Enhanced Mortgage Calculator Content -->
<div role="tabpanel" id="calculator-body">
	<!-- Nav Tabs -->
	<ul class="nav nav-justified" role="tablist" id="calculatorNav">
		<li role="presentation" class="active">
			<a href="#calculatorPane" aria-controls="calculatorPane" role="tab" data-toggle="tab">Mortage</a>
		</li>
		<li role="presentation">
			<a href="#PersonalPane" aria-controls="resultPane" role="tab" data-toggle="tab">Personal Loan</a>
		</li>
		<li role="presentation">
			<a href="#CarPane" aria-controls="chartPane" role="tab" data-toggle="tab">Car Loan</a>
		</li>
	</ul>
	<br/>
	
	<!-- Tab Panes -->
	<div class="tab-content">
	<!-- personal Pane -->
		<div role="tabpanel" class="tab-pane active" id="PersonalPane">
		<!-- Calculator Pane -->
		<div role="tabpanel" class="tab-pane active" id="calculatorPane">
			<h3>PersonalLoan</h3>
			<form id="calculateForm" class="form-horizontal" ng-submit="calculate()">
	<!-- bank -->
				<div class="form-group">                    
			        <label for="bank" class="col-sm-4 control-label"><font color="red">* </font>bank</label>
			        <div class="col-sm-4">
				        <select class="form-control" id="bank" name="bank" ng-model="bank" ng-options="key for (key, value) in stateList">
				      		<option value=""></option>
				    	</select>
			        </div>
			        </div>
	<!-- rate -->
			    <div class="form-group">                    
			        <label for="rate" class="col-sm-4 control-label"><font color="red">* </font>
			        	rate&nbsp&nbsp
			        </label>
	</div>
	</div>	

</header>
		<!-- Result Pane -->
		    <header id="result2" class="header2">
        <div class="text-vertical-center">
		<div role="tabpanel" class="tab-pane2" id="resultPane">
			<div ng-show="!showResultPane()"><h3 class=signup>You have not calculate yet.</h3></div>
			<div ng-show="showResultPane()">
				<div class="row">
					<!-- Payment Summary Table -->
					<div class="col-sm-12">
						<table class="table emc-summary-table">
							<tr>
								<td>Loan Type</td>
								<td>{{showLoanType()}}</td>
							</tr>
							<tr>
								<td>Loan Term</td>
								<td>{{showLoanTermInMonths()}} </td>
							</tr>
							<tr>
								<td>Purchase Price</td>
								<td>{{schedule.purchase | currency}}</td>
							</tr>
							<tr>
								<td>Down Payment</td>
								<td>{{schedule.purchase * (schedule.downPayment / 100) | currency}}</td>
							</tr>
							<tr ng-show="showExtraPayment()">
								<td>Extra Payment</td>
								<td>{{schedule.extraPayment | currency}}{{showExtraMonth()}}</td>
							</tr>
							<tr ng-show="showExtraPayment()">
								<td>Saved Interest</td>
								<td>{{schedule.savedInterest | currency}}</td>
							</tr>
							<tr>
								<td></td><td></td>
							</tr>
						</table>
					</div>
					
				</div>
				<!-- Payment Schedule Table -->
				<table class="table table-striped table-hover emc-table" >
					<thead>
						<tr>
							<th>Month</th>
							<th>Monthly Payment</th>
							<th ng-show="showExtraPaymentColumn()">Extra Payment</th>
							<th>Total Payment</th>
							<th>Remaining </th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="result in schedule.results">
							<td>{{result.month}}</td>
							<td>{{result.monthlyPayment | currency}}</td>
							<td ng-show="showExtraPaymentColumn()">{{result.extraPayment | currency}}</td>
							<td>{{result.totalPayment | currency}}</td>
							<td>{{result.remainingPrincipal | currency}}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		</div>
		</header>

		<!-- Chart Pane -->
		<div role="tabpanel" class="tab-pane" id="chartPane">
			<div ng-show="!showResultPane()"><h3 class=signup>You have not calculate yet.</h3></div>
			<div ng-show="showResultPane()">
				<h3 class=signup><b>Monthly Interest Rate Line Chart</b></h3> 
				<div class="row">
				<div id="calLineChart"></div>
<!-- Pie Chart -->
					<div class="col-sm-4">
						<div id="calPieChart"></div>
					</div>	
					</div>			
			</div>
		</div>
		
	</div>
</div>

<script src="https://www.google.com/jsapi"></script>
<script src="js/controller/calculatorController.js"></script>



 <!-- jQuery -->
   <!--  <script src="js/jquery-1.11.3.min.js"></script>

    Bootstrap Core JavaScript
    <script src="js/bootstrap.min.js"></script> -->
    
    
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    
    
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