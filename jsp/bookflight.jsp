<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"
    src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
    rel="stylesheet">
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<script src="<c:url value="/resources/js" />/script.js"></script>
<script src="<c:url value="/resources/js" />/js-cookie.js"></script>
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
    .rev{
        transform:rotate(180deg);
        -webkit-transform:rotate(180deg);
        -moz-transform:rotate(180deg);
    }
    
    td{
        width: 33.33% !important;
    }
    
    .full{
        width:100%;
    }
</style>
<script>
    $("document").ready(function() {
        $(".button-collapse").sideNav({
            menuWidth : 300, // Default is 240
            edge : 'left', // Choose the horizontal origin
            closeOnClick : true
        // Closes side-nav on <a> clicks, useful for Angular/Meteor
        });
        $(function() {
            var btn = $('button');
            var progressBar = $('.progressbar');
            btn.click(function() {
                progressBar.find('li.active').next().addClass('active');
            });
        });
    });
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
                <ul id="nav-mobile" class="side-nav"
                    style="transform: translateX(-100%);">
                    <li><a href="#">Login</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i
                    class="material-icons">menu</i></a>
            </div>
        </nav>
    </div>
    <div class="row s12 m12 l9" id="booking">
        <div class="col s12 m12 l9">
            <ul class="collection with-header">
                <li class="collection-header"><h5>Review your booking</h5></li>
                <li class="collection-item">
                    <h3>Flight Details</h3>
                    <div id="infobox"></div>
                </li>
            </ul>
        </div>
    </div>
    <script>
    
    function getTime(text){
        text = new Date(text);
        var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];
        return [text.getDate(), months[text.getMonth()], text.getFullYear()].join('-');
    }
    
    function getRow(info) {
            var rowOne = '<tr>' + '<td>' +info.source+ '</td><td><i class="material-icons rev">keyboard_backspace</i></td><td>'+info.destination+'</td>' + '</tr>';
            return rowOne;
        }
        $(document)
                .on(
                        'click',
                        '.btn-here',
                        function() {
                            var data = $(this).attr("data");
                            data = JSON.parse(data);
                            console.log(data);
                            //make a JSON out of this data to be fetched to the bean
                            //make an entry for each of the segments of the flight
                            var bookID = Math.floor(Math.random() * 100);
                            for (var i = 0; i < data.length; i++) {
                                var json = {
                                    unique : Math.floor(Math.random() * 100),
                                    userId : 3,
                                    bookingId : bookID,
                                    bookingDate : new Date().getTime(),
                                    departDate : Date(),
                                    pnr : 'Hello',
                                    fare : 45600,
                                    passengerDetails : '-',
                                    flightClass : 'Economy',
                                    baggage : 'random',
                                    flightDetails : {
                                        flightId : data[i]['flight']['carrier']
                                                + data[i]['flight']['number'],
                                        airline : 'Haseena',
                                        src : data[i]['leg'][0]['origin'],
                                        dest : data[i]['leg'][0]['destination'],
                                        departureTime : data[i]['leg'][0]['departureTime'],
                                        arrivalTime : data[i]['leg'][0]['arrivalTime']
                                    }
                                }
                                $.ajax({
                                    url : '/bookingModule/saveFlight.mvc',
                                    type : 'POST',
                                    data : {
                                        string : JSON.stringify(json)
                                    },
                                    success : function(response) {
                                        console.log("Done");
                                        Materialize.toast('Flight booked successfully', 4000);
                                    },
                                    error : function(response) {
                                        console.log("Ouch");
                                        Materialize.toast('Flight could not be booked', 4000);
                                    }
                                });
                            }
                        });
        $(function() {
            $
                    .ajax({
                        url : '/planyourtrip/fetchDetail.mvc',
                        type : 'GET',
                        success : function(data) {
                            data = JSON.parse(data);
                            //console.log(data);
                            //usse this to populate information
                            //this is a specific object
                            var price = data['saleTotal'];
                            var segmentArr = data['slice'][0]['segment'];
                            var table = $("<table />");
                            //console.log(segmentArr);
                            for (var i = 0; i < segmentArr.length; i++) {
                                //create a card here about the values retrieved from the JSON
                                console.log(segmentArr);
                                var leg = segmentArr[i]['leg'][0];
                                var info = {
                                    source : leg['origin'],
                                    destination : leg['destination'],
                                    beginTime : leg['departureTime'],
                                    endTime : leg['arrivalTime']
                                }
                                table = table.append(getRow(info));
                            }
                            var btn = $("<button type = 'button' class = 'btn-here waves-effect waves-light btn red lighten-1'/>");
                            btn = btn.attr("data", JSON.stringify(segmentArr)).text("Book");
                            table = table.append($("<tr />").append($("<td class = 'full' colspan = ='3'/>").text('Departure Information ( SRC to DEST ) :  ' + getTime(segmentArr[0]['leg'][0]['departureTime']))));
                            table = table.append($("<tr />").append($("<td class = 'full' colspan = ='3'/>").text('Arrival Information ( DEST to SRC ):  '+ getTime(segmentArr[1]['leg'][0]['arrivalTime']))));
                            $("#infobox").append(table);
                            $("#infobox").append(btn);
                            console.log("He");
                        }
                    });
        });
    </script>
</body>
</html>