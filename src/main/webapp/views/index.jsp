<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
#myVideo {
object-fit:cover;

  right: 0;
  bottom: 0;
  min-width: 100%;
  min-height: 100%;
}
</style>
<title>Home | TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="<c:url value="/resources/static/style/Home2style.css"/>"rel="stylesheet">
	

</head>
    <%-- <body background="<c:url value="/resources/static/images/cab1.jpg"/>"/> --%>

<body>
<div class="header">
  <a href="/TapCab" class="logo">TAP CAB</a>
  <a href="loginAdminForm">ADMINISTRATION</a>  
  
  <div class="header-right">
    <a class="active" href="/TapCab">HOME</a>
   <a href="registerUser">REGISTRATION</a>
    <a href="loginForm">LOGIN</a>
     <a href="aboutUs">ABOUT US</a>
     <a href="contactUs">CONTACT US</a>
     
  </div>
</div>

<video id="myVideo" width="320" height="600" autoplay muted loop>
  <source src="<c:url value="/resources/static/videos/final taxi.mp4"/>" type="video/mp4">
</video>

</body>
</html> 
