<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Contact Us | TAPCAB</title>
<link href="<c:url value="/resources/static/style/ContactUsStyle.css"/>"
	rel="stylesheet">
</head>
<body background="<c:url value="/resources/static/images/cab2.jpg"/> "/>
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
	
	
    <a href="${contactLink}" onclick="return false">CONTACT US</a>
    
	<a href="/TapCab" onclick="if (!(confirm('Are you sure you want to Logout?'))) return false">LOGOUT</a>
 
 </div>
</div>
  <form class="modal-content" action="saveRegisteredUserContact">
    <div class="container">
      <h1>CONTACT FORM</h1>
      <h3>Please fill in this form to send your message...</h3>
      <hr>
      <label for="name"><b>Name</b></label>
      <input type="text" placeholder="Enter Name" name="name" value="${passenger.name}" readonly="readonly" required ="required" >

     <label for="phoneNo"><b>Phone No.</b></label>
      <input type="text" placeholder="Enter Phone No." name="phoneNo" value="${passenger.phoneNo}" readonly="readonly" required ="required">

      <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" value="${passenger.email}" readonly="readonly" required ="required">

    <label for="subject"><b>Message</b></label>
    <textarea id="message" name="message" placeholder="Your Message..." style="height:200px" required="required"></textarea>
		 

      <div class="clearfix">
        <button type="submit" class="signupbtn" onclick="if (!(confirm('Press Ok to send your form, We will contact you soon Thankyou..'))) return false"><b>SEND FORM</b></button>
      </div>
    </div>
  </form>

</body>
</html>
