/* 
 * Admin Controller
 * @Framework: AngularJS 
 */
angular.module("myApp")
	.controller("adminCtrl", ['$scope','$http', function($scope, $http){
		$scope.state='';
		$scope.loanType='';
		
		$scope.loan = [];
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
		$scope.loanTypeList = {'15_fix' : '15_fix', '20_fix' : '20_fix', '30_fix' : '30_fix', '30_arm_3' : '30_arm_3',
				'30_arm_5' : '30_arm_5', '30_arm_7' : '30_arm_7', '30_arm_10' : '30_arm_10'};
		
		/*
		 * Get a specific interest rate from database
		 */
		$scope.getCurrentInterestRate = function(){
			if ($scope.state != '' && $scope.loanType != '') {
				$scope.loan.push({'state' : $scope.state, 'loanType' : $scope.loanType});
				// Writing it to the server
				var dataObj = {
					state : $scope.state,
					loanType : $scope.loanType
				};	
				$http.post('getOldInterestRate.html', dataObj)
				.success(function(data, status, headers, config) {
					$scope.rate = data;
				})
				.error(function(data, status, headers, config) {
					alert( "failure message: " + JSON.stringify({data : data}));  // JSON.stringify() converts a JavaScript value to a JSON string
				});	
			}
		};
		
		/*
		 * Disable 'Interest Rate' input condition method
		 */
		$scope.enableInterestRateInput = function() {
			return ($scope.state != '' && $scope.loanType != '') ? false : true;
		};
		
		/*
		 * Get all interest rates from database
		 */
		$http.get('allRatesTypes.html')
		.success(function(data, status, headers, config) {
			$scope.rows = data;
		})
		.error(function(data, status, headers, config) {
			alert( "failure message: " + JSON.stringify({data : data}));  // JSON.stringify() converts a JavaScript value to a JSON string
		});				

	}]);