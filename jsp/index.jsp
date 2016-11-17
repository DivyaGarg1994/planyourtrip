<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PlanYourTrip</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link rel="stylesheet" href="resources/css/style.css" type="text/css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<script src="<c:url value="resources/js/script.js"/>"></script>
<script src = "<c:url value="resources/js/jquery.cookie.js"/>"></script>
<script src = "<c:url value="resources/js/data.js"/>"></script>
<script src = "<c:url value="resources/js/return.js"/>"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script>
	$("document").ready(function() {

		$(".modal-trigger").leanModal();

		$(".button-collapse").sideNav({

			menuWidth : 300, // Default is 240
			edge : 'left', // Choose the horizontal origin
			closeOnClick : true
		// Closes side-nav on <a> clicks, useful for Angular/Meteor
		});
	$("#hotelSearch").on('click', function() {
			
			//$.get("jsp/hotelSearch.mvc?city="+$("#hotelCity").val(),function(data,status){
				
			var  city = $("#hotelCity").val();
			//alert(city);
			window.location = "jsp/hotels1.jsp?city="+city;	
			  
			//});		
		});  


		$(".datepicker").pickadate({
			selectMonths : true,
			// Creates a dropdown to control month
			selectYears : 15
		// Creates a dropdown of 15 years to control year

		});

		$(".dropdown-button").dropdown({
			inDuration : 300,
			outDuration : 225,
			hover : true,
			gutter : 0,
			belowOrigin : false,
			alignment : 'left'
		});

		$("select").material_select();
		//expressSearch(); //for single
		
		returnSearch();//for return trip
	});
</script>

</head>


