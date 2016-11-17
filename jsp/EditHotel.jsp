<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>	
 	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>    
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
	<main>	  
		<br>
		<div class="row">
			<div class="col l3 m3 s2">.</div>
				<div class="col l8 m8 s8">  
					<h5>Listing of your hotels</h5>
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
				<div id="addHotel" class="row">
				
					<div class="col l12 sm12 m12">
					  <!-- add hotel -->
					  	<form name="hotelDetailAdd" method="post">
					  		<br><br>
							<h4>Editing Hotel</h4>
							<br><text style="color:red;">*Mandatory fields</text><br><br>
							<div class="input-field col s12 m6 l6">
								<i class="material-icons prefix">account_circle</i>
								<input id="hotelName" type="text" placeholder="" class="active" required value="${param.name}">
								<label for="hotelName">Hotel Name*</label>
							</div>
							
							<div class="row">
								<div class="input-field col s12 m12 l12">
									<i class="material-icons prefix">room</i>
									<textarea id="hotelAddress" placeholder="" class="materialize-textarea" required>${param.address}</textarea>
									<label for="hotelAddress">Address*</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12 m6 l6">
									<i class="material-icons prefix">room</i>
									<label for="hotelCity">City*</label>
									<input type="text" id="hotelCity" placeholder="" class="validate" required value="${param.city}">
								</div>
							</div>	
							
							<div class="row">
								<div class="col s12 m2 l3"></div>
								<div class="input-field col s12 m4 l3">
									<i class="material-icons prefix">supervisor_account</i>
									<label for="eRoom">Super Delux rooms</label>
									<input type="number" placeholder="" id="eRoom" class="validate" maxlength=3 required value="${param.exRoom}">
								</div>
								<div class="input-field col s12 m4 l3">
									<label for="eFare">Fare per room</label>
									<input type="number" placeholder="" id="eFare" class="validate" required value="${param.exFare}">
								</div>
								<div class="col s12 m2 l3"></div>
							</div>
							
							<div class="row">	
								<div class="col s12 m2 l3"></div>
								<div class=" input-field col s12 m2 l3">
									<i class="material-icons prefix">supervisor_account</i>
									<label for="bRoom">Delux room</label>
									<input type="number" placeholder="" id="bRoom" class="validate" value="${param.bRoom}" >
								</div>
								<div class="col s12 m4 l3">
									<label for="bFare">Fare per room</label>
									<input type="number" placeholder="" id="bFare" class="validate" value="${param.bFare}">
								</div>
								<div class="col s12 m2 l3"></div>
							</div>
							
							<div class="row">	
								<div class="col s12 m2 l3"></div>
								<div class="input-field col s12 m4 l3">
									<i class="material-icons prefix">supervisor_account</i>
									<label for="Room">Economy room</label>
									<input type="number" placeholder="" id="Room" class="validate" value="${param.ecRoom}">
								</div>
								<div class="input-field col s12 m4 l3">
									<label for="economyFare">Fare per room</label>
									<input type="number" placeholder="" id="economyFare" class="validate" value="${param.eFare}">
								</div>
								<div class="col s12 m2 l3"></div>		               
							</div>			
							
							<div class="row">
								<i class="material-icons prefix">games</i>
								<label for"facilities">Facilities</label>
								<textarea id="facilities" class="materialize-textarea">${param.facilities}</textarea>
			 				</div>
							
							<button class="btn-flat blue" type="button" id="editHotelButton">Edit Hotel</button>
							<a href="viewHotel.mvc" class="btn-flat blue" >Back</a>
								
							<br><br>	             
					  	</form>
					</div>
					
				
			</div>
			
			</div>
			<div></div>
		</div>
	</main>
	
		<!-- <footer class="page-footer blue">
		 <div class="footer-copyright">
            <div class="container">
            © 2014 Planyourtrip.com, All rights reserved.
            </div>
          </div>
        </footer> -->
	<script>
	
$(document).ready(function(){
	
var cookieValue = $.cookie("adminLogin");
 console.log("--"+cookieValue);

 if(cookieValue != "null")
 {
		
		 if(cookieValue== undefined){
			window.location.href = "jsp/HotelAdmin.jsp";
		 }
	
	$("#editHotelButton").click(function(){
		
		var hotelName = $("#hotelName").val();
		var hotelAddress = $("#hotelAddress").val();
		var hotelCity = $("#hotelCity").val();
		var flag=0;
		
		if(hotelName==""||hotelAddress==""||hotelCity==""){
			Materialize.toast("please fill out all * marked entries..",3000);
			flag=1;
		}
		
		var pattern = /[0-9]/g;
		
		var res = hotelCity.match(pattern);
		if(res!=null)
		{
			Materialize.toast("city cant be numeric",2500);
			flag=1;
		}
		
		if(flag==0)
			editHotelFunction();
	});
	
 }
 else{
	 window.location.href = "/UserModule/";
 } 
 
 
	function editHotelFunction(){
		
		var editingData = {
				hotel_id : '${param.id}',
				hotel_name : $("#hotelName").val(),
				hotel_address : $("#hotelAddress").val(),
				hotel_facilities : $("#facilities").val(),
				hotel_rooms : calculateRoom(),
				hotel_fare : calculateFare(),
				hotel_city : $("#hotelCity").val(),
				hotelAdmin : {
					adminUser_id:$.cookie("adminLogin"),
				},
	 		};
		
		editingData = JSON.stringify(editingData);
		//alert(editingData);
		URLedit = "EditOneHotel.mvc";
		
		$.ajax({
			url : URLedit,
 			method : 'POST',
 			data : {
 				string : editingData
 			},
 			success: function(data){
 				//alert(data);
 				
 				if(data == "success")
 					Materialize.toast('changes saved', 2000);
 			}
		});
	}
	
function calculateFare(){
		
		var business = $("#bFare").val();
		var executive = $("#eFare").val();
		var fare = $("#economyFare").val();
		
		if(business=="")
			business=0;
		if(executive=="")
			executive=0;
		if(fare=="")
			fare=0;
		
		 fare = (fare +","+business+","+executive);
	
	//	alert(fare);
		return fare; 
		
	}
	
	
function calculateRoom(){
		
		var business = $("#bRoom").val();
		var executive = $("#eRoom").val();
		var room = $("#Room").val();
		 
		if(business=="")
			business=0;
		if(executive=="")
			executive=0;
		if(room=="")
			room=0;
		
		 room = (room +","+business+","+executive);
	
	//	alert(room);
		return room; 
		
	}
	
	
	
		
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
 		
 		
	}//setting
				
	});//document.ready
		
	</script>	
	</body>
	
</html>