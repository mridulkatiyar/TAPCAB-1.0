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
	<link href="<c:url value="/resources/static/style/AfterLoginStyle.css"/>"
	rel="stylesheet">
	<style>
a:link, a:visited {
  background-color: #f1f1f1;
  color: black;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

</style>
</head>

<body background="<c:url value="/resources/static/images/mytripsback.jpg"/> "/>

<div class="header">
   <c:url var="updateLink" value="/loginHome">		
   <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
	   <a href="${updateLink}"  class="logo">TAP CAB</a>
	 
	   <div class="header-right">

	    <c:url var="updateLink1" value="/myInfo">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
    <a href="${updateLink1}"><b>MY-INFO</b></a>
    
    
    
	 <c:url var="myTripsLink" value="/myTrips">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
	  <a href="${myTripsLink}"><b>BOOKING DETAILS</b></a>
	 
</div>
  </div>
<!------------------------------------------------------------------------------------------------------------->
 <form class="modal-content" action="acceptRide" modelAttribute="cabBooking" method="post">
    <div class="container">
      <h1 align="center"><font color="green">Ride Details</font> </h1>
      <hr>
      
      <label><font color="green"><b>Ride Fare</b></font></label>
      <input type="number" id="fare" name="fare" required="required" value="${cabBooking.fare}" readonly="readonly" >
      
       
      <label for="BookingId"><font color="blue"><b>Booking Id</b></font></label>
      <input type="text" placeholder="Enter Name" name="bookingId" required="required" value="${cabBooking.bookingId}" readonly="readonly">
   <br>
      <label for="name"><font color="blue"><b>Name</b></font></label>
      <input type="text" placeholder="Enter Name" name="name" required="required" value="${cabBooking.name}" readonly="readonly">

     <label for="phoneNo"><font color="blue"><b>Phone No.</b></font></label>
      <input type="text" placeholder="Enter Phone No." name="phoneNo"  value="${cabBooking.phoneNo}"  readonly="readonly"><br>




<label><font color="black"><h3><b>Pickup Details</b></h3></font></label><br>
      <label for="address"><font color="blue"><b>Pickup Address</b></font></label><br>
      <input id="pickUpAddress" type="text" placeholder="Address Line" name="pickUpAddress" required="required" value="${cabBooking.getAddress().pickUpAddress}"  readonly="readonly">
      
 <label for="address"><font color="blue"><b>City</b></font></label>
      <input id="pickUpCity" type="text" placeholder="City" name="pickUpCity" required="required"value="${cabBooking.getAddress().pickUpCity}"  readonly="readonly"><br>
      
      
<label for="address"><font color="blue"><b>State</b></font></label>
      <input id="pickUpState" type="text" placeholder="State" name="pickUpState" required="required" value="${cabBooking.getAddress().pickUpState}"  readonly="readonly">


 <label for="address"><font color="blue"><b>Postal/Zip Code</b></font></label>
     <input id="pickUpPinCode" type="text" placeholder="Postal/ZipCode" name="pickUpPinCode" required="required" value="${cabBooking.getAddress().pickUpPinCode}"  readonly="readonly"><br>



<label><font color="black"><h3><b>Destination Details</b></h3></font></label><br>

       <label for="daddress"><font color="blue"><b>Destination Address</b></font></label><br>
      <input id="destiAddress" type="text" placeholder="Address Line" name="destiAddress" required="required" value="${cabBooking.getAddress().destiAddress}"  readonly="readonly">
      
 <label for="address"><font color="blue"><b>City</b></font></label>
      <input id="destiCity" type="text" placeholder="City" name="destiCity" required="required" value="${cabBooking.getAddress().destiCity}"  readonly="readonly"><br>
      
<label for="address"><font color="blue"><b>State</b></font></label>
      <input id="destiState" type="text" placeholder="State" name="destiState" required="required" value="${cabBooking.getAddress().destiState}"  readonly="readonly">


 <label for="address"><font color="blue"><b>Postal/Zip Code</b></font></label>
     <input id="destiPinCode" type="text" placeholder="Postal/ZipCode" name="destiPinCode" required="required" value="${cabBooking.getAddress().destiPinCode}"  readonly="readonly"><br>
      
      
      <label><font color="black"><h3><b>Cab Details</b></h3></font></label><br>
            
    <label for="cabBooking"><font color="blue"><b>Car Type</b></font></label>
     <input id="carType" type="text" placeholder="carType" name="carType" required="required" value="${cabBooking.carType}"  readonly="readonly">
   <label for="name"><font color="blue"><b>No. of Persons</b></font></label>
      <input type="text" placeholder="Enter Name" name="numberOfPersons" required="required" value="${cabBooking.numberOfPersons}" readonly="readonly"><br>


<label for="address"><font color="blue"><b>Cab Reg Number</b></font></label>
      <input id="destiCity" type="text" placeholder="City" name="destiCity" required="required" value="${cab.cabRegistraionNumber}"  readonly="readonly">
<label for="address"><font color="blue"><b>Cab Model</b></font></label>
      <input id="destiCity" type="text" placeholder="City" name="destiCity" required="required" value="${cab.cabName}"  readonly="readonly"><br>
      
   <label for="address"><font color="blue"><b>Cab Color</b></font></label>
      <input id="destiCity" type="text" placeholder="City" name="destiCity" required="required" value="${cab.cabColor}"  readonly="readonly"><br>
      
      
      
         <label><font color="black"><h3><b>Driver Details</b></h3></font></label><br>   
   <label for="address"><font color="blue"><b>Driver Name</b></font></label>
      <input id="destiCity" type="text" placeholder="City" name="destiCity" required="required" value="${cab.cabDriverName}"  readonly="readonly">
      <label for="address"><font color="blue"><b>Driver Contact</b></font></label>
      <input id="destiCity" type="text" placeholder="City" name="destiCity" required="required" value="${cab.cabDriverPhoneNumber}"  readonly="readonly"><br>
      
      
      
      
      
      
	
<label for="theDate"><font color="blue"><b>Pickup Date</b></font></label>
      <input id="theDate" onchange="checkDate()" type="date"  name="pickUpDate" required="required" value="${cabBooking.pickUpDate}" readonly="readonly">
 <label for="theTime"><font color="blue"><b>Pickup Time</b></font></label>
      <input id="theTime" type="time" onchange="checkTime()" name="pickUpTime" required="required" value="${cabBooking.pickUpTime}" readonly="readonly"><br>
      
<br>
<br>           
<label for="paymentMode"><font color="blue"><b>SELECT MODE OF PAYMENT</b></font></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="paymentMode"  value="CASH"  required="required"  onclick="cash()"/>


 <label for="cash"><b>CASH</b></label>&nbsp;&nbsp;&nbsp;
 <input type="radio" name="paymentMode"  value="TAP-CAB WALLET" required="required" onclick="wallet()" /> 
<label for="wallet" ><b>TAP-CAB WALLET</b></label>
<br>
<br>
      
       <label ><font color="red"><b>Wallet Balance</b></font></label>
  <input id="walletAmount" type="number" name="walletAmount" value="${passenger.walletAmount}" readonly="readonly"><br>
  
      <input id="result" type="hidden"  readonly="readonly"><br>
  
<br>
<br>
      
     <script>
     function payFromWallet()
     {
    	 var paymentMode=parseInt(document.getElementById("result").value);
    	 
    	 if(paymentMode==1)
    	 {
    		 var rideFare=parseInt(document.getElementById("fare").value);
        	 
        	 var walletAmount=parseInt(document.getElementById("walletAmount").value);
        	 
        	 if(rideFare<=walletAmount){ 
        		 if (!(confirm('Click Ok to Pay Ride Fare from Wallet '))) 
        			 return false;
        	
        		
        	 }
        	 else
        		 {
        		 alert("Please Add Money To TapCap Wallet From My-Info Tab to proceed!");
        		 return false;
        		 }
    	 }
    	 else{
    		 if (!(confirm('Book Your Cab With Cash!!! '))) 
    			 return false;
   
    		 }
     }
     
     function cash() {
    	  document.getElementById("result").value =0;
    	}
     function wallet() {
    
   	  document.getElementById("result").value =1;
   	  
   	}
     </script>
   

      <div class="clearfix" align="center">
        <button type="submit" class="signupbtn"  onclick="return payFromWallet()" ><b>RIDE NOW</b></button>
        

   
     		 <c:url var="cancelRide" value="/cancelRide">		
 			 <c:param name="bookingId" value="${cabBooking.bookingId}"/></c:url>
       <a href="${cancelRide}" target="_blank" onclick="if (!(confirm('Click Ok to CANCEL Your CAB!!'))) return false"  > 
       <b><font color="red">Cancel</font></b></a>
     
     
    </div>
  </form>
 

</body>
</html>
