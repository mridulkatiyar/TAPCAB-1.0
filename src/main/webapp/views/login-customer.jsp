<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Login | TAPCAB</title>
<link href="<c:url value="/resources/static/style/LoginStyle.css" />"
	rel="stylesheet">
</head>

<body background="<c:url value="/resources/static/images/cab2.jpg"/>" />

<div class="header">
  <a href="/TapCab" class="logo">TAP CAB</a>
  <a href="loginAdminForm">ADMINISTRATION</a>  
  
  <div class="header-right">
    <a href="/TapCab">HOME</a>
   <a href="registerUser">REGISTRATION</a>
    <a  class="active" href="loginForm">LOGIN</a>
     <a href="aboutUs">ABOUT US</a>
     <a href="contactUs">CONTACT US</a>
     
  </div>
</div>

<form class="modal-content" action="loginUser" method="post"
	modelAttribute="passenger">
	<div class="container">
		<h1>LOGIN</h1>
		<h3>Please Enter the Correct Details</h3>
		<hr>
		<div style="color: red">
			<br>
			<b>${error}</b>
		</div>

		<label for="phoneNo"><b>Registered Mobile Number</b></label> <input
			type="text" placeholder="Enter Phone No." name="phoneNo"
			required="required" pattern="[0-9]{10}" value=${passenger.phoneNo}>

		<label for="password"><b>Password</b></label> <input type="password"
			placeholder="Enter Password" name="password" required="required">


		<div class="clearfix">
			<button type="submit" class="loginbtn">
				<b>LOGIN</b>
			</button>
		</div>
	</div>
</form>

</body>
</html>
