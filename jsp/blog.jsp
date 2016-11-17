<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Testimonials | Plan Your Trip</title>

	<!--Start of CSS-->
	<!-- MaterializeCss - Compiled and minified CSS -->
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

	<!-- Material icons Google font -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<!--End of CSS-->
</head>
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
	
	<!-- Start of Floating Action Button -->
	<div class="container" id="fab">
		<div class="fixed-action-btn" style="bottom: 45px; right: 45px;">
			<a class="tooltipped btn-floating btn-large waves-effect waves-light red modal-trigger" data-position="left" data-delay="50" data-tooltip="Share your experience" href="#modal1">
				<i class="material-icons">add</i>
			</a>
		</div>
	</div>

	<!-- End of Floating action button -->

	<!-- Add post modal -->
	<div id="modal1" class="modal">
		<!--Modal Content-->
		<div class="modal-content">
			<!--Modal Title-->
			<h5>Share Your Experience</h5>
			<!--Start of Add post form-->
			<form class="col s12" action="addImage.mvc" id="addPost" name="addPost" method="post" enctype="multipart/form-data">

				<input type="hidden" id="postId" name="postId" value="0"/>

				<!--Title field-->
				<div class="row">
					<div class="input-field col s12">
						<input type="text" id="title" name="title" length="200" required />
						<label for="title">Title</label>
					</div>
				</div>

				<!--Location & Date of trip field-->
				<div class="row">
					<!--Location field-->
					<div class="input-field col s6">
						<input type="text" id="location" name="location" class="validate" required />
						<label for="location">Location</label>
					</div>
					<!--Date of trip field-->
					<div class="input-field col s6">
						<input type="date" id="date" name="date" class="datepicker"
						required /> <label for="date">Date of trip</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<textarea id="description" name="description"
						class="materialize-textarea" length="500" required></textarea>
						<label for="description">Experience</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<div class="file-field input-field">
							<div class="btn">
								<span>Cover Image</span> <input type="file" id="postImage"
								name="postImage" />
							</div>
							<div class="file-path-wrapper">
								<input class="file-path validate" type="text">
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<a href="#" class="modal-action modal-close waves-effect waves-blue btn-flat">Cancel</a>
			<a href="#"	class="modal-action waves-effect waves-blue btn-flat" id="addPostButton">Add</a>
		</div>
	</div>
	<!--End of add post modal-->

	<div class="container">
		<div class="row">
			<!--Posts div-->
			<div class="col s12">
				<div class="row">
					<form id="searchForm">
						<div class="input-field col s8">
							<input type="text" id="search" name="search"/><label for="search">Search</label>
						</div>
					</form>
					<div class="input-field col s4">
						<select id="search-type" name="search-type">
							<option value="Title">Title</option>
							<option value="location">Location</option>
							<option value="description">Description</option>
						</select>
						<label>Search Criteria</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="posts">
		</div>
		<div class="progress" id="preloader">
			<div class="indeterminate"></div>
		</div>
		<div id="foundNone" class="center-align">
			<p class="grey-text text-lighten-1">Loading posts</p>
		</div>
		<a href="#" class="waves-effect waves-light btn"
		style="width: 100%;" value="0" id="load_more">Load More</a>
	</div>
</div>
</div>


<script src="https://code.jquery.com/jquery-3.1.0.min.js" integrity="sha256-cCueBR6CsyA4/9szpPfrX3s49M9vUU5BgtiJj06wt/s=" crossorigin="anonymous"></script>
<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<script src="<c:url value="/resources/js/jquery.cookie.js"/>"></script>

