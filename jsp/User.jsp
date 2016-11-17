<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Plan Your trip</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>    
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
      <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/User.css"/>">
      
   
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>           
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>
	  <script src="<c:url value="/resources/js/User.js"/>"></script>
	  <script src="<c:url value="/resources/js/jquery.cookie.js"/>"></script>
</head>
<body>

	<div class="navbar-fixed">
		<nav class="light-blue lighten-1" role="navigation">
			<div class="nav-wrapper">
				<a href="index.mvc" class="brand-logo">
					<img src="<c:url value='/resources/images/planyourtrip-logo-white.png'/>" style="height: 55px; width: auto; margin-top: 5px;" />
				</a>
				<ul class="right hide-on-med-and-down ">		
					<li><a href="blog.mvc" id="testimonials">Testimonials</a></li>
					<li><a href="packages.mvc" id="travelPlanner">Travel Planner</a></li>		
					<li><a href="#changeSetting" class = "modal-trigger">Settings</a></li>				
					<li><a href="UserLogout.mvc">Log Out</a></li>	
				</ul>	

				<ul id="nav-mobile" class="side-nav">
					<li><a href="blog.mvc" id="testimonials">Testimonials</a></li>
					<li><a href="packages.mvc" id="travelPlanner">Travel Planner</a></li>
					<li><a href="#changeSetting" class = "modal-trigger">Setting</a></li>		
					<li><a href="UserLogout.mvc">Log Out</a></li>	
				</ul>
				<a href="#" data-activates="nav-mobile" class="button-collapse"><i
					class="material-icons">menu</i></a>
			</div>
			
		</nav>
		
	</div>
	<!-- setting change modal starts  -->
	<div id="changeSetting" class="modal">
			<div class="modal-content">
				<form class="col s12 m12 l12" id="changeSettingForm" name="changeSettingForm">
					<br><center><text id="errorSetting" style="color:red;"></text></center><br>
						<label for="settingName">Email - ID</label>
						<input name="settingName" type="text" id="settingName" required >

						<label for="settingPassword">Old Password : </label>
						<input name="settingPassword" type="password" id="settingPassword" required>
						<label for="settingPasswordRe">New Password : </label>
						<input name="settingPasswordRe" type="password" id="settingPasswordRe" required>
						
					<br><br>
					<button class="btn-flat blue col s12 m12 l12" type="button" id="settingButton" style="width:100%;">Change</button>
					
				</form>
			</div>
		</div>		
	<!-- setting change modal ends here -->
	
	<!-- login modal starts  -->
	<div id="loginForm" class="modal">
			<div class="modal-content row">
				<form class="col s8 m8 l8" style="border-right:1px solid grey;" id="userLoginForm" name="userLoginForm" action="loginValidate.mvc">
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
				<div class="col s4 m4 l4" >
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
	


 <div class="row ">
 
 	<!-- profile -->
     <div class="col s12 m8"> 
     	
        <div class="card black">
        	<div class="row valign-wrapper">
    			<div class="col s12 m3" > 
		        	<div> 
		        		<div id="pic"></div>
		        		<a data-toggle="modal" href="#uploadImage" class="modal-trigger" style="color:grey;"><center>Upload/Change</center></a>
		        		
		        		<!-- modal for image upload starts here -->
		        		<div id="uploadImage" class="modal">
							<div class="modal-content">
								<form action="UserImage.mvc" id="addPost" name="addPost" method="post" enctype="multipart/form-data">
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
									<button id="submitImage" type="submit" class="col s2 m2 l2 blue">Upload</button>
									<br><br>
								</form>
								
							</div>
							<br><br>
						</div>
		        		<!-- modal ends here -->
		        		
		        		
		        	</div>
		        </div>
		        <div class="col s12 m9"> 
		        	
	        		<div class="card-image smallText">
		              <img src="<c:url value="/resources/images/user.png"/>">
		              <span class="card-title smallText flow-text">
		              	Welcome <text id="firstName"></text>
		            		
						
						<span>
		              		&nbsp;&nbsp;<a data-toggle="modal" href="#userProfileModal" data-position="bottom" data-delay="50" data-tooltip="Make/Edit your profile" class="tooltipped flow-text btn-floating waves-effect waves-light blue right modal-trigger"><i class="material-icons">mode_edit</i></a>
						</span>
		              </span>
		            </div>           		
						
						 <!--  <a data-toggle="modal" href="#userProfileModal" class="btn-floating waves-effect waves-light red right modal-trigger"><i class="material-icons">mode_edit</i></a>
						  <br> -->
								<!-- Modal Edit User profile -->
									<div id="userProfileModal" class="modal">
									    <div class="modal-content">
									      <h4>User Details</h4>
									      <br><text style="color:red;">* marked entries are nescessary to fill</text><br><br>
									      <form  name="editUserForm" id="editUserForm" class="col s12 m12 l12" method="post">
									     
									      	<div class="row">
								               <div class="input-field col s12 m4">
								                  <input id="first_name" placeholder="First Name" name="first_name" type="text" class="active validate" required>
								                  <label for="first_name">First Name*</label>
								               </div>
								              <div class="input-field col s12 m4">
								                  <input id="middle_name" placeholder="Middle Name" name="middle_name" type="text" class="active validate" >
								                  <label for="mname">Middle Name</label>
								               </div>
								               <div class="input-field col s12 m4 ">
								                  <input id="last_name" placeholder="Middle Name" name="last_name" type="text" class="active validate" >
								                  <label for="fname">Last Name</label>
								               </div>
								            </div>
								            
								            <div class="row">
								               <div class="input-field col s12 m6 l6">
								                  <input id="email" type="email" placeholder="Email-id" name="username" class="validate" required>
								                  <label for="email">Email*</label>
								               </div>
								               <div class="input-field col s12 m6 l6">
									               <label for="mobile">Mobile Number</label>              
									               <input type="tel" placeholder="Mobile no." id="mobile" name="mobile" class="validate" maxlength=10 minlength=10 required>  
									           </div>
									           
								            </div>
								            
								            <div class="row">
								               <div class="input-field col s12">
								                  <textarea id="addressEdit" placeholder="Address" name="address" class="materialize-textarea" ></textarea>
								                  <label for="addressEdit">Address</label>
								               </div>
								            </div>	
								            
								            <div class="row">
								               <div class="input-field col s12`m3 l3">
								                  <label for="pincode">Pincode*</label>
								                  <input type="text" placeholder="Pincode" id="pincode" class="validate" minlength=6 maxlength=6 required>
								               </div>
								               <div class="input-field col s12 m3 l3">
								                  <label for="city">City</label>
								                  <input type="text" readonly placeholder="City" id="city"  class="validate" required>
								               </div>
								               <div class="input-field col s12 m3 l3">
								                  <label for="state">State</label>
								                  <input type="text" readonly id="state" placeholder="State" class="validate"  required>
								               </div>
								               <div class="input-field col s12 m3 l3">
								                  <label for="country">Country</label>
								                  <input type="text" id="country" readonly placeholder="Country"  class="validate" required>
								               </div>
								            </div>	
								            
								            <button class="btn-flat blue" type="button" id="edit">Submit
											    <i class="material-icons right">send</i>
											</button>
											<br><br>
										</form>
									    </div>
									    
									  </div> 
								<!-- user edit modal ends here -->
		                   
		        </div>
        	</div>
		</div>
	</div>
	<div class="col l4 m4 s12">
		<br>
		
				
				<ul  class="collection with-header" >
					<li class="collection-header">Make a Booking Now !!</li>
					<li class="collection-item"><a href="index.mvc">Flight</a></li>
					<li class="collection-item"><a href="index.mvc">Hotels</a></li>
					
				</ul>
				<br>
				<ul  class="collection with-header" >
					<li class="collection-header">Visit</li>
					<li class="collection-item"><a href="packages.mvc">Holiday Packages</a></li>
					<li class="collection-item"><a href="blog.mvc">Visit The travel Blog</a></li>
					
				</ul>
				
			
	</div>
			
