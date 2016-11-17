
$(document).ready(
		
		function(){
			
			  $('.modal-trigger').leanModal({
			      dismissible: true, // Modal can be dismissed by clicking outside of the modal
			      opacity: .5, // Opacity of modal background
			      in_duration: 300, // Transition in duration
			      out_duration: 200, // Transition out duration
			      starting_top: '4%', // Starting top style attribute
			      ending_top: '10%', // Ending top style attribute
			      
			    }
			  );
			  
			  
			
			  $("#addFacilityButton").click(function(){
				  
				  var chipData = $("#chipsData").val();
				  //alert(chipData);
				  console.log(chipData);
				  
				  var temp = $("<div class='chip'>"+chipData+"<i class='close material-icons'>close</i></div>");
				   			    
				    $("#facilityChipArea").append(temp);
				    var ac = $("#facilityChipArea").text();
				    console.log("--"+ac);
				    
				    $("#chipsData").val('');
				    var result = ac.split("close");
				    result = result.toString();
				    console.log(result);
				    
				    var res = result.slice(0 , -1);
				    console.log(res);
				    //alert(res);
			  });
			
		
			// nav bars
			$(".button-collapse").sideNav();
			
			//table colors
			$('th').css('background-color', '#90caf9 ');
			$('th').css("text-align","middle");
			
		});

