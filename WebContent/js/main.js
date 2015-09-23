$(document).ready(function() {
	
	/********************** Calculator Section **********************/
	// Initialize the tooltip on calculator page
	$('[data-toggle="tooltip"]').tooltip();

	// Click function for Calculate button on calculator page
	$("#calculatorBtn").click(function() {
		if ($("#calculateForm").valid()) {  // form validation
			$("#calculatorNav a[href='#resultPane']").trigger("click");
		}
	});
	
	// Auto fade out alert block
	window.setTimeout(function() {
	    $(".alert-short").fadeTo(1500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 2500);  // stay for 2.5 seconds
	window.setTimeout(function() {
	    $(".alert-normal").fadeTo(1500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 10000);  // stay for 10 seconds
	window.setTimeout(function() {
	    $(".alert-long").fadeTo(1500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 15000);  // stay for 15 seconds
});

