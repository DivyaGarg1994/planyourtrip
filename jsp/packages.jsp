<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Package Manager</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.0.js"
	integrity="sha256-slogkvB1K3VOkzAI8QITxV3VzpOnkeNVsKvtkYLMjfk="
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
</head>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDgSxPnxtKEbA8xImpuBT6gotH1iRsujX8&libraries=places"
	async defer></script>
	
<script src="<c:url value="/resources/js/jquery.cookie.js"/>"></script>
<style>
.card-image {
	max-height: 60%;
	overflow: hidden;
	height: 150px;
}

.card-title {
	background: rgba(255, 255, 255, 0.7);
	width: 100%;
}

#preloader {
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: white;
	z-index: 10;
}

#preloader .preloader-box {
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	position: absolute;
}

#hidden {
	display: none;
}

#hidable, #enter, #info-card {
	display: none;
}

.square {
	width: 200px;
	height: 150px;
	overflow: hidden;
	vertical-align: middle;
}

.carousel .carousel-item {
	height: auto;
	padding: 0.1%;
	border-radius: 2%;
}

.tiny {
	position: relative;
}

.no-bg{
	background:none;
}
#toast-container{
	position: fixed;
	top:10%;
	left:50%;
	transform:translateX(-50%);
	-webkit-transform:translateX(-50%);
	-moz-transform:translateX(-50%);
}

