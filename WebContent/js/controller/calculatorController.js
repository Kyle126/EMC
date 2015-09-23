/* 
 * Mortgage Calculator Controller
 * @Framework: AngularJS 
 */ 
angular.module('myApp')
	.controller('calculatorCtrl', ['$scope', '$http', function($scope, $http) {
		
		$scope.purchase = '';
		$scope.termInYears = '30';
		$scope.state = '';
		$scope.downPayment = '';
		$scope.loanType = 'fixed';
		$scope.extraPayment = 0;  // enhanced field
		$scope.extraMonth = 0;  // enhanced field
		
		// ************ For testing ************
//		$scope.purchase = '500000';
//		$scope.termInYears = '30';
//		$scope.state = 'MA';
//		$scope.downPayment = 5;
//		$scope.loanType = 'fixed';
//		$scope.extraPayment = 2000;  // enhanced field
//		$scope.extraMonth = 20;  // enhanced field
		// *************************************
		
		$scope.schedule = '';
		$scope.loan = [];  // loan object for request body
		$scope.stateList = {
				'Alabama' : 'AL', 'Alaska' : 'AK', 'Arizona' : 'AZ', 'Arkansas' : 'AR', 'California' : 'CA', 
				'Colorado' : 'CO', 'Connecticut' : 'CT', 'Delaware' : 'DE', 'District Of Columbia' : 'DC', 
				'Florida' : 'FL', 'Georgia' : 'GA', 'Hawaii' : 'HI', 'Idaho' : 'ID', 'Illinois' : 'IL', 
				'Indiana' : 'IN', 'Iowa' : 'IA', 'Kansas' : 'KS', 'Kentucky' : 'KY', 'Louisiana' : 'LA', 
				'Maine' : 'ME', 'Maryland' : 'MD', 'Massachusetts' : 'MA', 'Michigan' : 'MI', 'Minnesota' : 'MN', 
				'Mississippi' : 'MS', 'Missouri' : 'MO', 'Montana' : 'MT', 'Nebraska' : 'NE', 'Nevada' : 'NV', 
				'New Hampshire' : 'NH', 'New Jersey' : 'NJ', 'New Mexico' : 'NM', 'New York' : 'NY', 
				'North Carolina' : 'NC', 'North Dakota' : 'ND', 'Ohio' : 'OH', 'Oklahoma' : 'OK', 'Oregon' : 'OR', 
				'Pennsylvania' : 'PA', 'Rhode Island' : 'RI', 'South Carolina' : 'SC', 'South Dakota' : 'SD', 
				'Tennessee' : 'TN', 'Texas' : 'TX', 'Utah' : 'UT', 'Vermont' : 'VT', 'Virginia' : 'VA', 
				'Washington' : 'WA', 'West Virginia' : 'WV', 'Wisconsin' : 'WI', 'Wyoming' : 'WY'
	  		};
		$scope.downPaymentList = {' 5%' : 5, '10%' : 10, '15%' : 15, '20%' : 20, '25%' : 25, '30%' : 30};
		
		/*
		 * Get months for extraMonth
		 */
		$scope.getMonths = function(termInYears) {
			var range = [];
			for (var i = 0; i <= termInYears * 12; i++) {
		        range.push(i);
		    }
			return range;
		};
		$scope.months = $scope.getMonths($scope.termInYears);
		
		// FAQ
		$scope.purchaseQuest = 'The total amount paid by a buyer to a seller for the purchase of property.';
		$scope.termInYearsQuest = 'The period of time during which a loan must be repaid. For example, a 30-year fixed loan has a term of 30 years. Also called term. See also: maturity date.';
		$scope.loanTypeQuest = 'The loan type refers to the loan product selected by the borrower at the time of application such as adjustable-rate mortgage or conventional 30-year fixed-rate mortgage.';
		$scope.downPaymentQuest = 'The amount of cash you pay toward the purchase of your home to make up the difference between the purchase price and your mortgage loan. Down payments often range between 5% and 20% of the sales price depending on many factors, including your loan, your lender, your credit history, and so forth.';
		$scope.extraPaymentQuest = 'The additional payment for each month.';
		$scope.extraMonthQuest = 'The number of months to pay the additional payment for each month.';
		
		/*
		 * Get real loan type base on termInYears, loanType
		 */
		$scope.getLoanType = function(termInYears, loanType) {
			if (termInYears == 15)
				return 'fix_15';
			else if (termInYears == 20)
				return 'fix_20';
			else if (termInYears == 30) {
				if (loanType == 'fixed')
					return 'fix_30';
				else if (loanType == '3_year_arm')
					return 'arm_3';
				else if (loanType == '5_year_arm')
					return 'arm_5';
				else if (loanType == '7_year_arm')
					return 'arm_7';
				else if (loanType == '10_year_arm')
					return 'arm_10';
			} else
				return '';
		};
		
		/* 
		 * Calculate monthly payment
		 */
		$scope.calculate = function() {	
			if ($("#calculateForm").valid()) {  // form validation
				$scope.loan.push({
					'purchase' : $scope.purchase, 
					'state' : $scope.state, 
					'downPayment' : $scope.downPayment, 
					'loanType' : $scope.getLoanType($scope.termInYears, $scope.loanType),
					'extraPayment' : $scope.extraPayment == '' ? 0 : $scope.extraPayment,
					'extraMonth' : $scope.extraMonth == '' ? 0 : $scope.extraMonth
				});
				// Object that send to server
				var dataObj = {
						purchase : $scope.purchase,
						state : $scope.state,
						downPayment : $scope.downPayment,
						loanType : $scope.getLoanType($scope.termInYears, $scope.loanType),
						extraPayment : $scope.extraPayment == '' ? 0 : $scope.extraPayment,
						extraMonth : $scope.extraMonth == '' ? 0 : $scope.extraMonth
				};	
				$http.post('calculate.html', dataObj)
				.success(function(data, status, headers, config) {
					$scope.schedule = data;
					
					/** Render google chart **/
					var purchase = $scope.schedule.purchase;
					var totalInterest = $scope.schedule.totalInterest;
					var monthlyInterestRates = [];
					for (var i = 0; i < $scope.schedule.monthlyRates.length; i++) {
						monthlyInterestRates.push([i+1, Number(($scope.schedule.monthlyRates[i] * 100).toFixed(2))]);
				    }
					drawChart(purchase, totalInterest, monthlyInterestRates);
					
				})
				.error(function(data, status, headers, config) {
					alert("failure message: " + JSON.stringify({data : data}));  // JSON.stringify() converts a JavaScript value to a JSON string
				});		
			}
		};
		
		/*
		 * Toggle loan type radio buttons
		 */
		$scope.isFixedSelected = function() {
			return $scope.termInYears == 30 ? false : true;
		};
		
		/*
		 * Show extra payment column on result page 
		 */
		$scope.showExtraPaymentColumn = function() {
			return ($scope.extraPayment != 0 && $scope.extraMonth != 0) ? true : false; 
		};
		
		$scope.showResultPane = function() {
			return $scope.schedule != '' ? true : false; 
		};
		
		$scope.showLoanType = function() {
			switch($scope.schedule.loanType) {
			case "fix_15":
				return "15 years fixed rate";
			case "fix_20":
				return "20 years fixed rate";
			case "fix_30":
				return "30 years fixed rate";
			case "arm_3":
				return "3 years ARM";
			case "arm_5":
				return "5 years ARM";
			case "arm_7":
				return "7 years ARM";
			case "arm_10":
				return "10 years ARM";
			}
		};
		
		$scope.showLoanTermInMonths = function() {
			return $scope.schedule.termInYears * 12 + " months"; 
		};
		
		$scope.showExtraPayment = function() {
			return $scope.schedule.extraPayment != 0 ? true : false;
		};
		
		$scope.showExtraMonth = function() {
			return "/mo for " + $scope.schedule.extraMonth + " months"; 
		};
		
	}]);


