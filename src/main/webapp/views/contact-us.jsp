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
  <a href="/TapCab" class="logo">TAP CAB</a>
  <a href="loginAdminForm">ADMINISTRATION</a>  
  
  <div class="header-right">
    <a href="/TapCab">HOME</a>
   <a href="registerUser">REGISTRATION</a>
    <a href="loginForm">LOGIN</a>
     <a href="aboutUs">ABOUT US</a>
     <a  class="active" href="contactUs">CONTACT US</a>
     
  </div>
</div>
  <form class="modal-content" action="saveContact" modelAttribute="contact">
    <div class="container">
      <h1>CONTACT FORM</h1>
      <h3>Please fill in this form to send your message...</h3>
      <hr>
      <label for="name"><b>Name</b></label>
      <input type="text" placeholder="Enter Name" name="name" required>

     <label for="phoneNo"><b>Phone No.</b></label>
      <input type="text" placeholder="Enter Phone No." name="phoneNo" required>

      <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" required>

    <label for="subject"><b>Message</b></label>
    <textarea id="message" name="message" placeholder="Your Message..." style="height:200px" required="required"></textarea>


      <div class="clearfix">
        <button type="submit" class="signupbtn" onclick="if (!(confirm('Press Ok to send your form, We will contact you soon Thankyou..'))) return false"><b>SEND FORM</b></button>
      </div>
    </div>
  </form>

</body>
</html>
