<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome Admin | TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/static/style/AfterLoginStyle.css"/>"
	rel="stylesheet">

</head>
<body>

<div class="header">
   <a href="adminHome" class="logo">TAP CAB</a>
 
  <div class="header-right">
  <a href="adminHome" class="active">HOME</a>
    <a href="passengerList">PASSENGER DETAILS</a>
    <a href="showBookingRequest">BOOKING DETAILS</a>
     <a href="showCabDetailsForm">ADD/VIEW CAB</a>
    <a href="listContactUsForms" >CONTACT-US FORM DATA</a>
	<a href="/TapCab" onclick="if (!(confirm('Are you sure you want to Logout?'))) return false">LOGOUT</a>
 
 </div>
</div>
<div style="color: black" align="center"><b>Hi, Admin</b></div>

<div class="col-md-offset-1 col-md-10">
<img src="<c:url value="/resources/static/images/Niit logo small.png"/>" />
	</div>
	
	



</body>
</html>
