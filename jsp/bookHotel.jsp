<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- <link rel="stylesheet" href="resources/css/style1.css" type="text/css"> -->

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<!-- <script src="resources/js/script.js"></script> -->


<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script>
	$("document").ready(function() {

		$(".datepicker").pickadate({
			selectMonths : true,
			// Creates a dropdown to control month
			selectYears : 15,	
			// Creates a dropdown of 15 years to control year
			min : true
		});
		
/* 	$("#CIDate").datepicker({
		onSet: function (dateStr) {
	    var min = $(this).datepicker('getDate'); // Get selected date
	    $("#CODate").datepicker('option', 'minDate', min || '1')
	}
	}); */
	});
	</script>
</head>

<body>

	<h1>Hotel Booking Details</h1>
	<div class="container">
	
	
<!-- 		<div class="row">
        <div class="col s12 m7">
          <div class="card">
            <div class="card-image">
              <img src="images/sample-1.jpg">
              <span class="card-title">Card Title</span>
            </div>
            <div class="card-content">
            
            
            </div>
            <div class="card-action">
              <a href="#">Book</a>
            </div>
          </div>
        </div>
      </div> -->	
	<div class="row">

			<p id="name">Hotel Name :</p>

			<p id="address">Hotel Address :</p>

			<p id="city">Hotel City :</p>

			<p id="facilities">Hotel Facilities :</p>
	</div>
	<br>
	<form id="hotelForm">
	<div class= "row">
	<div class = "col s8">
		<div class="input-field col s4">
				<label for="checkIn_date">Check In Date</label><br> 
				<input	type="date" class="datepicker" id="CIDate" required>
		</div>	
				<div class="input-field col s4">
				<label for="checkOut_date">Check Out Date</label><br> 
				<input	type="date" class="datepicker" id="CODate" required>
		</div>	
		
		<div class = "input-field col s4">
		</div>	
	
	</div>
	</div>
		
				<div class="row" id = "rooms">
				
				<div class = "col s12">
					<p class="col s3">Room 1</p>
					<div class="input-field col s3">
						<select id="class1">
							<option value="0" disabled>Choose your option</option>
							<option selected="selected" value="1">Economy</option>
							<option value="2">Premiuim</option>
							<option value="3">Business</option>
						</select>
											 <label for="class">Class</label>
						
					</div>
					<div class="col s6">
						<input class="input-field col s3" type="number" id="adult1" min = "1" max= "6" value="1"> 
													<label for="adult">Adult</label>
											
					
						<input class="input-field col s3" type="number" id="child1" min = "0" max= "4"value="0">
					
						<label for="child">Child</label>	
						

					</div>
				</div>
				</div>
				
				<div class = "col s12">
					<label for="fare">Fare</label>
					<p id="fare"></p>
				</div>
				
				<div class = "row">
					<a href = "" class = "btn waves-effect waves-light" id="addRoom">Add Hotel</a>
				</div>

					<input type = "button" class = "btn waves-effect waves-light" id="book" value = "Book">

			
			</form>

</div>
				
			
			
<script type="text/javascript">
		function getFare(fare) {
			//alert(fare);
			/* var adultsFare = fare * adults;
			var childFare = children * fare;
			var infantsFare = (1 / 4) * infants * fare;
 
			var totalFare = adultsFare + infantsFare + childFare;
*/
			//alert(totalFare);
			return fare;

		}
 
		$("document").ready(
				function() {

					var parameter = window.location.search.replace('?', '').split('=');
					var id = parameter[1];
					//alert(id);
					var jData;
					$.get("bookHotel.mvc?id=" + id, function(data, status) {
						//alert(data);

						jData = JSON.parse(data);

						var id1 = parseInt(jData['hotelId']);
						//alert(id1);
						var name = jData['hotelName'];

						var address = jData['hotelAddress'];
						var facilities = jData['facilities'];
						var rooms = jData['hotelRooms'];
						var photos = jData['hotelPhoto'];
						var fare = jData['hotel_fare'];
						var city = jData['hotel_city'];
						$('#name').append(name);

						$('#address').append(address);

						$('#city').append(city);

						$('#facilities').append(facilities);

						var fareArr = fare.split(',');
						//alert(fareArr);
						//alert($('#class').val());
						var opt = parseInt($('#class1').val()) - 1;
						//alert(opt)
						var total = parseInt(fareArr[opt]);
						//alert(total);

						//$("#fare").html($("#fare").html + total);
						$("#fare").append(total);

					});

					$('select').material_select();
					
					var i = 1;
					
					$("#addRoom").click(function(event){
							
						i++;
						if(i>5){
							$("#addRoom").remove();	
						}
						else {
						var col = $('<div class="col s12" />');
						var roomNo = $('<p class="col s3">Room '+i+'</p>');
						
						var select = $('<div class="input-field col s3"> <select id="class"> <option value="0" disabled>Choose your option</option><option selected="selected" value="1">Economy</option><option value="2">Premiuim</option><option value="3">Business</option></select> <label for="class">Class</label></div>');
						var persons = $('<div class="col s6"><input class="input-field col s3" type="number" id="adult" min = "1" max= "6" value="1"> <label for="adult">Adult</label><input class="input-field col s3" type="number" id="child" min = "0" max= "4"value="0"><label for="child">Child</label></div>');
						
						
						col.append(roomNo);
						col.append(select);
						col.append(persons);
						$("#rooms").append(col);
						$('select').material_select();
						}
						event.preventDefault();

					});
					
					$("#book").click(function() {
						
						var bookHotel = {
//							bookingId : Math.floor(Math.random() * 100),
							 	hotelDetails : {
									hotel_id : parseInt(jData['hotelId'])
								},
								user:{
									
									username : 'dg@gmail.com'
								}, 
			/* 					hotel_id : parseInt(jData['hotelId']),
								username : 'dg@gmail.com', */
								
								checkInDate : $("#CIDate").val(),
								checkOutDate : $("#CODate").val(),
								noRooms : "1,0,0",
								hotelClass : 'Econ',
								status : 'Avail',
								customerDetails : 'LL'
						};
						
						var URL = "bookStatus.mvc";
						
						var bookHotel1 = JSON.stringify(bookHotel);
						
						console.log(bookHotel1);
						
						$.ajax({
							url : URL,
							method : 'POST',
							data : {
								string : bookHotel1
							},
							success: function(data){
								console.log(data);
									//$("#userProfileModal").closeModal();
							},
							error : function(data){
								console.log(data);
								console.log('Delhi');
							}
						});
						
					}); 

				});
	</script>
</body>
</html>