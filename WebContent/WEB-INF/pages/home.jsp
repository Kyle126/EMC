<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html ng-app="myApp">
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
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
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
div.container{
width:900px;

}
div.panel{
background:rgba(255, 255, 255, 0.8);
}
form{
margin-left:50px;
}
#calculator{
background-color:#707070;
}
div#topbar {
   margin: 0;
   padding: .3em 0 .3em 0;
   background: #707070 ;
   width: 100%;
   text-align: center;
} 
.form-group{
	margin-right:100px;
}
.check-box{
	margin-right:100px;
}
#nav {
		width: 100%;
		float: top;
		margin: 0 0 3em 0;
		padding: 0;
		list-style: none;
		background-color: #000000;
		border-bottom: 1px solid #ccc; 
		border-top: 1px solid #ccc; }
#myaccount{
		margin-left: 500px;}
#signin{
		margin-left: 500px;}
#nav li {
		float: left; }
#nav li a {
		display: block;
		padding: 8px 15px;
		text-decoration: none;
		font-weight: bold;
		font-size: 150%;
		color: #FFFFFF ;
		}
#nav li a:hover {
		color: #c00;
		background-color: #fff; }
#j_username{
		width:240px;
		margin-left:-10px;
}
#j_password{
		width:240px;
		margin-left:-10px;
}
#summitbutton{
		margin-right:80px;
		margin-bottom:50px;
}
	.form {
		margin: auto;
		height: 86%;
		width: 100%;
		box-sizing: border-box;
		padding: 40px;
	}
	.textbox:focus {
		outline: none;
		border: rgba(24, 149, 215, 1) 2px solid;
		color: rgba(24, 149, 215, 1);
	}
	.textbox:focus {
		outline: none;
		border: rgba(24, 149, 215, 1) 2px solid;
		color: rgba(24, 149, 215, 1);
	}		
h6 {
    display: block;
    font-size: .67em;
    margin-top: 2.33em;
    margin-bottom: 2.33em;
    margin-left: 0;
    margin-right: 0;
    font-weight: bold;
}
</style>
   

</head>

<body ng-controller="calculatorCtrl">

    <!-- Navigation -->
 	<div id="topbar">
       <ul id="nav">
            <sec:authorize access="isAnonymous()">
             <li class="dropdown"id="signin">
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
							<div>
								<a href="forgetPassword.html" style="color:red; font-size:15px" >Forget Password?</a>
							</div>
							<button type="submit" class="btn btn-primary pull-right" id="summitbutton">Sign In</button>
						</form>
					</ul>
				</li>
           
            <li>
                <a href="signup.html" onclick = $("#menu-close").click(); >Sign Up</a>
            </li>
            </sec:authorize>
            	<li class="dropdown" id="calculator">
		            <a href="" class="dropdown-toggle" data-toggle="dropdown">calculator<b class="caret"></b></a>
		            <ul class="dropdown-menu"id="calculator">
		                <li><a href="calculator.html"><font color="white">calculator</font></a></li>
		              	<li><a href="autoloan.html"><font color="white">autoloan</font></a></li>
		              	<li><a href="personalloan.html"><font color="white">personalloan</font></a></li>
		            </ul>
	          	</li>
			<sec:authorize access="isAuthenticated()">
				<li class="dropdown" id="myaccount">
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
   </div>
 
