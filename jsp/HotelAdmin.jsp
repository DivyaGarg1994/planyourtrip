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
</head>
<title>Hotel Admin</title>
</head>
<body class="admin" style="background-color:black;">
<div class="row">
	<div class="col s12 m3 l3">.</div>
		<div class="col s12 m6 l6">
			<table  class="login" style="background-color:#f5f5f5;">
				<tr><td colspan=2 class="blue" style="width:100%;" ><center><b>REGISTERED USERS LOGIN</b></center></td></tr>
				<tr style="background-color:#eeeeee ;"><td><i class="material-icons prefix">account_circle</i>User Name : </td><td><input type="text" id="userName" class="text2" required style="background-color:white;"></td></tr>
				<tr style="background-color:#eeeeee ;"><td><i class="material-icons prefix">lock_outline</i>Password : </td><td><input type="password" id="password" class="text2" required style="background-color:white;"></td></tr>
				<tr>
					<td colspan=2><button type="button" id="loginButton" value="LOGIN" class="btn-flat blue "  style="width:100%;">Login</button>
					<center>
						<text style="color:red;" id="error"></text>
						<a href="#addNewAdmin" class="modal-trigger left">New User? Register</a>
						<a href="index.mvc" class="right">Go back</a>
					</center>
					</td>
				</tr>
			</table>
		</div>
	<div class="col s12 m3 l3">.</div>
</div>


	<div id="addNewAdmin" class="modal">
			<div class="modal-content">
				<form class="col s12 m12 l12" name="addNewAdmin" action="newAdminUser.mvc">
					<br><br>
						<label for="admin_name">Email - ID for new user: </label>
						<input name="admin_name" type="text" id="admin_name" required focus>

						<label for="admin_password">Password : </label>
						<input name="admin_password" type="password" id="admin_password" required>

					<br><br>
					<button class="waves-effect waves-light btn col s12 m12 l12" type="submit" id="newAdminUserButton" style="width:100%;">Register</button>
					
				</form>
			</div>
	</div>
	
<script>
	
	$(document).ready(function(){
		
		$("#loginButton").click(function(){
			
			//alert("login");
			var loginData = {
		 			admin_name : $("#userName").val(),
		 			admin_password : $("#password").val()
		 		};
		 		
		 		loginData = JSON.stringify(loginData);
		 		var URL = "adminLoginValidate.mvc";
		 		
		 		//alert("login validating ->"+loginData);
		 		$.ajax({
		 			
		 			url : URL,
		 			method : 'POST',
		 			data : {
		 				string : loginData
		 			},
		 			success: function(data){
		 				//alert(data);
		 				console.log(data);
		 				
		 				if(data === "success")
		 					window.location.href = "viewHotel.mvc";
		 				else
		 					 Materialize.toast("Please enter correct credentials",2000);
		 			}
		 		});
		});
	});

</script>

</body>
</html>