#p-info{
	height:250px;
	overflow-x:hidden;
	overflow-y:scroll;
}
</style>
<body>
<!-- Start of Navigation Bar -->
	<div class="navbar-fixed">
		<nav class="light-blue lighten-1" role="navigation">
			<div class="nav-wrapper">
				<a href="index.mvc" class="brand-logo">
					<img src="<c:url value='/resources/images/planyourtrip-logo-white.png'/>" style="height: 55px; width: auto; margin-top: 5px;" />
				</a>
			
				<ul class="right hide-on-med-and-down ">
					<li><a href="#loginForm" class="modal-trigger loginNav" id="loginNav">Login</a></li>
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
	<!-- End of navigation bar -->


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
					<a href="User.mvc">View Profile</a><br>
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
	<c:url value="/resources/images/package" var="packimg" />
	<c:url value="/resources/images/" var="pack" />
	<span id="hidden"></span>
	<div id="preloader" class=" valign-wrapper ">
		<div class="preloader-box valign center-align">
			<div class="preloader-wrapper big active valign">
				<div class="spinner-layer spinner-blue-only">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
			<br />
			<div class="valign">Loading...</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col s12 m12 l12">Enter your destination to find packages</div>
		</div>
		<div class="row">
			<form class="col s12 m12 l12">
				<div class="input-field col s6 m6 l6">
					<input type="text" id="destination" /> <label for="destination">Destination</label>
				</div>
				<div class="input-field col s6 m6 l6 center-align">
					<button class="btn waves-effect waves-light" type="button"
						onclick="fetchPackages();">
						Submit <i class="material-icons right disabled">done</i>
					</button>
				</div>
			</form>
		</div>
		<div class="row">
			<div class="col s12 m12 l12" id="tale"></div>
		</div>
		<div class="row" id="cardList"></div>
		<div class="row center-align" id="hidable">
			<div class="col s12 m12 l12 card-panel red lighten-1">
				<h5 class="white-text">Travel Guide</h5>
			</div>
			<div class="col s3 m3 l3 icon-click" data-attr="heritage places in ">
				<i class="material-icons tooltipped" data-position="bottom"
					data-delay="50" data-tooltip="Heritage Places">map</i>
				<div class="hide-on-med-and-up">Heritage Places</div>
			</div>
			<div class="col s3 m3 l3 icon-click" data-attr="cafes in ">
				<i class="material-icons tooltipped" data-position="bottom"
					data-delay="50" data-tooltip="Cafes">local_cafe</i>
				<div class="hide-on-med-and-up">Cafes</div>
			</div>
			<div class="col s3 m3 l3 icon-click" data-attr="parks in ">
				<i class="material-icons tooltipped" data-position="bottom"
					data-delay="50" data-tooltip="Parks">nature_people</i>
				<div class="hide-on-med-and-up">Parks</div>
			</div>
			<div class="col s3 m3 l3 icon-click" data-attr="museums in ">
				<i class="material-icons tooltipped" data-position="bottom"
					data-delay="50" data-tooltip="Museums">account_balance</i>
				<div class="hide-on-med-and-up">Museums</div>
			</div>
		</div>
		<div class = "row" id = "info-card">
		 	<div class="col s12 m6 offset-m3" >
		    	<div class="card light-blue">
		            <div class="card-content white-text">
		              <span class="card-title no-bg">Welcome!</span>
		              <p>Hey there! Choose any of the above four options, to get to know more about the place.
		           		You can search for the places of interests, cafes, parks and museums.</p>
		            </div>
		         </div>
		   	</div>
		</div>
		<div class="row center-align">
			<input type="textbox" id="enter" class="" />
 			<div class="col s12 m12 l12" id="add">
 			</div>
		</div>
	</div>

	<div id="modalFooter" class="modal modal-fixed-footer">
		<div class="modal-content">
		<div class="col s12 m12 l12">
		    <h2 class="header" id = "p-head">Package Name</h2>
		    <div class="card horizontal valign-wrapper">
		      <div class="card-image valign">
		        <img id = "p-img">
		      </div>
		      <div class="card-stacked valign">
		        <div class="card-content">
		          <p id = "p-details">Package Details</p>
		          <div class = "divider"></div>
		          <p id = "p-info">Package Information</p>
		        </div>
		      </div>
		    </div>
 		 </div>
		</div>
		<div class="modal-footer">
			<a href="#!"
				class=" modal-action modal-close waves-effect waves-green btn-flat" id = "book">Book</a>
		</div>
	</div>

	<script type="text/javascript" language="javascript">
		$(window).on('load', function() {
			$("#preloader").hide();
		});

		$(function() {
			var cookieValue=$.cookie("login");
			
			if(cookieValue==null){
				$(".logoutNav").hide();
				$(".loginNav").show();
				$(".userProfileNav").hide();
				$("#book").html("Log in to book");
			} else{
				$(".logoutNav").show();
				$(".loginNav").hide();
				$(".userProfileNav").show();
			}
			initMap();
			
		})

		function getString(days, budget) {
			return days + " days | " + "INR " + budget;
		}

		// Generic elements that shall be appended
		function makeImageCards(package) {
			var card = $("<div class = 'card' />");

			var cardImageBox = $("<div class = 'card-image waves-effect waves-block waves-light'>");
			var cardImage = $("<img class = 'responsive-img'/>");
			cardImage = cardImage.attr("src",
					"<c:out value= '${packimg}/'></c:out>" + package.image);
			cardImageBox = cardImageBox.append(cardImage);

			var cardContentText = $("<div class = 'card-title activator grey-text text-darken-4'/>");

			cardContentText = cardContentText.text(package.name);

			cardContentRow = $("<div class = 'row valigng-wrapper'/>");
			cardContentRow = cardContentRow.append($('<div class = "col s6 m6 l6 valign" />').text(
					getString(package.duration, package.budget)));
			
			var aBtnBox = $("<div class = 'col offset-s3 offset-m3 offset-l3 valign' />");
			var aBtn = $("<a class='btn-floating red darken-2 modal-trigger' />");
			aBtn = aBtn.attr("package-attr", package.packageId);
			aBtn = aBtn.attr("href","#modalFooter");
			aBtn = aBtn.attr("package-info",JSON.stringify(package));
			aBtn = aBtn.append('<i class="material-icons">more_vert</i>');
			aBtnBox = aBtnBox.append(aBtn);
			cardContentRow = cardContentRow.append(aBtnBox);

			var cardAction = $("<div class = 'card-action' />");
			cardAction = cardAction.append(cardContentRow);

			cardImageBox = cardImageBox.append(cardContentText);

			card = card.append(cardImageBox);
			card = card.append(cardAction);

			return card;
		}

		// Stuff to fetch the data from the database here
		function fetchPackages() {

			// Validate the field's value
			var cityName = $("#destination").val();

			if (cityName == null || cityName == undefined || cityName.trim() == "") {
				$("#cardList").html(
				"No packages with the above constraints found");
				return;
			}

			// Check for the value of the required field

			$("#tale").html("");
			$("#hidden").html("");

			$.ajax({
				type : 'POST',
				url : 'fetchpackage/' + $("#destination").val() + '.mvc',
				success : populateCards,
				error : function(data) {
					Materialize.toast('No packages with the above constraints found', 4000,'', function(){
						$("#destination").val("");
					});
					$("#cardList").html("");
					$("#hidable").hide();
				}
			});
		}

		function getQuote(place, tale) {
			var quote = $("<blockquote />");
			var heading = $("<h3 />");
			heading = heading.text(place);
			var taleBox = $("<p />");
			taleBox = taleBox.html(tale);

			quote = quote.append(heading).append(taleBox);
			return quote;
		}

		function populateCards(data) {
			data = JSON.parse(data);
			console.log(data);
			$("#tale").html("");
			$("#hidden").html("");
			if (data == null) {
				$("#cardList").html(
						"No packages with the above constraints found");
				return;
			} else {
				//populate the tale first
				$("#hidden").text(data['destination']);
				$("#tale").append(
						getQuote(data['destination'], data['description']));
				data = JSON.parse(data['packageList']);
				$("#cardList").html("");
				$.each(data, function(index, value) {
					console.log(value);
					var card = makeImageCards(value);
					var cardCol = $("<div class = 'col s12 m6 l6' />");
					cardCol = cardCol.append(card);
					$("#cardList").append(cardCol);
				});
				$("#hidable, #info-card").show();
			}
		}

		var API_KEY = 'AIzaSyDgSxPnxtKEbA8xImpuBT6gotH1iRsujX8';

		function initMap() {

			var enter = document.getElementById('enter');
			enter.focus();
			var geocoder = new google.maps.Geocoder();
			var city = 'New Delhi, India';
			var cityJSON = {
				'address' : city
			};
			geocoder
					.geocode(
							cityJSON,
							function(result, status) {
								if (status == google.maps.GeocoderStatus.OK) {
									var searchBox = new google.maps.places.SearchBox(
											enter);
									//DUMMY_QUERY = "heritage places in delhi";

									searchBox
											.addListener(
													'places_changed',
													function() {
														var places = searchBox
																.getPlaces();
														$("#add").html("");
														var c = $("<div class = 'carousel' id = 'carousel' />");
														places
																.forEach(function(
																		place) {
																	populateCollection(
																			c,
																			place);
																});
														//activate carousel now
														$("#add").append(c);
														c.carousel();
													});
								}
							});
		}

		function populateCollection(c, place) {
			var car = c;
			var link = $("<a class = 'carousel-item center-align black-text grey lighten-5' href='#' />");
			var img = $("<img class = 'square  z-depth-2' />");

			var photo = place['photos'];
			if (photo != undefined || photo != null) {
				var photoUrl = place['photos'][0].getUrl({
					'maxWidth' : 300,
					'maxHeight' : 300
				});
				img = img.attr("src", photoUrl);

			} else {
				img = img.attr("src", "<c:out value = '${pack}'></c:out>"+'no-image-found.jpg');
			}

			var head = $("<h5 />");
			head = head.text(place['name']);

			var body = $("<h6/>");
			body = body.text(place['formatted_address']);

			link = link.append(img).append("<br />").append(head).append(body);
			car = car.append(link);
		}

		$(".icon-click").on('click', function() {
			$("#info-card").hide();
			var enter = document.getElementById('enter');
			enter.value = $(this).attr("data-attr") + $("#hidden").text();
			google.maps.event.trigger(enter, 'focus')
			google.maps.event.trigger(enter, 'keydown', {
				keyCode : 13
			});
			return false;
		});

		/*$("a.collection-item").on('click', function(event) {
			event.preventDefault();
		});*/

		$(document).on('click', '.modal-trigger', function(e){
			e.preventDefault();
			$(".modal-trigger").leanModal({
				dismissible: true, 
			      opacity: .5,
			      in_duration: 300,
			      out_duration: 200,
			      starting_top: '4%',
			      ending_top: '10%',
			});
		})
		
		$(document).on('click', 'a.btn-floating', function(event) {
			var num = $(this).attr("package-attr");
			console.log($(this));
			var json = JSON.parse($(this).attr("package-info"));
			$.ajax({
				url : 'fetchDetail/'+num+'.mvc',
				type : 'POST',
				success: function(data){
					console.log(data);
					data = data.replace("\"","");
					$("#p-head").text(json['name']);
					$("#p-details").text(json['duration'] + ' days | INR '+ json['budget']);
					$("#p-img").attr("src","<c:out value= '${packimg}/'></c:out>"+json['image']);
					$("#p-info").html(data);
				},
				error : function(data){
				}
			})
		})
		
		$("form button.btn").click(function(event){
			event.preventDefault();
		});
		$("#book").on('click', function(event){
			event.preventDefault();
		})
	</script>
</body>
</html>
