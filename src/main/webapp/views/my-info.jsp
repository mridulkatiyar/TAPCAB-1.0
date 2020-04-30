<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>My-Profile | TAPCAB</title>
<style>
div {outline-color:black;}

div.double {outline-style: double;}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="<c:url value="/resources/static/style/RegistrationStyle.css"/>"
	rel="stylesheet">

</head>
<body	background ="<c:url value="/resources/static/images/bestcab.jpg"/> " />
<div class="header">

	<c:url var="updateLink" value="/loginHome">
		<c:param name="phoneNo" value="${passenger.phoneNo}" />
	</c:url>
	<a href="${updateLink}" class="logo">TAP CAB</a>
	
	

	<div class="header-right">

		<a href="${updateLink}">HOME</a>

  <c:url var="bookingForm" value="/viewBookingForm">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>   
    <a href="${bookingForm}" >BOOK CAB</a>
    
		<c:url var="myTripsLink" value="/myTrips">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
    <a href="${myTripsLink}" >MY TRIPS</a>

		<c:url var="updateLink1" value="/myInfo">
			<c:param name="phoneNo" value="${passenger.phoneNo}" />
		</c:url>
		<a href="${updateLink1}" onclick="return false">MY INFO</a>

		<c:url var="aboutLink" value="/afterLoginAboutUs">
			<c:param name="phoneNo" value="${passenger.phoneNo}" />
		</c:url>
		<a href="${aboutLink}">ABOUT US</a>


		<c:url var="contactLink" value="/afterLoginContactUs">
			<c:param name="phoneNo" value="${passenger.phoneNo}" />
		</c:url>
		<a href="${contactLink}">CONTACT US</a> <a href="/TapCab"
			onclick="if (!(confirm('Are you sure you want to Logout?'))) return false">LOGOUT</a>

	</div>
</div>

<div align="center" class="container">

	<h1><b>User Details</b></h1>

<div class="double">
	<h3><b>Name : <font color="white"> ${passenger.name}</font></b></h3>
	<h3><b>Phone Number : <font color="white"> ${passenger.phoneNo}</font></b></h3>

	<h3><b>Email : <font color="white"> ${passenger.email}</font></b></h3>
	<h3><b>Date of Birth : <font color="white"> ${passenger.DOB}</font></b></h3>
	<h3><b>Gender : <font color="white"> ${passenger.gender}</font></b></h3>
	<h3><b>Wallet Balance :<font color="white" size="5"> ${passenger.walletAmount}</font></b></h3>
	</div>


	<c:url var="updateInfoForm" value="/updateInfo">
		<c:param name="phoneNo" value="${passenger.phoneNo}" />
	</c:url>
	<a href="${updateInfoForm}"><button class="updatebtn">
			<b>UPDATE PROFILE</b>
		</button></a>
		
		<c:url var="RechargeWallet" value="/RechargeWallet">
			<c:param name="phoneNo" value="${passenger.phoneNo}" />
		</c:url>
		<a href="${RechargeWallet}"><button class="updatebtn"><b>RECHARGE WALLET</b></button></a> 
	
	

</div>
</body>
</html>
