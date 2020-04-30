<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Requested Bookings | TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/static/style/AfterLoginStyle.css"/>
"rel="stylesheet">
<link href="<c:url value="/resources/static/style/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/static/js/jquery-3.3.0.min.js" />"></script>
<script src="<c:url value="/resources/static/js/bootstrap.min.js" />"></script>

</head>
<body>
<div class="header">
   <a href="adminHome" class="logo">TAP CAB</a>
 
  <div class="header-right">
  <a href="adminHome" >HOME</a>
    <a href="passengerList" >PASSENGER DETAILS</a>
    <a href="showBookingRequest" onclick="return false" class="active">BOOKING DETAILS</a>
        <a href="showCabDetailsForm">ADD/VIEW CAB</a>
    <a href="listContactUsForms" >CONTACT-US FORM DATA</a>
	<a href="/TapCab" onclick="if (!(confirm('Are you sure you want to Logout?'))) return false">LOGOUT</a>
 
 </div>
</div>
<div class="col-md-offset-1 col-md-10">
		<div align="center"></div>
		<img src="<c:url value="/resources/static/images/Niit logo small.png"/>" />
	</div>
<div class="container">

	<div class="col-md-offset-1 col-md-10">
	<div align="center">
	</div>
		<div class="panel panel-info">
			<div class="panel-heading">
							
				<div class="col-md-offset-1 col-md-10">
				<h1 align="center">ALL BOOKINGS</h1></div>
				<div align="center" style="color:red"><b>${error}</b></div>
				<hr color="pink" size="5" />
				
			</div>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered">
					<tr>
						<th>Booking Id</th>
						<th>Booking Date  </th>
						<th>Pick Up City</th>
						<th>Destination City</th>
						<th>Car Type</th>
						<th>Passenger Name</th>
						<th>Passenger Phone</th>
						<th>Ride Status</th>
						<th>Action</th>
					</tr>
					<!-- loop over and print our customers -->
					<c:forEach var="tempcab" items="${cabBooking}">

						<!-- construct an "delete" link with customer id -->
						<c:url var="accept" value="/setBookingStatus">
							<c:param name="bookingId" value="${tempcab.bookingId}" />
						</c:url>

						<tr>
							<td>${tempcab.bookingId}</td>
							<td>${tempcab.pickUpDate}</td>
							<td>${tempcab.getAddress().pickUpCity}</td>
							<td>${tempcab.getAddress().destiCity}</td>
							<td>${tempcab.carType}</td>
							<td>${tempcab.name}</td>
							<td>${tempcab.phoneNo}</td>
							<td>${tempcab.status}</td>
							
							<td> <a href="${accept}">Accept/Reject</a></td>

						</tr>

					</c:forEach>

				</table>

			</div>
		</div>
	</div>

	
	


</body>
</html>