</div> 
	
	
	<!-- bookings -->
	<!-- <div class="col s12 m6"> -->
<div class="container">	
	<br><br>
		<div class="row">
			<div class="blue" style="padding:5px;"><center><h4>Bookings</h4></center></div>
          <ul class="tabs optionTabs">
            <li class="tab col s12 m4 l4"><a class="active" href="#confirmedTab">Confirmed</a></li>
            <li class="tab col s12 m4 l4"><a href="#pendingTab">Pending</a></li>
          </ul>
        </div>
        <br>
        
        <div id="confirmedTab" class="col s12 m12 l12">
        	<div id="holidayBookData" class="row">
        		<div class="col s6 m10 l10">
        			<div class="row">
		        		<div class="col s12 m4 l4 holId">N2RDFEG62</div>
		        		<div class="col s12 m4 l4 holPlace">DEL-BLR</div>
		        		<div class="col s12 m4 l4 holDate">11 SEP,2016</div>
	        		</div>
	        	</div>
        		<div class="col s6 m2 l2">
				   <a id="cancel" class="left">Cancel</a>
				   <a id="View" class="right">View</a>
				</div>
        	</div> 
        </div>
        
        <div id="pendingTab" class="col s12 m12 l12">
        	<div id="holidayBookData" class="row">
        		<div class="col s6 m10 l10">
        			<div class="row">
		        		<div class="col s12 m4 l4 holId">N2RDFEG62</div>
		        		<div class="col s12 m4 l4 holPlace">BOM-BLR</div>
		        		<div class="col s12 m4 l4 holDate">11 SEP,2016</div>
	        		</div>
	        	</div>
        		<div class="col s6 m2 l2">
				    <a id="cancel" class="left">Cancel</a>
				   <a id="View" class="right">View</a>
				</div>
        	</div> 
        </div>
   </div>   



