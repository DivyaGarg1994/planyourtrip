<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<main>		
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
		<div class="col l8 m8 s18">
		  	  
		  <div class="row" id="hotels"></div>
		</div> <!-- main content div ends here -->
		
		<div class="col l1 m1 s2">
			<div class="fixed-action-btn" style="bottom:20px;">
				<a class="btn-floating btn-large red modal-trigger" href="#addHotel" >
					<i class="material-icons">add</i>
				</a>
			</div>
			
			
			<!-- add hotel modal starts  -->
			<div id="addHotel" class="modal">
				<div class="modal-content">
				
					<div class="col l12 sm12 m12">
					  <!-- add hotel -->
					 	<form name="hotelDetailAdd" method="post">
					  		<br><br>
							<h4>Adding a New Hotel</h4><BR>
							 <text style="color:red;">All * marked entries must be entered</text><br><br>
					  	
							<center><text id="errorAdd"></text></center>
							<div class="input-field col s12 m4">
								<i class="material-icons prefix">account_circle</i>
								<input id="hotelName" type="text" placeholder="" class="active validate" required>
								<label for="hotelName">Hotel Name*</label>
							</div>
							
							<div class="row">
								<div class="input-field col s12 m12 l12">
									<i class="material-icons prefix">room</i>
									<textarea id="hotelAddress" placeholder="" class="materialize-textarea" required></textarea>
									<label for="hotelAddress">Address*</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12 m12 l12">
									<i class="material-icons prefix">room</i>
									<label for="hotelCity">City*</label>
									<input type="text" id="hotelCity" placeholder="" class="validate" required>
								</div>
							</div>	
							
							<div class="row">
								<div class="col s12 m2 l3"></div>
								<div class="input-field col s12 m4 l3">
									<i class="material-icons prefix">supervisor_account</i>
									<label for="eRoom">Super Delux rooms</label>
									<input type="number" placeholder="" id="eRoom" class="validate" maxlength=3 required value=0>
								</div>
								<div class="input-field col s12 m4 l3">
									<label for="eFare">Fare per room</label>
									<input type="number" placeholder="" id="eFare" class="validate" required value=0>
								</div>
								<div class="col s12 m2 l3"></div>
							</div>
							
							<div class="row">	
								<div class="col s12 m2 l3"></div>
								<div class=" input-field col s12 m2 l3">
									<i class="material-icons prefix">supervisor_account</i>
									<label for="bRoom">Delux room</label>
									<input type="number" placeholder="" id="bRoom" class="validate" value=0 >
								</div>
								<div class="col s12 m4 l3">
									<label for="bFare">Fare per room</label>
									<input type="number" placeholder="" id="bFare" class="validate" value=0>
								</div>
								<div class="col s12 m2 l3"></div>
							</div>
							
							<div class="row">	
								<div class="col s12 m2 l3"></div>
								<div class="input-field col s12 m4 l3">
									<i class="material-icons prefix">supervisor_account</i>
									<label for="Room">Economy room</label>
									<input type="number" placeholder="" id="Room" class="validate" value=0>
								</div>
								<div class="input-field col s12 m4 l3">
									<label for="economyFare">Fare per room</label>
									<input type="number" placeholder="" id="economyFare" class="validate" value=0>
								</div>
								<div class="col s12 m2 l3"></div>		               
							</div>			
							
							<div class="row">
								<div class="input-field col s10 m4 l4">
									<i class="material-icons prefix">games</i>
									<label for="chips">Faciliies</label>
									<input type="text"  name="chips" id="chipsData">
									
								</div>
								<div class="input-field col s2 m2 l2">
									<a id="addFacilityButton" class="btn-floating waves-effect waves-light red"><i class="material-icons">add</i></a>
								</div>
								<div class="input-field col s12 m6 l6">
									<p id="facilityChipArea"></p>
								</div>
			 				</div>
							
							<button class="btn-flat blue" type="button" id="addHotelButton">Add Hotel</button>	
							<br><br>	             
					  	</form>
					</div>
					
				</div>  
				<!--  modal content ends here -->
			</div>
			<!--  add modal ends here -->
			
			<!-- hotel image modal------------------------------------------------- -->
			<div id="hotelUploadModal" class="modal">
				<div class="modal-content">
					<form action="HotelImage.mvc" id="addPost" name="addPost" method="post" enctype="multipart/form-data">
					<div class="input-field col s12">
						<div class="file-field input-field row">
							<div >
								<input type="file" id="postImage"
								name="postImage" class="col s8 m8 l8"/>
							</div>
							<div class="file-path-wrapper">
								<input class="file-path validate" type="text">
							</div>
							
						</div>
					</div>
					<button id="submitImage" type="submit" class="col s2 m2 l2">Upload</button>
						
					</form>
					<br><br>
				</div>
				<br><br>
			</div>
			<!--  ------------------- image modal ends here------------ -->
			
			
		</div>
		
		
		
	</div> <!-- row -->
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
	
