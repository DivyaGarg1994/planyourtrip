
$(document).ready(function(){
	
	 $("select").material_select();
	 
	 $(".button-collapse").sideNav({

			menuWidth : 300, // Default is 240
			edge : 'left', // Choose the horizontal origin
			closeOnClick : true
		// Closes side-nav on <a> clicks, useful for Angular/Meteor
		});
	 

	 
	  $('.modal-trigger').leanModal({
	      dismissible: true, // Modal can be dismissed by clicking outside of the modal
	      opacity: .5, // Opacity of modal background
	      in_duration: 300, // Transition in duration
	      out_duration: 200, // Transition out duration
	      starting_top: '4%', // Starting top style attribute
	      ending_top: '10%', // Ending top style attribute
	      
	    }
	  );
	
	
	/*var confirm = $('#confirmation').html();
	
	if(confirm=="confirmed")
		$('#confirmation').css("color","green");
	else if(abc=="waiting")
		$('#confirmation').css("color","#B9770E");
	else
		$('#confirmation').css("color","red");
	
	
	var bookedDetails = $('#bookedDetails').val();
		alert(bookedDetails);
		$('#notBookedMsg').html('');
	
	$('#About_Rewards').hide();
	$('#rewardConditions').click(function(){
		$('#About_Rewards').slideToggle("milliseconds");
		
	});
	
	
	$('#request').hide();
	$('#newComplaint').click(function(){
		$('#request').slideToggle("milliseconds");
		
		if($('#newComplaint').html()=="New Request")
			$('#newComplaint').html("Cancel");
		else
			$('#newComplaint').html("New Request");
	});*/
});