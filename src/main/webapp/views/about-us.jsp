<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<title>About Us | TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/static/style/AboutUsStyle.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/static/style/Home2style.css"/>"
	rel="stylesheet">
</head>
<body>
<div class="header">
  <a href="/TapCab" class="logo">TAP CAB</a>
  <a href="loginAdminForm">ADMINISTRATION</a>  
  
  <div class="header-right">
    <a href="/TapCab">HOME</a>
   <a href="registerUser">REGISTRATION</a>
    <a href="loginForm">LOGIN</a>
     <a class="active" href="aboutUs">ABOUT US</a>
     <a href="contactUs">CONTACT US</a>
     
  </div>
</div>
<div class="about-section">
  <h1>ABOUT US</h1>
    <p><b>SIMPLE.FAST.FUN</b><br></p>
  <p><b><i>Welcome to TAP CAB</i></b><br><br>
<b><i>NIIT's preferred Taxi service Company.</i></b><br><br></p>
<i>With about experience in taxi services and presence in Noida, GreaterNoida,Delhi and NCR. 
Our sole purpose is to provide doorstep service for any car requirements for local or outstation. It was a humble start in 2020. 
Its one of the first company developed by TAP CAB team members.</i></p>
<p>
<i>This company is started by KMP team in favour of drivers and customers. All services is running inside the  TAP CABS. 
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
        <p>Mridul.Katiyar@niit-tech.com.com</p>
        
      </div>
    </div>
  </div>
</div>

</body>
</html>
