<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabs | TAPCAB</title>
<link
	href="<c:url value="/resources/static/style/AfterLoginStyle.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/static/style/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/static/js/jquery-3.3.0.min.js" />"></script>
<script src="<c:url value="/resources/static/js/bootstrap.min.js" />"></script>
</head>
<body background="<c:url value="/resources/static/images/back1.jpg"/>" />

<div class="header">
	<a href="adminHome" class="logo">TAP CAB</a>

	<div class="header-right">
		<a href="adminHome">HOME</a> 
		<a href="passengerList">PASSENGER DETAILS</a> 
		<a href="showBookingRequest" >BOOKING	DETAILS</a> 
		     <a href="showCabDetailsForm" class="active">ADD/VIEW CAB</a>
		
		 <a href="listContactUsForms" >CONTACT-US FORM DATA</a>
		<a href="/TapCab" onclick="if (!(confirm('Are you sure you want to Logout?'))) return false">LOGOUT</a>

	</div>
</div>

<div class="container">
	<div class="col-md-offset-1 col-md-10">
		<div align="center"></div>
		<img
			src="<c:url value="/resources/static/images/Niit logo small.png"/>" />
	</div>
	<div class="panel panel-info">
		<div class="panel-heading">
			<hr color="pink" size="3" />
			<div class="col-md-offset-1 col-md-10">
				<h1 align="center">CABS WITH TAPCAB</h1>
			</div>
			<hr color="pink" size="3" />
		</div>
		
						
						
		
		<div class="panel-body">
			<table class="table table-striped table-bordered">
			
				<tr>
					<th>Cab Name</th>
					<th>Cab Number</th>
					<th>Cab Color</th>
					<th>Cab Driver Phone No</th>
					<th>Cab Driver Name</th>
					<th>Action</th>
				</tr>

				<!-- loop over and print our customers -->
				<c:forEach var="tempCab" items="${cab}">

					<!-- construct an "delete" link with customer id -->
					<c:url var="replyLink" value="/assignCab">
						<c:param name="cabId" value="${tempCab.cabId}" />
					</c:url>

					<tr>
						<td>${tempCab.cabName}</td>
						<td>${tempCab.cabRegistraionNumber}</td>
						<td>${tempCab.cabColor}</td>
						<td>${tempCab.cabDriverPhoneNumber}</td>
						<td>${tempCab.cabDriverName}</td>
						<td>
						
						<input type="hidden" name="cabId" required="required" value="${tempCab.cabId}" readonly="readonly">
     					
					
	 			<c:url var="updateCab" value="/updateCab">		
   					<c:param name="cabId" value="${tempCab.cabId}"/>
   				</c:url>
	 				  <a href="${updateCab}"><button  onclick="if (!(confirm('Click Ok to Update Cab details.'))) return false">
					   <b>Update</b></button></a>
	
	
		<c:url var="deleteCab" value="/deleteCab">		
   					<c:param name="cabId" value="${tempCab.cabId}" />
   				</c:url>
	 				  <a href="${deleteCab}"><button  onclick="if (!(confirm('Click Ok to Delete this Cab.'))) return false">
					   <b>Delete</b></button></a>
	
					
						</td>

					</tr>

				</c:forEach>

			</table>

		</div>
	
		
	</div>
</div>

</body>

</html>
