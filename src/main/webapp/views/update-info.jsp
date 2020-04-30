<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Profile | TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/static/style/RegistrationStyle.css"/>"
	rel="stylesheet">

</head>
<body background="<c:url value="/resources/static/images/mytripsback.jpg"/> "/>
<div style="color: black" align="right">Welcome User: <b>${passenger.name}</b></div>

<div class="header">

   <c:url var="updateLink" value="/loginHome">		
   <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
	   <a href="${updateLink}"  class="logo">TAP CAB</a>
 
  <div class="header-right">
   
   
    <a href="${updateLink}">HOME</a>
    
    
	<c:url var="bookingForm" value="/viewBookingForm">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>   
    <a href="${bookingForm}" >BOOK CAB</a>
    
    <a href="myTrips" onclick="return false">MY TRIPS</a>
    
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
  <form class="modal-content" action="updateUser" method="post" modelAttribute="passenger">
    <div class="container">
      <h1>Edit Personal Details</h1>
      <h3>Please Fill Correct Details</h3>
      <hr>
      <label for="name"><b>Name</b></label>
      <input type="text" placeholder="Name" name="name" required="required"  value=${passenger.getName()}>
     
      <label for="phoneNo"><b>Phone No.</b></label>
      <input type="text" placeholder="Phone No." name="phoneNo" required="required" pattern="[0-9]{10}" value=${passenger.phoneNo} readonly="readonly">
       
       <label for="password"><b>Update Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required="required"> 

      <label for="email"><b>Email</b></label>
      <input type="email" placeholder="Enter Email" name="email" required="required" value=${passenger.email}>

      <label for="DOB"><b>DOB</b></label>
      <input type="date"  name="DOB" required="required" value=${passenger.DOB}>

     

<label for="gender" ><b>Gender</b></label>
<input type="radio" name="gender" id="male" value=" Male "  required="required"  value=${passenger.gender} />
 <label for="male">Male</label>
 <input type="radio" name="gender" id="female" value=" Female " required="required"   value=${passenger.gender}/> 
<label for="female" >Female</label>
<input type="radio" name="gender" id="other" value=" Others "  required="required"  value=${passenger.gender} /> 
<label for="other" >Other</label>

      <p>NOTE: Remember your updated Password for login</p>

      <div class="clearfix">
        <button type="submit" class="signupbtn"><b>UPDATE</b></button>
      </div>
    </div>
  </form>

</body>
</html>
