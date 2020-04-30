<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<title>My Trips | TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/static/style/AfterLoginStyle.css"/>
"rel="stylesheet">
<link href="<c:url value="/resources/static/style/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/static/js/jquery-3.3.0.min.js" />"></script>
<script src="<c:url value="/resources/static/js/bootstrap.min.js" />"></script>


</head>


<body background="<c:url value="/resources/static/images/mytripsback.jpg"/> "/>

<div class="header">

   <c:url var="updateLink" value="/loginHome">		
   <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
	   <a href="${updateLink}"  class="logo">TAP CAB</a>
 
  <div class="header-right">
   
   
    <a href="${updateLink}">HOME</a>
    
     <c:url var="bookingForm" value="/viewBookingForm">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>   
    <a href="${bookingForm}" >BOOK CAB</a>
    
    <c:url var="myTripsLink" value="/myTrips">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
    <a href="${myTripsLink}" >MY TRIPS</a>
    
    <c:url var="updateLink1" value="/myInfo">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
    <a href="${updateLink1}">MY INFO</a>
   
    <c:url var="aboutLink" value="/afterLoginAboutUs">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
	<a href="${aboutLink}">ABOUT US</a>
	
	
    <c:url var="contactLink" value="/afterLoginContactUs">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
    <a href="${contactLink}" >CONTACT US</a>
    
    
	<a href="/TapCab" onclick="if (!(confirm('Are you sure you want to Logout?'))) return false">LOGOUT</a>
 
 </div>
</div>

	<div class="container">
	<div class="col-md-offset-1 col-md-10">
	<div align="center">
	</div>
		<div class="panel panel-info">
			<div class="panel-heading" align="center">
				<div class="col-md-offset-1 col-md-10"><h1 align="center">Trip History</h1></div>
				<hr color="black" size="3" />
				<div style="color: red"><b>${error1}</b></div>
			</div>
			<div class="panel-body" align="center">
				<table class="table table-striped table-bordered">
					<tr>
						<th>Booking Id</th>
						<th>Booking Date</th>
						<th>Pick Up City</th>
						<th>Destination City</th>
						<th>Car Type</th>
						<th>Fare</th>
						<th>Ride Status</th>
						<th>Action</th>
					</tr>
					<!-- loop over and print our customers -->
					<c:forEach var="tempcab" items="${cabBooking}">

						<!-- construct an "delete" link with customer id -->
						<c:url var="allDetail" value="/allDetail">
							<c:param name="bookingId" value="${tempcab.bookingId}" />
						</c:url>

						<tr>
							<td><b>${tempcab.bookingId}</b></td>
							<td><b>${tempcab.pickUpDate}</b></td>
							<td><b>${tempcab.getAddress().pickUpCity}</b></td>
							<td><b>${tempcab.getAddress().destiCity}</b></td>
							<td><b>${tempcab.carType}</b></td>
							<td><b>${tempcab.fare}</b></td>
							<td><b>${tempcab.status}</b></td>
								
							<td><a href="${allDetail}" ><b> Trip Details</b></a></td>
						
							
						</tr>

					</c:forEach>

				</table>

			</div>
		</div>
	</div>

</div>
	
	
</body>
</html>





















