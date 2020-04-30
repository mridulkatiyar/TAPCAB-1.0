<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>ADD Cab| TAPCAB</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/static/style/ContactUsStyle.css"/>"
	rel="stylesheet">

</head>
<body background="<c:url value="/resources/static/images/cab2.jpg"/> "/>


<div class="header">
   <a href="adminHome" class="logo">TAP CAB</a>
 
  <div class="header-right">
  <a href="adminHome">HOME</a>
    <a href="passengerList">PASSENGER DETAILS</a>
    <a href="showBookingRequest">BOOKING DETAILS</a>
    <a href="showCabDetailsForm" onclick="return false" class="active">ADD/VIEW CAB</a>
    <a href="listContactUsForms" >CONTACT-US FORM DATA</a>
	<a href="/TapCab" onclick="if (!(confirm('Are you sure you want to Logout?'))) return false">LOGOUT</a>
 
 </div>
</div>

	
	
	<div>	
			  <form class="modal-content"  modelAttribute="cab" action="saveCabDetails">
    <div class="container">
     <div class="clearfix">
     
      <a href="viewCabDetails" class="clearfix"> <b><h1>View All Cabs</h1></b></a>
      </div>
      <h1>ADD CAB </h1>
      <h3>Fill The Cab Details :</h3>
      <hr>
     
      <input type="hidden" placeholder="cabId" value="${cab.cabId}" name="cabId" readonly="readonly"  >
      
      <label for="cabName"><b>Cab Name</b></label>
      <input type="text" placeholder="Name" value="${cab.cabName}" name="cabName" required ="required" >

     <label for="cabRegistraionNumber"><b>Enter Cab Registration Number</b></label>
      <input type="text" placeholder="Registration Number" value="${cab.cabRegistraionNumber}" name="cabRegistraionNumber" required ="required">

      <label for="cabColor"><b>Enter Cab Color</b></label>
      <input type="text" placeholder="Cab Color"  value="${cab.cabColor}" name="cabColor" required ="required">
      
       <label for="cabDriverName"><b>Enter Cab Driver Name</b></label>
     <input type="text" placeholder="Driver Name"  value="${cab.cabDriverName}" name="cabDriverName"  required ="required">

    <label for="cabDriverPhoneNumber"><b>Enter Cab Driver Phone Number</b></label>
     <input type="text" placeholder="Driver Phone Number"   value="${cab.cabDriverPhoneNumber}" name="cabDriverPhoneNumber"  required ="required">
		 
		 

      <div class="clearfix">
        <button type="submit" class="signupbtn" onclick="if (!(confirm('Press Ok to Set Cab Details'))) return false"><b>Set Cab Details</b></button>
      </div>
    </div>
  </form>
	</div>



</body>
</html>
