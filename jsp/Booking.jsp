<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
     <meta name="viewport" content="width=device-width, initial-scale=1">      
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
      <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/HotelAdmin.css"/>">
      
   
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>           
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>
	   <script src="<c:url value="/resources/js/HotelAdmin.js"/>"></script>
	  <script src="<c:url value="/resources/js/jquery.cookie.js"/>"></script>
	   
</head>
<title>Hotel Admin</title>
</head>
<body>
	<nav style="background-color:#1b79d5;">
		    <div class="nav-wrapper">
		      <a href="index.mvc" class="brand-logo">
					<img src="<c:url value='/resources/images/planyourtrip-logo-white.png'/>" style="height: 55px; width: auto; margin-top: 5px;" />
				</a>
		      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
		      <ul class="right hide-on-med-and-down">
		        <li><a href="#changeSetting" class = "modal-trigger">Settings</a></li>
		        <li><a href="hotelAdmin.mvc" >Sign Out</a></li>
		      </ul>
		      <ul class="side-nav" id="mobile-demo">
		        <li><a href="#changeSetting" class = "modal-trigger">Settings</a></li>
		        <li><a href="hotelAdmin.mvc" >Sign Out</a></li>
		      </ul>
		    </div>
		  </nav>
			
			
		  <!-- setting change modal starts  -->
	<div id="changeSetting" class="modal">
			<div class="modal-content">
				<form class="col s12 m12 l12" id="changeSettingForm">
					<br><center><text id="error" style="color:red;"></text></center><br>
						<label for="settingName">Email - ID</label>
						<input name="settingName" type="text" placeholder="email-id" id="settingName" required >

						<label for="oldPassword">Old Password : </label>
						<input name="oldPassword" type="password" id="oldPassword" required>
						<label for="newPassword">New Password : </label>
						<input name="newPassword" type="password" id="newPassword" required>
						
					<br><br>
					<button class="btn-flat blue col s12 m12 l12" type="button" id="adminSettingButton1" style="width:100%;">Change</button>
					
				</form>
			</div>
		</div>		
	<!-- setting change modal ends here -->
		  
	
	<br>	  
	<div class="row">
		<div class="col l3 m3 s2">.</div>
				<div class="col l8 m8 s8">  
					<h5>Bookings</h5>
				</div> 
			<div class="col l1 m1 s2"></div> 
	</div>
	<div class="row">
		<div class="col l3 m3 s12">
				
						<ul class="collection" style="padding:10px;">
							<li class="collection-header">Quick links</li>
							<li class="collection-item"><a href="booking.mvc">Bookings</a></li>
							<li class="collection-item"><a href="viewHotel.mvc">Hotels</a></li>
						</ul>
				
		</div>
		<div class="col l8 m8 s12">
		  	  
		  <!-- bookings -->
		  <div id="bookings">
		  			<div class="row">
			          <ul class="tabs">
			            <li class="tab col s13 m3 l3"><a href="#confirmedBooking">Confirmed Bookings</a></li>
			            <li class="tab col s13 m3 l3"><a class="active" href="#pendingBooking">Pending Bookings</a></li>
			          </ul>
			        </div>
			        <div id="confirmedBooking" class="col s12 m12 l12">
			        	<table class="table" id="booked">
							<thead>
								<tr>
									<th>Booking Id</th>
									<th>Hotel</th>
									<th>Room Type</th>
									<th>Requested<br>rooms</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1234adv</td>
									<td>Taj Palace1</td>
									<td>Executive<br>Business</td>
									<td>2<br>1</td>
								</tr>
								<tr>
									<td>1234adv</td>
									<td>Taj Palace</td>
									<td>Executive<br>Business</td>
									<td>2<br>1</td>
								</tr>
							</tbody>
						</table>
			        </div>
			        
			        <div id="pendingBooking" class="col s12 m12 l12">
						<table class="table" id="waiting">
							<thead>
								<tr  class="center-align">
									<th>Booking Id</th>
									<th class="center-align">Hotel</th>
									<th>Room Type</th>
									<th>Requested<br>rooms</th>
									<th class="center-align">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1234adv</td>
									<td>Taj Palace1</td>
									<td>Executive<br>Business</td>
									<td>2<br>1</td>
									<td class="row">
									<a id="bookAccept" href="#" style="color:green;padding:5px;" class="left col l6 m6 s12">Confirm</a>
									<a id="bookReject" href="#" style="color:red;padding:5px;" class="right col l6 m6 s12">Deny</a>
									</td>
								</tr>
								<tr>
									<td>1234adv</td>
									<td>Taj Palace</td>
									<td>Executive<br>Business</td>
									<td>2<br>1</td>
									<td class="row">
									<a id="bookAccept" href="#" style="color:green;padding:5px;" class="left col l6 m6 s12">Confirm</a>
									<a id="bookReject" href="#" style="color:red;padding:5px;" class="right col l6 m6 s12">Deny</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
		  	
		  </div>
		  
		  
		  
		  
		  
		</div>
		<div></div>
	</div>
	
	<!-- <footer class="page-footer blue">
		 <div class="footer-copyright">
            <div class="container">
            © 2014 Planyourtrip.com, All rights reserved.
            </div>
          </div>
        </footer> -->
	<script>
		
	
	//-----------------------------[ COOKIE ]-------------------------------
	
	$(document).ready(function(){
		
		var cookieValue = $.cookie("adminLogin");
		 console.log("--"+cookieValue);

		 if(cookieValue == "null")
		 {
				
			 window.location.href = "/UserModule/";
		 }
		
	});
	
	//--------------------------------[ setting change ]---------------------

	$("#adminSettingButton1").click(function(){
		
		//settingName
		var name = $("#settingName").val();
		var oldPass = $("#oldPassword").val();
		var newPass = $("#newPassword").val();
		var flag=0;
		
		if(name==""||oldPass==""||newPass=="")
			{
				Materialize.toast("please enter all the fields",2500);
				flag=1;
			}
		if(oldPass == newPass){
			Materialize.toast("new password should be different from old password",2000);
			flag=1;
		}
		
		if(flag==0)
			changePasswordFunction();
		
	});
		

	function changePasswordFunction(){
		
		
		var settingData = {
	 			admin_name : $("#settingName").val(),
	 			admin_password: $("#oldPassword").val()
	 		};
	 		
	 		settingData = JSON.stringify(settingData);
	 		var URLsetting = "adminLoginValidate.mvc";
	 		
	 		$.ajax({
	 			url : URLsetting,
	 			method : 'POST',
	 			data : {
	 				string : settingData
	 			},
	 			success: function(data){
	 				console.log("after checking "+data);
	 				
	 				
	 				if(data === "success"){
	 					
	 					var settingData2 = {
	 							admin_name :$("#settingName").val(),
	 				 			admin_password : $("#newPassword").val()
	 					}
	 					
	 					settingData2 = JSON.stringify(settingData2);
	 			 		var URLset = "adminSetting.mvc";
	 					
	 			 		URLset
	 			 		$.ajax({
		 			 			url : URLset,
		 			 			method : 'POST',
		 			 			data : {
		 			 				string2 : settingData2
		 			 			},
		 			 			success: function(data2){
		 			 				console.log("after update "+data2);
		 			 				
		 			 				if(data === "success")
		 			 				{
		 			 					$('#changeSetting').closeModal();

		 				 			Materialize.toast('password changed!', 1000);
		 				 			}
		 			 			}
	 			 			
	 			 		});
	 					
	 				}// if
	 				else{
	 					$("#error").html("Incorrect password or username");
	 					
	 				}
	 			}// callback function
	 			
	 		});
	 		
	 		
	}
	
	</script>
</body>
</html>