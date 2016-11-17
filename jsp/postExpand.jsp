<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Testimonials | Plan Your Trip</title>

	<!-- Compiled and minified CSS -->
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

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
	
	<div class="container">
		<div class="card large">
			<div class="card-image">
				<img src="./images/blog_images/2.jpg" id="postImage">
				<span class="card-title" id="postTitle">Title</span>
			</div>
			<div class="card-content">
				<p style="font-size:0.8em; font-style: italic;" class="grey-text text-lighten-1" id="postUsername">by Username</p>
				<p class="grey-text text-lighten-1"><i class="material-icons" style="font-size: 0.8em">place</i>&nbsp;<span id="postLocation">Location</span></p>
				<p class="grey-text text-lighten-1"><i class="material-icons" style="font-size: 0.8em">today</i>&nbsp;<span id="postDate">Date</span></p>
				<p id="postDescription">Post Description</p>
			</div>
		</div>
		<form class="col s12" id="addCommentForm">
			<div class="row">
				<div class="input-field col s12">
					<input type="text" id="comment" length="100"><label for="comment">Post a comment</label>
				</div>
			</div>
		</form>
		<div>
			<ul class="collapsible popout" id="comments" data-collapsible="accordian">
			</ul>
		</div>
		<div id="foundNone" class="center-align">
		<p class="grey-text text-lighten-1">No comment found</p>
		</div>
		<div class="progress" id="preloader">
			<div class="indeterminate"></div>
		</div>
		<a href="#" class="waves-effect waves-light btn"
		style="width: 100%;" value="0" id="load_more">Load More</a>
	</div>


	<script src="https://code.jquery.com/jquery-3.1.0.min.js" integrity="sha256-cCueBR6CsyA4/9szpPfrX3s49M9vUU5BgtiJj06wt/s=" crossorigin="anonymous"></script>
	<!-- Compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
	<script src="<c:url value="/resources/js/jquery.cookie.js"/>"></script>
	
	<script>

		function fillPostDetails(postId){
			$.get('fetchPostDetails.mvc?postId='+postId,function(data,status){
				data=JSON.parse(data);
				$.get('resources/images/blog_images/'+data['id']+'.jpg').done(function(){
					$('#postImage').attr('src','<c:url value="/resources/images/blog_images/"/>'+data['id']+'.jpg')
				}).fail(function(){
					$('#postImage').attr('src','<c:url value="/resources/images/blog_images/"/>'+'no-image-found.jpg')
				});
				$("#postTitle").text(data['title']);
				$("#postUsername").text("by "+data['username']);
				$("#postLocation").text(data['location']);
				$("#postDate").text(data['date']);
				$("#postDescription").text(data['description']);

				
			});
		}

		function fetchComments(count,postId){

			$.get("fetchComments.mvc?count="+count+"&postId="+postId,function(data, status) {
				if (data != null) {
					data = JSON.parse(data);
					$.each(data,function(key, value) {
						var comment = $('<li/>');
						var header = $('<div class="collapsible-header"/>');
						header.append('<i class="material-icons">comment</i>'+value['comment']);
						var commentBody=$('<div class="collapsible-body"/>');
						var para=$('<p/>');
						para.append('<i class="material-icons" style="font-size: 1em;">person</i>&nbsp;Posted By '+value['username']);
						para.append('<br/>');
						para.append('<i class="material-icons" style="font-size: 1em">today</i>&nbsp;Posted on '+value['date']);
						commentBody.append(para);
						comment.append(header);
						comment.append(commentBody);
						$("#comments").append(comment);
						$("#load_more").attr('value', (parseInt($("#load_more").attr('value')) + 1))
					});
					$("#foundNone").hide();
				} else{
					$("#foundNone").show();
				}
				$("#preloader").hide();
			});
		

		}

		$(document).ready(function() {
			
			var parameter=window.location.search.replace('?','').split('=');
			var postId=parameter[1];
			$("#addCommentForm").hide();
			
			var cookieValue=$.cookie("login");
			
			if(cookieValue==null){
				$('#addCommentForm').hide();
				$(".logoutNav").hide();
				$(".loginNav").show();
				$(".userProfileNav").hide();
			} else{
				$('#addCommentForm').show();
				$(".logoutNav").show();
				$(".loginNav").hide();
				$(".userProfileNav").show();
			}

			fillPostDetails(postId);

			$("#preloader").show();
			fetchComments(parseInt($("#load_more").attr('value')),postId);
			$("#load_more").click(function(event) {
				event.preventDefault();
				$("#preloader").show();
				fetchComments(parseInt($("#load_more").attr('value')),postId);
			});

			$("#addCommentForm").on("submit",function(event){
				event.preventDefault();
				var comment=$("#comment").val();
				if(comment.length<=100){
				$.get('addComment.mvc?postId='+postId+'&comment='+comment,function(data,status){
					if(data=='success'){
						$('#load_more').attr('value','0');
						$('#comments').html('');
						fetchComments(parseInt($("#load_more").attr('value')),postId);
						 Materialize.toast('Comment added.', 4000);
						 $("#comment").val('');
						 $("#comment").blur();
					}
					else if(data=='fail'){
						 Materialize.toast('Comment failed to add.', 4000);
						 $("#comment").val('');
						 $("#comment").blur();
					}
				});
				}
			});

			$(".button-collapse").sideNav();
			$('.tooltipped').tooltip({
				delay : 50
			});
			$(".modal-trigger").leanModal();
			$('input#input_text, textarea#textarea1').characterCounter();

			$('.like').click(function(){
				if($(this).text()=='thumbs_up_down')
					$(this).text("thumb_up");
				else 
					$(this).text("thumbs_up_down")

			});
		})
	</script>

</body>
</html>