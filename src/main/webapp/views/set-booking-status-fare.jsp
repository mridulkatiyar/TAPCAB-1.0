<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Set Status | TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/static/style/BookingFormStyle1.css"/>"
	rel="stylesheet">
</head>
<body>

<div class="header">
	   <a href="#"  class="logo">TAP CAB</a>
	  <a href="showBookingRequest">BOOKING DETAILS</a>
</div>
<!------------------------------------------------------------------------------------------------------------->

    <div class="clearfix">
         	<c:url var="rejectBookingRequest" value="/rejectBookingRequest">		
   			<c:param name="bookingId" value="${cabBooking.bookingId}" /></c:url>
       <a href="${rejectBookingRequest}"> <button  class="signupbtn" ><b>Reject Booking</b></button></a>
      </div>


 <form class="modal-content" action="saveBookingFare" modelAttribute="cabBooking" method="post">
    <div class="container">
      <h3>Enter Ride Fare & Booking  Status </h3>
      <hr>
      
      <label><font color="green"><b>Ride Fare</b></font></label>
      <input type="number" placeholder="Enter fare" name="fare" required="required">
      
       
      <label for="bookingId"><b>Booking Id</b></label>
      <input type="number" placeholder="Enter Name" name="bookingId" required="required" value="${cabBooking.bookingId}" readonly="readonly">
         
      
      <label for="name"><b>Name</b></label>
      <input type="text" placeholder="Enter Name" name="name" required="required" value="${cabBooking.name}" readonly="readonly"><br>

     <label for="phoneNo"><b>Phone No.</b></label>
      <input type="text" placeholder="Enter Phone No." name="phoneNo"  value="${cabBooking.phoneNo}"  readonly="readonly"><br>

      <label for="address"><b>Pickup Address</b></label><br>
      <input id="pickUpAddress" type="text" placeholder="Address Line" name="pickUpAddress" required="required" value="${cabBooking.getAddress().pickUpAddress}"  readonly="readonly">
      
 <label for="address"><b>City</b></label>
      <input id="pickUpCity" type="text" placeholder="City" name="pickUpCity" required="required"value="${cabBooking.getAddress().pickUpCity}"  readonly="readonly"><br>
      
      
<label for="address"><b>State</b></label>
      <input id="pickUpState" type="text" placeholder="State" name="pickUpState" required="required" value="${cabBooking.getAddress().pickUpState}"  readonly="readonly">


 <label for="address"><b>Postal/Zip Code</b></label>
     <input id="pickUpPinCode" type="text" placeholder="Postal/ZipCode" name="pickUpPinCode" required="required" value="${cabBooking.getAddress().pickUpPinCode}"  readonly="readonly"><br>

       <label for="daddress"><b>Destination Address</b></label><br>
      <input id="destiAddress" type="text" placeholder="Address Line" name="destiAddress" required="required" value="${cabBooking.getAddress().destiAddress}"  readonly="readonly">
      
 <label for="address"><b>City</b></label>
      <input id="destiCity" type="text" placeholder="City" name="destiCity" required="required" value="${cabBooking.getAddress().destiCity}"  readonly="readonly"><br>
      
<label for="address"><b>State</b></label>
      <input id="destiState" type="text" placeholder="State" name="destiState" required="required" value="${cabBooking.getAddress().destiState}"  readonly="readonly">


 <label for="address"><b>Postal/Zip Code</b></label>
     <input id="destiPinCode" type="text" placeholder="Postal/ZipCode" name="destiPinCode" required="required" value="${cabBooking.getAddress().destiPinCode}"  readonly="readonly"><br>
      
      
    <label for="cabBooking"><b>Car Type</b></label>
     <input id="carType" type="text" placeholder="carType" name="carType" required="required" value="${cabBooking.carType}"  readonly="readonly"><br>




   <label for="name"><b>No. of Persons</b></label>
      <input type="text" placeholder="Enter Name" name="numberOfPersons" required="required" value="${cabBooking.numberOfPersons}" readonly="readonly">

	
<label for="theDate"><b>Pickup Date</b></label>
      <input id="theDate" onchange="checkDate()" type="date"  name="pickUpDate" required="required" value="${cabBooking.pickUpDate}" readonly="readonly"><br>
      


    <label for="theTime"><b>Pickup Time</b></label>
      <input id="theTime" type="time" onchange="checkTime()" name="pickUpTime" required="required" value="${cabBooking.pickUpTime}" readonly="readonly">
      
     

      <div class="clearfix">
       <c:url var="BookingRequest" value="/saveBookingFare">		
   			<c:param name="bookingId" value="${cabBooking.bookingId}" /></c:url>
       <a href="${BookingRequest}"> <button  class="signupbtn" ><b>Next</b></button></a>
      </div>
      
      
    </div>
  </form>
 
</body>
</html>
