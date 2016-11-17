<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PlanYourTrip</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link rel="stylesheet" href="resources/css/style1.css" type="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script type="text/javascript">
	$("document").ready(function() {
	    $('.modal-trigger').leanModal();
		
		$(".button-collapse").sideNav({

			menuWidth : 300, // Default is 240
			edge : 'left', // Choose the horizontal origin
			closeOnClick : true
		// Closes side-nav on <a> clicks, useful for Angular/Meteor
		});
	    
	    $(".datepicker").pickadate({
			selectMonths : true, 
		// Creates a dropdown to control month
			selectYears : 15
		// Creates a dropdown of 15 years to control year

		});
	    
	    $("select").material_select();

	});
	
	

		$(function(){
		var card = $('<div class="card horizontal"/>');
		var  p = $('<p />');
		var content= $('<div class="card-content col s12"/>');
		
		var table = $('<table class="responsive-table">');	
	 	var tr = $('<tr/>');
			var td1 = $('<td class = "col s2">Logo</td>');
			var td2 = $('<td class = "col s2">DepTime</td>');
			var td3 = $('<td class = "col s2">ArrTime</td>');
			var td4 = $('<td class = "col s2">Duration</td>');
			var td5 = $('<td class = "col s2">Price</td>');
			var td6 = $('<td class = "col s2"><button class="waves-effect waves-light btn">Book</button></td>');
			var i  = 0;
			tr.append(td1);
			tr.append(td2);
			tr.append(td3);
			tr.append(td4);
			tr.append(td5);
			tr.append(td6);
			table.append(tr);
			p.append(table);
			content.append(p);
			card.append(content);
			for(i = 0 ; i< 10 ; i++) {

			$('#allFlights').append(card);
			}
		});
			/* 	 <div class='card horizontal'>
			      <div class="card-stacked">
			        <div class="card-content">
			          <p>I am a very simple card. I am good at containing small bits of information.</p>
			        </div>
			        <div class="card-action">
			          <a href="#">This is a link</a>
			        </div>
			      </div>
			    </div>	
		"
	 */	
</script>

</head>
<body>

	<div class="navbar-fixed">
		<nav class="light-blue lighten-1" role="navigation">
			<div class="nav-wrapper container">
				<a id="logo-container" href="#" class="brand-logo ">PlanYourTrip</a>
				<ul class="right hide-on-med-and-down dropdown-button"
					data-activates="loginForm">
					<li><a href="#">Login</a></li>
				</ul>

				<ul id='loginForm' class="dropdown-menu">
				</ul>

				<ul id="nav-mobile" class="side-nav"
					style="transform: translateX(-100%);">
					<li><a href="#">Login</a></li>
				</ul>
				<a href="#" data-activates="nav-mobile" class="button-collapse"><i
					class="material-icons">menu</i></a>
			</div>
		</nav>
	</div>

	<div class="row">
		<div class="col s3">
			<!-- <div class="container" id="filterContainer"> -->
			<ul class="collapsible" id="filters" data-collapsible="expandable">
				<li>
					<div class="collapsible-header active">
						<i class="material-icons">attach_money</i><b>Price</b>
					</div>
					<div class="collapsible-body">
						<p>This is first section.</p>
					</div>
				</li>
				<li>
					<div class="collapsible-header active">
						<i class="material-icons">schedule</i><b>Depart Time</b>
					</div>
					<div class="collapsible-body">
						<p>This is second section.</p>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class="material-icons">pan_tool</i><b>Stops</b>
					</div>
					<div class="collapsible-body">
						<p>This is third section.</p>
					</div>
				</li>

				<li>
					<div class="collapsible-header">
						<i class="material-icons">flight</i><b>Airlines</b>
					</div>
					<div class="collapsible-body">
						<p>This is fourth section.</p>
					</div>
				</li>
			</ul>
		</div>

		<div class="col s9">
		<div class="search">
			<p align="center">
				Search Details
				<a class="waves-effect waves-light btn modal-trigger"
					id="modifySearch" href = "#modSearchForm">
					<i class="material-icons left">search</i>Modify
				</a>
			</p>
		
			<div id="modSearchForm" class="modal">
				<div class="modal-content">
				<form class="col s12">
					<fieldset>
						<input name="bookType" type="radio" id="test1" checked /> <label
							for="test1">One Way</label> <input name="bookType" type="radio"
							id="test2" /> <label for="test2">Round Trip</label> <input
							name="bookType" type="radio" id="test3" /> <label for="test3">Multi
							- City</label>
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
						<div class="col s3">
							<label for="depDate">Set Departure Date</label><br> <input
								type="date" class="datepicker" id="depDate">
						</div>
						<div class="col s3">
							<label for="arrDate">Set Arrival Date</label> <input type="date"
								class="datepicker" id="arrDate">
						</div>

						<div class="col s2">
							<label for="adult">ADULT(12+ YRS)</label> <input type="number"
								id="adult" value="1">

						</div>
						<div class="col s2">
							<label for="child">CHILD(2-11 YRS)</label> <input type="number"
								id="child" value="0">

						</div>
						<div class="col s2">
							<label for="infant">INFANT(0-2 YRS)</label> <input type="number"
								id="infant" value="0">

						</div>
					</fieldset>
					<fieldset>
						<div class="col s3">
							<label for = "classes">Class</label>
							<select id= "classes">
								<option value="class1">Economy</option>
								<option value="class2">Premium Economy</option>
								<option value="class3">Business</option>
							</select> 
						</div>
					</fieldset>
					<fieldset>
						<button class="waves-effect waves-light btn"><i class="material-icons left">search</i>SEarch</button>
					</fieldset>

				</form>
				</div>

			</div>
		</div>
		</div>
		
		<div class="col s9" >
 	<div class = "col s12" id="allFlights">
		</div>
		</div>
		</div>
</body>
</html>