<script>

	//Function to fill a post card
	function fillCard(value, card, cardContent) {
		var username = $('<p style="font-size: 0.8em; font-style: italic;" class="grey-text text-lighten-1"/>');
		username.append('by ' + value['username']);

		var location = $('<p class="grey-text text-lighten-1"/>');
		location.append('<i class="material-icons" style="font-size: 0.8em">place</i>&nbsp;');
		location.append(value['location']);

		var date = $('<p class="grey-text text-lighten-1"/>');
		date.append('<i class="material-icons" style="font-size: 0.8em">today</i>&nbsp;');
		date.append(value['date']);

		cardContent.append(username);
		cardContent.append(location);
		cardContent.append(date);

		card.append(cardContent);

		var cardReveal = $('<div class="card-reveal"/>');
		var revealTitle = $('<span class="card-title grey-text text-darken-4"/>');
		revealTitle.append(value['title'] + '<i class="material-icons right">close</i>');
		cardReveal.append(revealTitle);
		cardReveal.append($('<p/>').append(value['description']));

		card.append(cardReveal);

		var cardAction = $('<div class="card-action"/>');
		cardAction.append('<a href="#" class="activator"><i class="material-icons">expand_less</i></a>');
		cardAction.append('<a href="postExpand.mvc?postid='+value['id']+'">Comment</a>');
		card.append(cardAction);

		$('#posts').append(card);
		$("#load_more").attr('value', (parseInt($("#load_more").attr('value')) + 1))
	}

	//Function to fetchPosts
	function fetchPosts(count,searchCriteria,searchString) {
		$.get("fetchPosts.mvc?count="+count+"&searchCriteria="+searchCriteria+"&searchString="+searchString,function(data, status) {
			if (data!=null) {
				data = JSON.parse(data);
				$.each(data,function(key, value) {
					var card = $('<div class="card hoverable"/>');
					var cardContent = $('<div class="card-content"/>');
					$.get('resources/images/blog_images/'	+ value['id']	+ '.jpg').done(function() {
						card.addClass('medium');
						var cardImage = $('<div class="card-image"/>');
						var postImage = $('<img src="<c:url value="/resources/images/blog_images/"/>'+value['id']+'.jpg"'+' class="activator"/>');
						var title = $('<span class="card-title activator"/>');
						title.append(value['title']);
						cardImage.append(postImage);
						cardImage.append(title);
						card.append(cardImage);
						fillCard(value,card,cardContent);
					}).fail(function() {
						var title = $('<span class="card-title activator"/>');
						title.append(value['title']);
						cardContent.append(title);
						fillCard(value,card,cardContent);
					});
				});
				$("#preloader").hide();
				$("#foundNone").hide();
			}
		});
		
	}
	
	function setSearchCriteria(){
		if($.trim($("#search").val()).length==0){
			return "none";
		} else{
			return $("#search-type").val();
		}
	}
	
	function setSearchString(){
		if($.trim($("#search").val()).length==0){
			return "none";
		}
		else{
			return $("#search").val();
		}
		
	}
	
	function addPostValidate(){
		if($.trim($("#title").val()).length==0){
			$("#title").addClass("invalid");
			return false;
		}
			
		if($.trim($("#location").val()).length==0){
			$("#location").addClass("invalid");
			return false;
		}
		if($.trim($("#date").val()).length==0){
			$("#date").addClass("invalid");
			return false;
		}
		if($.trim($("#description").val()).length==0){
			$("#description").addClass("invalid");
			return false;
		}
		
		$("#title,#location,#date,#description").removeClass("invalid");
		return true;
	}

	$(document).ready(function() {
		
		$("#fab").hide();
		
		var cookieValue=$.cookie("login");
		
		if(cookieValue==null){
			$('#fab').hide();
			$(".logoutNav").hide();
			$(".loginNav").show();
			$(".userProfileNav").hide();
		} else{
			$('#fab').show();
			$(".logoutNav").show();
			$(".loginNav").hide();
			$(".userProfileNav").show();
		}
		
		$('select').material_select();

		$(document).on('click','.activator,#load_more',function(event){
			event.preventDefault();
		});

		$("#searchForm").submit(function(event){
			event.preventDefault();
			$("#posts").html('');
			$("#load_more").attr('value',0);
			
			fetchPosts(parseInt($("#load_more").attr('value')),setSearchCriteria(),setSearchString());

		});

		$('#addPostButton').click(function(event) {
			event.preventDefault();
			if(addPostValidate()){
			$.post('addPost.mvc',{title: $("#title").val(),location: $("#location").val(),date: $("#date").val(),description: $("#description").val()},function(data,status){
				$("#postId").val(data);
				$("#addPost").submit();
			});
			}
		});

		$("#preloader").show();
		
		fetchPosts(parseInt($("#load_more").attr('value')),"none","none");
		$("#load_more").click(function() {
			$("#preloader").show();
			fetchPosts(parseInt($("#load_more").attr('value')),setSearchCriteria(),setSearchString());
		});


		$(".button-collapse").sideNav();
		$('.tooltipped').tooltip({delay : 50});
		$(".modal-trigger").leanModal();
		$('.datepicker').pickadate({
				selectMonths : true, // Creates a dropdown to control month
				selectYears : 10,
				max: new Date()
			// Creates a dropdown of 15 years to control year
		});

		$('input#input_text, textarea#textarea1').characterCounter();
	});
</script>
</body>
</html>