<!-- js -->
 <script>

 $(document).ready(function(){

	var cookieValue = $.cookie("login");
	 if(cookieValue != "null"){
		
		 if(cookieValue== undefined){
				window.location.href = "jsp/index.jsp";
			 }   
		 
			 $.get("fetchUser.mvc",function(data,status){
					//alert(data);
					var jData = JSON.parse(data);
					
					if(jData['profile_pic']!=null)
						{
						var img ="<img class='valign circle responsive-img' src='<c:url value='/resources/images/'/>"+jData['profile_pic']+".jpg'>";
						}
					else{
						var img = '<img src="<c:url value="/resources/images/profile_pic_default.jpg"/>" class="valign circle responsive-img">';
					}
					
					$('#contact').html(jData['mobile']);
					$('#firstName').html(jData['firstName']);
					$('#address').html(jData['address']);
					
					//$('#userId').val(jData['userId']);
					$('#first_name').val(jData['firstName']);
					$('#last_name').val(jData['lastName']);
					$('#middle_name').val(jData['middleName']);
					$('#addressEdit').val(jData['address']);
					$('#email').val(jData['userName']);
					$('#mobile').val(jData['mobile']);
					$('#city').val(jData['city']);
					$('#pincode').val(jData['pincode']);
					$('#state').val(jData['state']);
					$('#country').val(jData['country']);
					$("#pic").append(img);
				});
	   }
	 else{
		 
		 location.reload();
		 Materialize.toast("login first",2000);
	 }   
	 
	 
		 $("#newUserRef").click(function(){
			
			/* $("#loginForm").modal("hide"); */
			 closeExisting: false
		}); 
		
		// --------------------------------[ edit  user ]----------------------------
		$('#edit').click( function(){
					
			var fname = $("#first_name").val();
			var email =  $('#email').val();
			var pincode = $("#pincode").val();
			var flag=0;
			
			if(fname=""||email==""||pincode=="")
				{
					flag=1;
					 Materialize.toast("fill out the required entries",2000);
				}
				
			
			if(isNaN(pincode))
			{
				Materialize.toast("pincode must be number",2000);
				flag=1;
			}
			
			//alert("flag="+flag);
			if(flag==0){
				editUserDetails();
				}
		});
		
		
		function editUserDetails(){
			
			
			var editData = {
					first_name : $("#first_name").val(),
					middle_name : $("#middle_name").val(),
					last_name : $("#last_name").val(),
					username : $('#email').val(),
					mobile : $("#mobile").val(),
					address : $("#addressEdit").val(),
					userPincode : {
						pincode : $("#pincode").val(),
						state : $("#state").val(),
						city : $("#city").val(),
						country : $("#country").val(),
					},
				
				};
			var URL ="editUser.mvc";
			
			editData = JSON.stringify(editData);
			
			console.log(editData);
			
			$.ajax({
				url : URL,
				method : 'POST',
				data : {
					string : editData
				},
				success: function(data){
					console.log(data);
					$("#userProfileModal").closeModal();
					window.location.href="UserPage.mvc";
				}
			});
			
		}
	
//----------------------------[ setting user ]-----------------------------		
		$("#settingButton").click(function(){
			
			var name = $("#settingName").val();
			var str1 = $("#settingPassword").val();
			var str2 = $("#settingPasswordRe").val();
			var flag=0;
			//alert(name + "-"+str1+"-"+str2);
			if(name=="" || str1=="" || str2==""){
				flag=1;
				//alert("flag"+flag);
			}
			
			if(flag == 1)
				{
				//alert();
				 Materialize.toast("please enter valid entries..",2000);
				}
			else{
				setUser();
			}
		});
		
		
		
		function setUser(){
			
			
	 		var settingData = {
	 			username : $("#settingName").val(),
	 			password : $("#settingPassword").val()
	 		};
	 		
	 		settingData = JSON.stringify(settingData);
	 		var URLsetting = "settingValidate.mvc";
	 		
	 		$.ajax({
	 			url : URLsetting,
	 			method : 'POST',
	 			data : {
	 				string : settingData
	 			},
	 			success: function(data){
	 				console.log("after checking "+data);
	 				//alert(data);
	 				
	 				if(data === "success"){
	 					
	 					var settingData2 = {
	 							username :$("#settingName").val(),
	 				 			password : $("#settingPasswordRe").val()
	 					}
	 					
	 					settingData2 = JSON.stringify(settingData2);
	 			 		var URLset = "setting.mvc";
	 					
	 			 		URLset
	 			 		$.ajax({
		 			 			url : URLset,
		 			 			method : 'POST',
		 			 			data : {
		 			 				string2 : settingData2
		 			 			},
		 			 			success: function(data2){
		 			 				console.log("after update "+data2);
		 			 				$("#changeSetting").closeModal();
		 			 		
		 			 				if(data2 ==="success")
		 			 					Materialize.toast('changes saved', 3000);
		 			 				else
		 			 					Materialize.toast('enter valid entries', 3000);
		 			 			}
	 			 			
	 			 		});
	 					
	 				}// if
	 				else{
	 					$("#errorSetting").html("Incorrect password or user name");
	 				}
	 			}// callback function
	 			
	 		});
			
		}
//-----------------------[ new user ] --------------------
/* 
	$("#newUserButton").click(function(){
	 		
			alert("login");
	 		var loginData = {
	 			username : $("#newUserName").val(),
	 			password : $("#newUserpassword").val()
	 		};
	 		
	 		loginData = JSON.stringify(loginData);
	 		var URL = "newUser.mvc";
	 		
	 		alert("login>"+loginData);
	 		$.ajax({
	 			
	 			url : URL,
	 			method : 'POST',
	 			data : {
	 				string1 : loginData
	 			},
	 			success: function(data){
	 				console.log(data);
	 			}
	 		});
	 		
	 	});*/
		
	});//.ready ends here

 	 
 
</script>
</body>
</html>