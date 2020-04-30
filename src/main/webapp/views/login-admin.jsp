<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login | TAPCAB</title>
<link href="<c:url value="/resources/static/style/LoginStyle.css" />"
	rel="stylesheet">
</head>

<body background="<c:url value="/resources/static/images/cab2.jpg"/>" />

<div class="header">
	<a href="/TapCab" class="logo">TAP CAB</a>
	<a	class="active" href="loginAdminForm"><b>ADMINISTRATION</b></a>
	<div class="header-right">
		<a href="/TapCab">HOME</a>  
	</div>
</div>

<form class="modal-content" action="loginAdmin" method="post"
	modelAttribute="admin">
	<div class="container">
		<h1>ADMIN LOGIN</h1>
		<h3>Please Enter the Correct Details</h3>
		<hr>
		<div style="color: red">
			<br>
			<b>${error}</b>
		</div>

		<label for="adminId"><b>Enter Admin Id</b></label> <input
			type="text" placeholder="Enter Admin Id" name="adminId"
			required="required" >

		<label for="password"><b>Password</b></label> <input type="password"
			placeholder="Enter Password" name="password" required="required">


		<div class="clearfix">
			<button type="submit" class="loginbtn">
				<b>LOGIN AS ADMIN</b>
			</button>
		</div>
	</div>
</form>

</body>
</html>