<header id="top" class="header">
<!-- Enhanced Mortgage Calculator Content -->
<div class='container'>
    <div class='panel panel-primary dialog-panel'>
      <div class='panel-heading'>
        <h5>Almaguin Campground - Reservation</h5>
      </div>
      <div class='panel-body'>
	<br/>
	<!-- Tab Panes -->
	<div class="tab-content">
		<!-- Calculator Pane -->
		<div role="tabpanel" class="tab-pane active" id="calculatorPane">
		<h3 align="center">Mortgage Calculator</h3>
			<h6 align="center">
			<br>Calculate your monthly mortgage payment using the free calculator below.
			<br>A house is the largest purchase most of us will ever make so it's important 
			<br>to calculate what your mortgage payment will be and how much you can afford. 
			<br>Estimate your monthly payments and see the effect of adding extra payments.</h6>
			
			<form id="calculateForm" class="form-horizontal" ng-submit="calculate()">
			
				<!-- State -->
				<div class="form-group">                    
			        <label for="state" class="col-sm-4 control-label"><font color="red">* </font>State</label>
			        <div class="col-sm-4">
				        <select class="form-control" id="state" name="state" ng-model="state" ng-options="key for (key, value) in stateList">
				      		<option value=""></option>
				    	</select>
					</div>
			    </div>
			    <!-- Purchase price -->
				<div class="form-group">                    
			        <label for="purchase" class="col-sm-4 control-label"><font color="red">* </font>
			        	Purchase Price&nbsp&nbsp
			        	<img alt="Question" src="img/question-icon.png" data-toggle="tooltip" 
			        	data-placement="top" title="{{purchaseQuest}}">
			        </label>
			        <div class="col-sm-4">
			        	<div class="input-group">
			      			<div class="input-group-addon">$</div>
			            	<input type="text" class="form-control" id="purchase" name="purchase" ng-model="purchase">
			            </div>
			        </div>
			    </div>
			    <!-- Loan term -->
				<div class="form-group">                    
			        <label for="termInYears" class="col-sm-4 control-label"><font color="red">* </font>
			        	Loan Term&nbsp&nbsp
			        	<img alt="Question" src="img/question-icon.png" data-toggle="tooltip" 
			        	data-placement="top" title="{{termInYearsQuest}}">
			        </label>
			        <div class="col-sm-4">
			        	<label class="radio-inline">
						  	<input type="radio" ng-model="termInYears" name="termInYears" value="30">30 years
						</label>
						<label class="radio-inline">
						  	<input type="radio" ng-model="termInYears" name="termInYears" value="20">20 years
						</label>
						<label class="radio-inline">
						  	<input type="radio" ng-model="termInYears" name="termInYears" value="15">15 years
						</label>
			        </div>
			    </div>
			    <!-- Loan type -->
			    <div class="form-group">                    
			        <label for="loanType" class="col-sm-4 control-label"><font color="red">* </font>
			        	Loan Type&nbsp&nbsp
			        	<img alt="Question" src="img/question-icon.png" data-toggle="tooltip" 
			        	data-placement="top" title="{{loanTypeQuest}}">
			        </label>
			        <div class="col-sm-4">
			        	<label class="radio-inline">
						  	<input type="radio" ng-model="loanType" name="loanType" value="fixed">Fixed rate
						</label>
						<label class="radio-inline">
						  	<input type="radio" ng-model="loanType" name="loanType" ng-disabled="isFixedSelected()" value="5_year_arm">5-year ARM
						</label>
						<label class="radio-inline">
						  	<input type="radio" ng-model="loanType" name="loanType" ng-disabled="isFixedSelected()" value="7_year_arm">7-year ARM
						</label>
						<label class="radio-inline">
						  	<input type="radio" ng-model="loanType" name="loanType" ng-disabled="isFixedSelected()" value="10_year_arm">10-year ARM
						</label>
			        </div>
			    </div>
			    <!-- Down payment -->
			    <div class="form-group">                    
			        <label for="downPayment" class="col-sm-4 control-label"><font color="red">* </font>
			        	Down Payment&nbsp&nbsp
			        	<img alt="Question" src="img/question-icon.png" data-toggle="tooltip" 
			        	data-placement="top" title="{{downPaymentQuest}}">
			        </label>
			        <div class="col-sm-4">
		            	<select class="form-control" id="downPayment" name="downPayment" ng-model="downPayment" ng-options="key for (key, value) in downPaymentList">
				      		<option value=""></option>
				    	</select>
			        </div>
			    </div>
			    <!-- Extra payment -->
			    <div class="form-group">                    
			        <label for="extraPayment" class="col-sm-4 control-label">
			        	Additional Monthly Payment&nbsp&nbsp
			        	<img alt="Question" src="img/question-icon.png" data-toggle="tooltip" 
			        	data-placement="top" title="{{extraPaymentQuest}}">
			        </label>
			        <div class="col-sm-4">
			        	<div class="input-group">
			      			<div class="input-group-addon">$</div>
			            	<input type="text" class="form-control" id="extraPayment" name="extraPayment" ng-model="extraPayment">
			            </div>
			        </div>
			    </div>
			    <!-- Extra month -->
			    <div class="form-group">                    
			        <label for="extraMonth" class="col-sm-4 control-label">
			        	Months of Additional Monthly Payment&nbsp&nbsp
			        	<img alt="Question" src="img/question-icon.png" data-toggle="tooltip" 
			        	data-placement="top" title="{{extraMonthQuest}}">
			        </label>
			        <div class="col-sm-4">
				    	<select class="form-control" id="extraMonth" name="extraMonth" ng-model="extraMonth" ng-options="month for month in months">
				      		<option value=""></option>
				    	</select>
			        </div>
			    </div>
			    <div class="form-group">
			    	<div class="col-sm-offset-4 col-sm-4">
			      		<button type="reset" class="btn btn-primary">Reset</button>
			      		<button type="submit" id="calculatorBtn" class="btn btn-primary">Submit</button>
			    	</div>
			  	</div>      
			</form>
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