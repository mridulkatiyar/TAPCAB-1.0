	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Cab Booking Details</title>

<style>

button
{

  background-color:#fff;
  border:none;
  cursor:pointer;
}

button:hover
{

  background-color:#fff;
  border:none;
  cursor:pointer;
  color:green;
}

#pdfdiv
{
color:green;
}
</style>

  <script type="text/javascript" src="<c:url value="/resources/static/js/jspdf.min.js" />"></script>
  
 <script type="text/javascript" src="<c:url value="/resources/static/js/jquery-git.js" />"></script>
    
  <style type="text/css">  </style>
  
  
  
  
  
  
<title>Your Cab Details | TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/static/style/AfterLoginStyle.css"/>"
	rel="stylesheet">
	<link href="<c:url value="/resources/static/style/BookingFormStyle1.css"/>"
	rel="stylesheet">
	
	
	
	
	

	
	<script type='text/javascript'>//<![CDATA[
$(window).on('load', function() {
var doc = new jsPDF();
var specialElementHandlers = {
    '#editor': function (element, renderer) {
        return true;
    }
};

$('#pdfview').click(function () {
    doc.fromHTML($('#pdfdiv').html(), 15, 15, {
        'width': 700,
            'elementHandlers': specialElementHandlers
    });
    doc.save('TapCab-Ride.pdf');
});
});//]]> 

</script>

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

<!-- -----------------------------------------------------------HEADER FINISH--------------------------------------------------------- -->
<div align="center"><h1> ${error}</h1><a href="${myTripsLink}" ><button class="updatebtn">GO BACK</button></a>
</div>


<div id="pdfdiv">
<form class="modal-content" action="saveFeedback" modelAttribute="cabBooking" method="post">
    <div class="container">
      <h1 align="center"><font color="red"><b>TAP-CAB India</b></font> </h1><br>
    
      <h2 align="center"><font color="green"><u>YOUR RIDE DETAILS</u></font> </h2>
      <hr size="5" color="black">
      
      <h3><font color="green"><b>Ride Fare : ${cabBooking.fare}/- (Total fare may change)</b></font></h3>
      
      
       <h3><font color="black"><b>Booking Id</b></font><font color="blue"><b>: ${cabBooking.bookingId}</b></font></h3>
    
       <h3><font color="black"><b>Payment Mode</b></font><font color="blue"><b>: ${cabBooking.paymentMode}</b></font></h3>
       
       <br>
        
      <h2><font color="black"><b><u>Passenger Details</u> :-</b></font><font color="blue"><b></b></font></h2>
        <br>
         
       <h3><font color="black"><b>Name</b></font><font color="blue"><b>: ${cabBooking.name}</b></font></h3>
   
          
       <h3><font color="black"><b>Phone No</b></font><font color="blue"><b>: ${cabBooking.phoneNo}</b></font></h3>
        <br>
     
      
       <h2><font color="black"><b><u>Pick Up Details</u> :-</b></font><font color="blue"><b></b></font></h2>
        <br>

      
       <h3><font color="black"><b>Address</b></font><font color="blue"><b>: ${cabBooking.getAddress().pickUpAddress}</b></font></h3>
   

		<h3><font color="black"><b>City</b></font><font color="blue"><b>: ${cabBooking.getAddress().pickUpCity}</b></font></h3>
       
		
		<h3><font color="black"><b>State</b></font><font color="blue"><b>: ${cabBooking.getAddress().pickUpState}</b></font></h3>
   		    
    
      <h3><font color="black"><b>Pin Code</b></font><font color="blue"><b>: ${cabBooking.getAddress().pickUpPinCode}</b></font></h3>
        <br>
      

       <h2><font color="black"><b><u>Destination Details</u> :-</b></font><font color="blue"><b></b></font></h2>
        <br>

      
       <h3><font color="black"><b>Address</b></font><font color="blue"><b>: ${cabBooking.getAddress().destiAddress}</b></font></h3>
      

		<h3><font color="black"><b>City</b></font><font color="blue"><b>: ${cabBooking.getAddress().destiCity}</b></font></h3>
       
		
		<h3><font color="black"><b>State</b></font><font color="blue"><b>: ${cabBooking.getAddress().destiState}</b></font></h3>
   		    
    
      <h3><font color="black"><b>Pin Code</b></font><font color="blue"><b>: ${cabBooking.getAddress().destiPinCode}</b></font></h3>
        <br>
      


	<h2><font color="black"><b><u>Your Cab Details</u> :-</b></font></h2>
        <br>

  <h3><font color="black"><b>Car Type</b></font><font color="blue"><b>: ${cabBooking.carType}</b></font></h3>
       
  <h3><font color="black"><b>Number Of Persons</b></font><font color="blue"><b>: ${cabBooking.numberOfPersons}</b></font></h3>
        
        
        <h3><font color="black"><b>Cab Registration Number</b></font><font color="blue"><b>: ${cab.cabRegistraionNumber}</b></font></h3>
       
        
       
        <h3><font color="black"><b>Cab Name</b></font><font color="blue"><b>: ${cab.cabName}</b></font></h3>

        
           <h3><font color="black"><b>Cab Color</b></font><font color="blue"><b>: ${cab.cabColor}</b></font></h3>
        <br>
        
        
           <h2><font color="black"><b><u>Driver Details</u> :-</b></font></h2>
        <br>
      
         <h3><font color="black"><b>Driver Name</b></font><font color="blue"><b>: ${cab.cabDriverName}</b></font></h3>
     
           <h3><font color="black"><b>Driver Contact Number</b></font><font color="blue"><b>: ${cab.cabDriverPhoneNumber}</b></font></h3>
        
         <h3><font color="black"><b>Pick Up Date</b></font><font color="blue"><b>: ${cabBooking.pickUpDate}</b></font></h3>
        
        
           <h3><font color="black"><b>Pick Up Time</b></font><font color="blue"><b>: ${cabBooking.pickUpTime} </b></font></h3>
      
          <hr size="2" color="black">
          
          
          
          
       <h3><font color="black"><b>Write any Feedback/Queries:</b></font></h3>
       
       
    <input type="hidden" id="bookingId" name="bookingId" value=${cabBooking.bookingId} required="required">
    
    <textarea id="feedback" name="feedback"   placeholder="Feel Free to Write us Anything.." style="height:200px" required="required"></textarea>
  
  

  <div class="clearfix">
        <button type="submit" class="signupbtn" onclick="if (!(confirm('Press Ok to send your feedback, Thankyou..'))) return false"><b>SEND FEEDBACK</b></button>
      </div>
      
      
      
      
      
      
      
      
      
      
      
        <hr size="6" color="green">
      <h6><font color="black">Thank you for being a TAP CAB customer.We sincerely appreciate your business and hope you come back soon!</font></h6>
      

  
    </div>
  </form>
 
</div>


<div id="editor"></div>
<button id="pdfview"> Click Here to Download Your Trip Details(pdf)</button>
</body>
</html>
