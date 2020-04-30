<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Book Cab | TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/static/style/BookingFormStyle1.css"/>"
	rel="stylesheet">
</head>
<body background="<c:url value="/resources/static/images/1.jpg"/> "/>

<div class="header">

   <c:url var="updateLink" value="/loginHome">		
   <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
	   <a href="${updateLink}"  class="logo">TAP CAB</a>
 
  <div class="header-right">
   
   
    <a href="${updateLink}">HOME</a>
    
    
    <a href="#" onclick="return false">BOOK CAB</a>
    
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
<!------------------------------------------------------------------------------------------------------------->
 <form class="modal-content" action="bookCab" modelAttribute="cabBooking" method="post">
    <div class="container">
      <h1>BOOK YOUR RIDE </h1>
      <h3>Please fill all the details.</h3>
      <hr>
      <label for="name"><b>Name</b></label>
      <input type="text" placeholder="Enter Name" name="name" required="required">

     <label for="phoneNo"><b>Phone No.</b></label>
      <input type="text" placeholder="Enter Phone No." name="phoneNo"  value="${passenger.phoneNo}"  readonly="readonly"><br>

      <label for="address"><b>Pickup Address</b></label><br>
      <input id="pickUpAddress" type="text" placeholder="Address Line" name="pickUpAddress" required="required">
      
 <label for="address"><b>City</b></label>
      <input id="pickUpCity" type="text" placeholder="City" name="pickUpCity" required="required"><br>
      
      
<label for="address"><b>State</b></label>
      <input id="pickUpState" type="text" placeholder="State" name="pickUpState" required="required">


 <label for="address"><b>Postal/Zip Code</b></label>
     <input id="pickUpPinCode" type="text" placeholder="Postal/ZipCode" name="pickUpPinCode" required="required"><br>

       <label for="daddress"><b>Destination Address</b></label><br>
      <input id="destiAddress" type="text" placeholder="Address Line" name="destiAddress" required="required">
      
 <label for="address"><b>City</b></label>
      <input id="destiCity" type="text" placeholder="City" name="destiCity" required="required"><br>
      
<label for="address"><b>State</b></label>
      <input id="destiState" type="text" placeholder="State" name="destiState" required="required">


 <label for="address"><b>Postal/Zip Code</b></label>
     <input id="destiPinCode" type="text" placeholder="Postal/ZipCode" name="destiPinCode" required="required"><br>
      
      
      
    <label for="cartype"><b>Car Type</b></label>
      <select id="cartype" name="carType">
<option value="select"/>
	<option value="mini">MINI </option>
	<option value="micro">MICRO</option>
	<option value="prime">PRIME</option>
	<option value="xuv">XUV</option>
       </select>

 <label for="person"><b>No.of Person</b></label>
      <select id="person" name="numberOfPersons">
<option value="select"/>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
        <option value="4">4</option>
       </select>	<br>

	
<label for="theDate"><b>Pickup Date</b></label>
      <input id="theDate"  type="date"  name="pickUpDate" required="required">
 
   <script type="text/javascript">
     var date = new Date();
      var day = date.getDate();
      var month = date.getMonth() + 1;
      var year = date.getFullYear();

      if (month < 10) month = "0" + month;
      if (day < 10) day = "0" + day;
      var today = year + "-" + month + "-" + day;
      document.getElementById('theDate').value = today;
      </script> 

      <script>
      
      function checkDate() {
    	   var selectedText = document.getElementById('theDate').value;
    	   var selectedDate = new Date(selectedText);
    	   var now = new Date();
    	   if (now > selectedDate) {
        	    alert("Pick-up Date must be in the future!!");
    		   return false;
    	   }
    	   else{
    		   if (!(confirm('Press Ok to Submit Your Booking Request'))) return false;
    	   }
    	 }
      
      </script>

    <label for="theTime"><b>Pickup Time</b></label>
      <input id="theTime" type="time" onchange="checkTime()" name="pickUpTime" required="required">
       <script>
      
      function checkTime() {
    	  var userTime = document.getElementById("theTime").value;//user given time
    	 
    	  SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
    	  String str = sdf.format(new Date());
    	   var nowTime=str;//now time in 24hr format
    	   if (userTime < nowTime) {
       	    alert("Pick-up Time must be in the future!!");
       	   }
      }
      </script>

      <div class="clearfix">
        <button type="submit" class="signupbtn" onclick=" return checkDate()"  ><b>BOOK NOW</b></button>
      </div>
    </div>
  </form>

</body>
</html>
