	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Book Your Ride | TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/static/style/AfterLoginStyle.css"/>"
	rel="stylesheet">
	<link href="<c:url value="/resources/static/style/scrollimages.css"/>"
	rel="stylesheet">

</head>
<body background="<c:url value="/resources/static/images/registerback1.jpg"/> "/>
<div style="color: black" align="center">Hi, <b>${passenger.name}</b></div>

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


<h2 align="center">Welcome To TAPCAB</h2>


<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="<c:url value="/resources/static/images/slide 1.jpg"/>" style="width:100%" />

</div>

<div class="mySlides fade">
  <div class="numbertext"></div>
    <img src="<c:url value="/resources/static/images/slide 2.jpg"/>" style="width:100%" />
  

</div>
<br>

<div class="mySlides fade">
  <div class="numbertext"></div>
    <img src="<c:url value="/resources/static/images/slide 3.jpg"/>" style="width:100%" />
  
</div>
<br>
<div class="mySlides fade">
  <div class="numbertext"></div>
    <img src="<c:url value="/resources/static/images/slide 4.jpg"/>" style="width:100%" />
  </div>
<br>
<div class="mySlides fade">
  <div class="numbertext"></div>
    <img src="<c:url value="/resources/static/images/slide 5.jpg"/>" style="width:100%" />
  </div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span>
  <span class="dot"></span>
  <span class="dot"></span>
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>


</body>
</html>