/*
 * Google Chart
 */
google.load("visualization", "1", {packages:["corechart"]});
function drawChart(purchase, totalInterest, monthlyInterestRates) {
// Pie Chart
  var data1 = google.visualization.arrayToDataTable([
    ['Task', 'Ratio of Total Interest and Purchase'],
    ['Purchase',     purchase], 
    ['Total Interest', totalInterest]	
  ]);
  var options1 = {
    title: 'Ratio of Total Interest and Purchase',
    width: 680,
    height: 450,
    colors: ['#3300FF', '#33CCFF'],
    pieHole: 0.5,
    fontSize: 20,
    pieSliceTextStyle: {
        color: 'black',
      },
  };
  
  // Line Chart
  var data2 = new google.visualization.DataTable();
	data2.addColumn('number', 'Month');
	data2.addColumn('number', 'Rate');
	data2.addRows(monthlyInterestRates);
	var options2 = {
		hAxis: {
	          title: 'Month'
	        },
	    vAxis: {
	          title: 'Monthly Interest Rate %'
	    },
		width: 600,
	    height: 250,
	};
	var pieChart = new google.visualization.PieChart(document.getElementById('calPieChart'));
	  pieChart.draw(data1, options1);
	  
	 var lineChart = new google.visualization.LineChart(document.getElementById('calLineChart'));
	lineChart.draw(data2, options2);
}
