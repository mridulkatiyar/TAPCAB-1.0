<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<title>About Us| TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/static/style/AboutUsStyle.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/static/style/Home2style.css"/>"
	rel="stylesheet">
</head>
<body>

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
   
	<a href="#" onclick="return false">ABOUT US</a>
	
	<c:url var="contactLink" value="/afterLoginContactUs">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
    <a href="${contactLink}" >CONTACT US</a>
    
	<a href="/TapCab" onclick="if (!(confirm('Are you sure you want to Logout?'))) return false">LOGOUT</a>
 
 </div>
</div>
<div class="about-section">
  <h1>ABOUT US</h1>
    <p><b>SIMPLE.FAST.FUN</b><br></p>
  <p><b><i>Welcome to TAP CAB</i></b><br><br>
<b><i>NIIT's preferred Taxi service Company.</i></b><br><br></p>
<i>With about experience in taxi services and presence in Noida, GreaterNoida,Delhi and NCR. 
Our sole purpose is to provide doorstep service for any car requirements for local or outstation. It was a humble start in 2020. 
ItÄôs one of the first company developed by TAP CAB team members.</i></p>
<p>
<i>This company is started by a KMP team in favour of drivers and customers. All services is running inside the TAPCABÄù. 
This company is working on the totally online network. </i>
</p>
</div>

<h2 style="text-align:center">OUR TEAM</h2>
<div class="row">
  <div class="column">
    <div class="card">
<img src="<c:url value="/resources/static/images/finalava.png"/>" alt="karan" style="width:100%"/>
      <div class="container">
        <h2>KARAN MALIK</h2>
       <p class="title">NIIT Technologies</p>
        <p>CONTACT No.-9711172821</p>
        <p>Karan.Malik@niit-tech.com</p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
<img src="<c:url value="/resources/static/images/priya.png"/>" alt="priya" style="width:100%"/>
      <div class="container">
        <h2>PRIYANKA TRIPATHY</h2>
        <p class="title">NIIT Technologies</p>
        <p>CONTACT No.-9723110434</p>
        <p>Priyanka.2.T@niit-tech.com</p>
      </div>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
<img src="<c:url value="/resources/static/images/finalava.png"/>" alt="mridul" style="width:100%"/>
      <div class="container">
        <h2>MRIDUL KATIYAR</h2>
        <p class="title">NIIT Technologies</p>
        <p>CONTACT No.-8009716386</p>
        <p>Mridul.Katiyar@niit-tech.com</p>
        
      </div>
    </div>
  </div>
</div>

</body>
</html>