//-------------[ fetch hotels ]-------------------		

	 var cookieValue = $.cookie("adminLogin");
	 console.log("--"+cookieValue);
	 if(cookieValue != "null"){
		
		 if(cookieValue== undefined){
			window.location.href = "jsp/HotelAdmin.jsp";
		 }
		 
 			$.post("viewHotels.mvc",function(data,status){
				
				var jdata = JSON.parse(data);
				console.log(jdata);
				//alert(data);
				
				//------------ looping for each set of hotels ----------
				$.each(jdata ,function printCards(key,value){
					
					
					// -- extracting the rooms------------------------
					var hotelRooms = value['hotelRooms'];
					var hotelRooms = hotelRooms.split(",");
					
					var hotelFare = value['hotelFare'];
					var hotelFare = hotelFare.split(",");
					
					
					var column = $('<div class="col l12 m12 s12" />');
						var card = $("<div class='row card z-depth-3 smallText' />");
							var image = $("<div class='img valign-wrapper col m4 s12 waves-effect waves-block waves-light'/>");
						
								if(value['hotelPhoto']=="")
									{
									var imageData = $("<br><br><img class='imgData img-responsive materialboxed col l12 m12 s12 valign'  src='<c:url value='/resources/images/hotel/3.jpg'/>' />");
									}
								else
									{
									var imageData = $("<br><br><img class='imgData img-responsive col l12 m12 s12 valign' height=150px src='<c:url value='/resources/images/'/>"+value['hotelPhoto']+".jpg'/><br><br><center><a href='#hotelUpload' data-hotelId="+value['hotelId']+" class='hotel-image hotel-image-modal'>Upload/Edit</a><br><br></center>");
									}
								var title = $("<span class='text-darken-2 normalText'>"+value['hotelName']+"</span>");
						 	var content = $('<div class="col m8 s12 card-content"/>');
								 var p = $('<p/>');
								 
								 
									
								 var table = $('<table class="responsive-table">');	
								 	var tr1 = $('<tr/>');
										var td11 = $('<td rowspan=2 class="smallText"><i class="material-icons tiny">room</i>'+value['hotelAddress']+'<br><BR><BR>City- '+value['hotelCity']+'</td>');
							      		var td12 = $('<td>'+hotelRooms[0] +' Economy rooms @ Rs.'+hotelFare[0]+' /day<br>'+hotelRooms[1] +' Delux rooms @ Rs.'+ hotelFare[1]+'/day<br>'+hotelRooms[2] +' Super Delux rooms @ Rs.'+hotelFare[2]+' /day</td>');	
							      	var tr2 = $('<tr/>');
							      		var td2 = $('<td>Facilitites provided : '+value['facilities']+'</td><td rowspan=2> <a href="EditHotel.mvc?id='+value['hotelId']+'&name='+value['hotelName']+'&address='+value['hotelAddress']+'&city='+value['hotelCity']+'&facilities='+value['facilities']+'&ecRoom='+hotelRooms[0]+'&bRoom='+hotelRooms[1]+'&exRoom='+hotelRooms[2]+'&eFare='+hotelFare[0]+'&bFare='+hotelFare[1]+'&exFare='+hotelFare[2]+'" class="btn-floating waves-effect waves-light blue right pi"><i class="material-icons">mode_edit</i></a></td>');	
					      			
										tr1.append(td11);
										tr1.append(td12);
										tr2.append(td2);
									table.append(tr1); 
									table.append(tr2);
									
								 p.append(table); 
							content.append(p); 
							
							image.append(title);
							image.append(imageData);
							
					card.append(image);
					card.append(content); 
					card.append("<br>");
				column.append(card);
					
				$('#hotels').append(column);
				
				
				
	 
				}); /* printCard ends here */
							
			}); //$.post ends here
	
			
			
			$("#hotels").on(
					"click",
					".hotel-image",
					function(event) {
						
						var id = $(event.target).attr("data-hotelId");
						//alert(abc);
						document.cookie = "hotelId="+id;
						$('#hotelUploadModal').openModal();
					});
 	 }
	 else{
		 window.location.href = "/UserModule/";
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
	 		
	 		
	}
	//----------------------------[ add hotel ]--------------------------			
	
$("#addHotelButton").click(function(){

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
		addNewHotelFunc();

	 		
});
		
	
function addNewHotelFunc(){
	
	var addData = {
			hotel_name : $("#hotelName").val(),
			hotel_address : $("#hotelAddress").val(),
			hotel_facilities : calculateChips(),
			hotel_rooms : calculateRoom(),
			hotel_photo : "hotel/no-image-found",
			hotel_fare : calculateFare(),
			hotel_city : $("#hotelCity").val(),
			hotelAdmin : {
				adminUser_id:$.cookie("adminLogin"),
			},
		};
	
		addData = JSON.stringify(addData);
		var URL = "addHotel.mvc";
		
		//alert("login>"+addData);
		$.ajax({
			
			url : URL,
			method : 'POST',
			data : {
				dataString : addData
			},
			success: function(data){
				console.log(data);
				if(data==="success"){
					$("#addHotel").closeModal();
					location.reload();
					Materialize.toast('hotel added!', 2000);
					}
				else{
					$("#errorAdd").html("Some error occured while adding your details.");
					
					}
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
	
		//alert("fare="+fare);
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
	
		//alert(room);
		return room; 
		
	}
	
	function calculateChips(){
		
		  var ac = $("#facilityChipArea").text();
		  var res=null;
		  
		  if(ac!=null){
		    console.log("--"+ac);
		    
		    $("#chipsData").val('');
		    var result = ac.split("close");
		    result = result.toString();
		    console.log(result);
		    
		    res = result.slice(0 , -1);
		    console.log("finally"+res);
		  }
		  else{
			  res = $("#chipsData").val();
		  }
		//  alert("res="+res);
		   return res;
	}
		
	

			
		}); // document.ready ends
</script>
</body>
</html>