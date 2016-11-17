<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>



<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- <link rel="stylesheet" href="resources/css/style1.css" type="text/css">
 -->
<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<!-- <script src="resources/js/script.js"></script>
 -->

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<style>
.card.horizontal{
height : 300px;
}
.card-image {
	width : 400px;
}
</style>
<body>

<h1>Hotels</h1>

<div class = "container" id="hotelDetails">

</div>

<script type = "text/javascript">
	
	
function fillCard(value, card, cardContent,i) {
	var hotelName = $('<p style="font-size: 2em; font-style: bold;" class="blue-text text-darken-2"/>');
	hotelName.append(value['hotelName']);

	var address = $('<p class="grey-text text-lighten-1"/>');
	address.append('<i class="material-icons" style="font-size: 1em">place</i>&nbsp;');
	address.append(value['hotelAddress']);


	var facilities = $('<p class="grey-text text-lighten-1"/>');
	facilities.append('<br><p class = "blue-text text-lighten-1">Facilities</p>');
	facilities.append('<i class="material-icons" style="font-size: 1em">wifi</i>&nbsp;');
	facilities.append("wifi");
	facilities.append('<i class="material-icons" style="font-size: 1em">pool</i>&nbsp;');
	facilities.append("pool");

	
	cardContent.append(hotelName);
	cardContent.append(address);
	cardContent.append(facilities);

	card.append(cardContent);
/* 
	var cardReveal = $('<div class="card-reveal"/>');
	var revealTitle = $('<span class="card-title grey-text text-darken-4"/>');
	revealTitle.append(value['title'] + '<i class="material-icons right">close</i>');
	cardReveal.append(revealTitle);
	cardReveal.append($('<p/>').append(value['description']));

	card.append(cardReveal);
*/
	var cardAction = $('<div class="card-action"/>');
	/* cardAction.append('<a href="#" class="activator"><i class="material-icons">expand_less</i></a>');
	cardAction.append('<a href="./postExpand.jsp?postid='+value['id']+'">Comment</a>');
 */	
 	cardAction.append('<button class="waves-effect waves-light btn bookHotel" id = "book'+i+'" value = '+value['hotelId']+'>Book</button>')
 	card.append(cardAction);
	$('#hotelDetails').append(card);


}
	
function fetchHotels() {
	
	
	
	var parameter = window.location.search.replace('?','').split('=');
	var city=parameter[1];
	alert(city);
	$.get("hotelSearch.mvc?city="+city,function(data,status){
		
			var i = 1;

			var jData = JSON.parse(data);
			$.each(jData,function(key,value) {
				
				var id = value['hotelId'];
				alert(id);
				var name = value['hotelName'];
				var address = value['hotelAddress'];
				var facilities = value['facilities'];
				var rooms  = value['hotelRooms'];
				var photos = value['hotelPhoto'];
				var fare = value['hotel_fare'];
				var city = value['hotel_city'];
				
	//Cards
	
					var card = $('<div class="card horizontal hoverable small"/>');
					var cardContent = $('<div class="card-content"/>');
					$.get('/bookingModule/resources/images/hotels/'	+ id	+ '.jpg').done(function() {
						card.addClass('medium');
						var cardImage = $('<div class="card-image"/>');
						var postImage = $('<img src="<c:url value="/resources/images/hotels/"/>'+id+'.jpg"'+' class="activator"/>');
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
			
			
	});

}
	
$("document").ready(function(){

	fetchHotels();
	
/* $(".btn").click(function(){
		$.get("bookHotel.mvc?id="+$(this).attr('value'),function(data,status){
			alert("success");
		});
	});  */
	
/* 	$("#hotelDetails").on('click','.btn', function() {
		$.get("bookHotel.mvc?id="+$(this).attr('value'),function(data,status){
			alert("success");
		});
	});
 */

	$("#hotelDetails").on('click','.btn', function() {
		
		//$.get("bookHotel.jsp?id="+$(this).attr('value'),function(data,status){
			//alert("success");
			
			var  id = $(this).attr('value');
			//alert(city);
			window.location = "bookHotel.jsp?id="+id;
		//});		
	});

 
 
 /* 	$(".btn.bookHotel").click(function(){
		window.location.href = "bookHotel.mvc";
	});	 */
	
	/* $("#book1").click(function(){
		var id = $(this).attr('value');
		var URL = "jsp/bookHotel.mvc";
		
		$.ajax({
			url : URL,
			method : 'GET',
			data : {
				int : id
			},
			success: function(id){
				console.log("Book : Hotel ID - "+id);
				alert(id);
			}
		}); 
	}); */
});
</script>
</body>
</html>