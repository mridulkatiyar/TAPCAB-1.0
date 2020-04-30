<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Passengers List | TAPCAB</title>
<link href="<c:url value="/resources/static/style/AfterLoginStyle.css"/>"
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
  <a href="adminHome" >HOME</a>
    <a href="passengerList" class="active">PASSENGER DETAILS</a>
    <a href="showBookingRequest">BOOKING DETAILS</a>
      <a href="showCabDetailsForm">ADD/VIEW CAB</a>
    <a href="listContactUsForms" >CONTACT-US FORM DATA</a>
	<a href="/TapCab" onclick="if (!(confirm('Are you sure you want to Logout?'))) return false">LOGOUT</a>
 
 </div>
</div>
<div class="col-md-offset-1 col-md-10">
	<div align="center"></div><img src="<c:url value="/resources/static/images/Niit logo small.png"/>" />
	</div>
<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
							
				<div class="col-md-offset-1 col-md-10"><h1 align="center">     Passengers List</h1></div>
			<hr color="pink" size="5" />
			</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered">
					<tr>
						<th>Name</th>
						<th>Phone Number</th>
						<th>Email</th>
						<th>Birthday</th>
						<th>Gender</th>
						<th>Action</th>
					</tr>

					<!-- loop over and print our customers -->
					<c:forEach var="tempPassenger" items="${passengers}">

						<!-- construct an "delete" link with customer id -->
						<c:url var="deleteLink" value="passenger/delete">
							<c:param name="phoneNo" value="${tempPassenger.phoneNo}" />
						</c:url>

						<tr>
							<td>${tempPassenger.name}</td>
							<td>${tempPassenger.phoneNo}</td>
							<td>${tempPassenger.email}</td>
							<td>${tempPassenger.DOB}</td>
							<td>${tempPassenger.gender}</td>
							<td>| <a href="${deleteLink}"
								onclick="if (!(confirm('Are you sure you want to delete this Passenger?'))) return false">Delete
									Passenger</a> |
							</td>

						</tr>

					</c:forEach>

				</table>

			</div>
		</div>
	</div>

</div>
</body>

</html>