<body>
	<div class="navbar-fixed">
		<nav class="light-blue lighten-1" role="navigation">
			<div class="nav-wrapper">
				<a href="index.mvc" class="brand-logo">
					<img src="<c:url value='/resources/images/planyourtrip-logo-white.png'/>" style="height: 55px; width: auto; margin-top: 5px;" />
				</a>
			
				<ul class="right hide-on-med-and-down ">
					<li><a href="#loginForm" class="modal-trigger loginNav">Login</a></li>
					<li><a href="UserPage.mvc" class="userProfileNav">User Profile</a></li>
					<li><a href="blog.mvc" class="testimonials">Testimonials</a></li>
					<li><a href="packages.mvc" class="travelPlanner">Travel Planner</a></li>
				
					<li><a href="UserLogout.mvc" class="logoutNav">Logout</a></li>
				</ul>

			
				<ul id="nav-mobile" class="side-nav">
					<li><a href="#loginForm" class="modal-trigger loginNav">Login</a></li>
					<li><a href="UserPage.mvc" class="userProfileNav">User Profile</a></li>
					<li><a href="blog.mvc" class="testimonials">Testimonials</a></li>
					<li><a href="packages.mvc" class="travelPlanner">Travel Planner</a></li>
				
					<li><a href="UserLogout.mvc" class="logoutNav">Logout</a></li>
				</ul>
				<a href="#" data-activates="nav-mobile" class="button-collapse"><i
					class="material-icons">menu</i></a>
			</div>

		</nav>
	</div>

	<!-- login modal starts  -->
	<div id="loginForm" class="modal">
			<div class="modal-content row">
				<form class="col s12 m8 l8" style="border-right:1px solid grey;" id="userLoginForm" name="userLoginForm" action="loginValidate.mvc">
					<br><center><text id="errorLogin" style="color:red;"></text></center><br>
					<!-- <button class="waves-effect waves-light btn col s12 m12 l12" type="button" onclick = "signUpGoogle()" id="googleButton" style="width:100%;background-color:red;">Login with Google</button>
					<br><br> -->
						<label for="username">Email - ID : </label>
						<input name="username" type="email" id="username" required >

						<label for="pass">Password : </label>
						<input name="password" type="password" id="password" required>

					<br><br>
					<button class="btn-flat blue col s12 m12 l12" type="submit" id="loginButton" style="width:100%;">Login</button>
					
				</form>
				<div class="col s12 m4 l4" >
					<a href="HotelAdmin.mvc">Login as admin</a><br>
					<a href="#newUser" id="newUserRef" data-dismiss="modal" class = "modal-trigger">New user? Register</a>
				</div>
			</div>
		</div>		
	<!-- login modal ends here -->
	
	
	<!-- new user modal starts  -->
	<div id="newUser" class="modal">
			<div class="modal-content">
				<form class="col s12 m12 l12" id="newUserForm" name="newUserForm" action="newUser.mvc">
					<br><br>
					<!-- <button class="waves-effect waves-light btn col s12 m12 l12" type="button" onclick = "signUpGoogle()" id="googleButton" style="width:100%;background-color:red;">Login with Google</button>
					<br><br> -->
						<label for="username">Email - ID for new user: </label>
						<input name="username" type="email" id="username" required >

						<label for="password">Password : </label>
						<input name="password" type="password" id="password" required>

					<br><br>
					<button class=" btn-flat blue col s12 m12 l12" type="submit" style="width:100%;">Register</button>
					
				</form>
			</div>
		</div>		
	<!-- new user modal ends here -->
	<div class="bg-image">
		<div>
			<div class="container-fluid content">
				<div class="container bookingForms">
					<div class="row">
						<div class="col s12">
							<ul class="tabs">
								<li class="tab col s1"><a class="active" href="#flightForm">Flights</a></li>
								<li class="tab col s1"><a href="#hotelForm">Hotels</a></li>
							</ul>
						</div>
					</div>


					<div class="row">
						<div id="flightForm">
							<form class="col s12">
								<fieldset>
									<input name="bookType" type="radio" id="test1" checked /> <label
										for="test1">One Way</label> <input name="bookType"
										type="radio" id="test2" /> <label for="test2">Round
										Trip</label>
								</fieldset>

								<fieldset>
									<div class="input-field col s6">
										<label for="depCity">FROM</label> <input
											placeholder="Departure City" id="depCity" type="text"
											class="validate">

									</div>
									<div class="input-field col s6">
										<label for="arrCity">TO</label> <input
											placeholder="Arrival City" id="arrCity" type="text"
											class="validate">
									</div>
								</fieldset>

								<fieldset>
									<div class="input-field col s3">
										<label for="depDate">Set Departure Date</label><br> <input
											type="date" class="datepicker" id="depDate">
									</div>
									<div class="input-field col s3">
										<label for="arrDate">Set Arrival Date</label> <input
											type="date" class="datepicker" id="arrDate">
									</div>

									<div class="input-field col s2">
										<label for="adult">ADULT(12+ YRS)</label> <input type="number"
											id="adult" value="1">

									</div>
									<div class="input-field col s2">
										<label for="child">CHILD(2-11 YRS)</label> <input
											type="number" id="child" value="0">

									</div>
									<div class="input-field col s2">
										<label for="infant">INFANT(0-2 YRS)</label> <input
											type="number" id="infant" value="0">

									</div>
								</fieldset>
								<fieldset>
									<div class=" col s3">
										<label for="classes">Class</label> <select id="classes">
											<option value="class1">Economy</option>
											<option value="class2">Premium Economy</option>
											<option value="class3">Business</option>
										</select>
									</div>
								</fieldset>

								<fieldset>
									<button class="waves-effect waves-light btn" id="flightSearch">
										<i class="material-icons left">search</i>Search
									</button>
								</fieldset>

							</form>

						</div>

						<div id="hotelForm">
							<form class="col s12">


								<fieldset>
									<div class="input-field col s6">
										<label for="hotelCity">Select City</label> <input
											placeholder="Type City Name" id="hotelCity" type="text"
											class="validate">

									</div>

								</fieldset>

							

								<fieldset>
									<a class="waves-effect waves-light btn" id="hotelSearch"><i
										class="material-icons left">search</i>Search</a>
								</fieldset>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class = "row">
		<div class = "col s12 m12 l12" id = "result">
			
		</div>
	</div>
	<script type="text/javascript">
		iter = 0;
		function expressSearch() {
			var request = {
					  "request": {
						    "slice": [
						      {
						        "origin": $("#depCity").val(),
						        "destination": $("#arrCity").val(),
						        "date": new Date($("#depDate").val()).getTime(), //timestamping
						      }
						    ],
						    "passengers": {
						      "adultCount": parseInt($("#adult").val()),
						      "infantInSeatCount": parseInt($("#infant").val()),
						      "childCount": parseInt($("#child").val()),
						    },
						    "solutions": 1,
						    "maxPrice": "INR50000"
						  }
						}

			console.log(request);

		/*$.ajax({
				type : "POST", 
				dataType : 'json', 
				data : JSON.stringify(request),
				url : "https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyDgSxPnxtKEbA8xImpuBT6gotH1iRsujX8",
				contentType : 'application/json',
				success : populateEntries,
				error : function(msg) {
				console.log(msg);
				}
			});
		*/
		
		
$("#hotelSearch").on('click', function() {
			
			//$.get("jsp/hotelSearch.mvc?city="+$("#hotelCity").val(),function(data,status){
				
			var  city = $("#hotelCity").val();
			//alert(city);
			window.location = "jsp/hotels1.jsp?city="+city;	
			  
			//});		
		});  

		
		
		var data = respq;
		$("#result").html("");
		populateEntries(data, '#result', '', false);
		}
		
		function g(){
			return $("<td />");
		}
		
		function clean(value){
			if(value < 10) return '0'+value;
			return value;
		}
		
		function format(date){
			date = new Date(date);
			return clean(date.getHours()) + ' : ' + clean(date.getMinutes());
		}
		
		function roundToTwo(num) {    
		    return +(Math.round(num + "e+2")  + "e-2");
		}
		
		function createRow(data, flight, radio, name){
			
			var row = $("<tr />");
			
			if(radio == true){
				iter++;
				
				var form = $("<span />");
				
				form = form.append($("<input type = 'radio'/>").attr({
					"id" : iter,
					"name" : name,
					"value" : iter,
					"string" : JSON.stringify(flight)
				})).append($('<label />').attr("for",iter));
				
				var cell = g().append(form);
				
				row = row.append(cell);
			}
			
			row = row.append(g().text(data['carrierInfo']));
			
			row = row.append(g().text(format(data['depTime'])));
			
			row = row.append(g().text(format(data['arrTime'])));
			
			var dep = new Date(data['depTime']).getTime();
			var arr = new Date(data['arrTime']).getTime();
			
			var hours = roundToTwo((arr - dep)/3600000);
			
			row = row.append(g().text(hours + ' h'));
			
			row = row.append(g().text(data['carrierPrice']));
			
			if(radio == false){
				var ajaxButton = $("<button type = 'button' class = 'showFlightAjax waves-effect waves-light btn red darken-1'/>");
				ajaxButton = ajaxButton.attr({
					"data-id" : 1,
					"data-string" : JSON.stringify(flight)
				}); //hardcoded for now, makes absolutely no sense when harcoded
				ajaxButton = ajaxButton.text('Book now');
				row = row.append(g().append(ajaxButton));
			}
			
			return row;
		}
		
		$(document).on('click', '.showFlightAjax', function(){
			//send it by ajax
			$.ajax({
				type : 'POST',
				data : {
					JSON : $(this).attr("data-string")
				},
				url : '/bookingModule/fillPage.mvc',
				success : function(response){
					if(response == 'OK'){
						window.location.href = '/bookingModule/jsp/bookflight.jsp';
					}
					else{
						alert("Some error occurred");
					}
				}
			});
		});
		
		function populateEntries(response) {
			console.log(response);
			//create an array of desired stuff
			var table = $("<table class = 'border highlight centered responsive-table'/>");
			var headings = ['Carrier', 'Departure', 'Arrival', 'Duration', 'Price',''];
			var thead = $("<thead />");
			var tr = $("<tr />")
			headings.forEach(function(head){
				tr = tr.append($("<th />").text(head));
			});
			thead = thead.append(tr);
			table = table.append(thead);
			var array = response['trips']['tripOption'];
			console.log(array);
			array.forEach(function(flight){
				console.log(flight);
				//corresponds to the number of search results
				var segments = flight['slice'][0]['segment'];
				var contentJSON = {
						//carrierInfo : segment['flight']['carrier'] + segment['flight']['number'],
						depTime : segments[0]['leg'][0]['departureTime'],
						arrTime : segments[segments.length - 1]['leg'][0]['arrivalTime'],
						carrierPrice : flight['saleTotal']
					}
				var row = createRow(contentJSON, flight);
				table = table.append(row);
			});
			$("#result").append(table);
		}
		
		function returnSearch(){
			var requestFirst = {
					  "request": {
						    "slice": [
						      {
						        "origin": $("#depCity").val(),
						        "destination": $("#arrCity").val(),
						        "date": new Date($("#depDate").val()).getTime(), //timestamping
						      }
						    ],
						    "passengers": {
						      "adultCount": parseInt($("#adult").val()),
						      "infantInSeatCount": parseInt($("#infant").val()),
						      "childCount": parseInt($("#child").val()),
						    },
						    "solutions": 1,
						    "maxPrice": "INR50000"
						  }
						}
			
			var requestSecond =
				{
					  "request": {
						    "slice": [
						      {
						        "origin": $("#arrCity").val(),
						        "destination": $("#depCity").val(),
						        "date": new Date($("#arrDate").val()).getTime(), //timestamping
						      }
						    ],
						    "passengers": {
						      "adultCount": parseInt($("#adult").val()),
						      "infantInSeatCount": parseInt($("#infant").val()),
						      "childCount": parseInt($("#child").val()),
						    },
						    "solutions": 1,
						    "maxPrice": "INR50000"
						  }
						}

			console.log(requestFirst);
			console.log(requestSecond);
			
			//AJAX call here
			$("#result").html("");
			$("#result").append("<div class = 'col s6 m6 l6' id = 'firstTable'/>");
			$("#result").append("<div class = 'col s6 m6 l6' id = 'secondTable'/>");
			$("#result").append("<div class = 'col s12 m12 l12 center-text' id = 'finalBtn' />");
			iter = 0;
			populateEntries(one, "#firstTable", 'left', true);
			populateEntries(two, "#secondTable", 'right', true);
			$("#finalBtn").append($("<button type = 'button' class = 'waves-effect waves-light btn'/>").text("Book Now"));
		}
		
		$(document).on('click', '#finalBtn', function(){
			var left = $("input[name = 'left']:checked");
			var right = $("input[name = 'right']:checked");
			if(left.length == 1 && right.length == 1){
				var ljson = left.attr("string");
				var rjson = right.attr("string");
				ljson = JSON.parse(ljson);
				rjson = JSON.parse(rjson);
				console.log("D");
				console.log(rjson);
				var finalj = ljson;
				finalj['slice'][0]['segment'].push(rjson['slice'][0]['segment'][0]);
				console.log(finalj);
				$.ajax({
					type : 'POST',
					data : {
						JSON :JSON.stringify(finalj)
					},
					url : '/bookingModule/fillPage.mvc',
					success : function(response){
						if(response == 'OK'){
							window.location.href = '/bookingModule/jsp/bookflight.jsp';
						}
						else{
							alert("Some error occurred");
						}
					}
				});
			}
		})
		
		function populateEntries(response, base, name, radio) {
			console.log(response);
			//create an array of desired stuff
			var table = $("<table class = 'border highlight centered responsive-table'/>");
			var headings = ['','Carrier', 'Departure', 'Arrival', 'Duration', 'Price',''];
			var thead = $("<thead />");
			var tr = $("<tr />")
			headings.forEach(function(head){
				tr = tr.append($("<th />").text(head));
			});
			thead = thead.append(tr);
			table = table.append(thead);
			var array = response['trips']['tripOption'];
			console.log(array);
			array.forEach(function(flight){
				console.log(flight);
				//corresponds to the number of search results
				var segments = flight['slice'][0]['segment'];
				var contentJSON = {
						carrierInfo : segments[0]['flight']['carrier'] + segments[0]['flight']['number'],
						depTime : segments[0]['leg'][0]['departureTime'],
						arrTime : segments[segments.length - 1]['leg'][0]['arrivalTime'],
						carrierPrice : flight['saleTotal']
					}
				var row = createRow(contentJSON, flight, radio, name);
				table = table.append(row);
			});
			$(base).append(table);
		}
		$(function(){
			var cookieValue = $.cookie("login");
			if(cookieValue != null){
				$(".logoutNav").show();
				$(".loginNav").hide();
				$(".userProfileNav").show();
			}
			else{
				$(".logoutNav").hide();
				$(".loginNav").show();
				$(".userProfileNav").hide();
			}
		});
	</script>
</body>
</html>