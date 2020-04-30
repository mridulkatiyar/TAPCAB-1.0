<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>Register | TAPCAB</title>
 <link href="<c:url value="/resources/static/style/RegistrationStyle.css"/>"rel="stylesheet">
  <script type="text/javascript">
 var check = function() {
     if (document.getElementById('password1').value ==
         document.getElementById('cPassword').value) {
         document.getElementById('message').style.color = 'green';
         document.getElementById('message').innerHTML = 'Matching';
     } else {
     		document.getElementById('message').style.color = 'red';
         document.getElementById('message').innerHTML = 'Not Matching';
     }
 }
 </script>
 <script src="<c:url value="/resources/static/js/passwordValidate.js" />"></script>
 


</head>
<body background="<c:url value="/resources/static/images/cab2.jpg"/>" />

<div class="header">
  <a href="/TapCab" class="logo">TAP CAB</a>
  <a href="loginAdminForm">ADMINISTRATION</a>  
  
  <div class="header-right">
    <a href="/TapCab">HOME</a>
   <a class="active" href="registerUser">REGISTRATION</a>
    <a href="loginForm">LOGIN</a>
     <a href="aboutUs">ABOUT US</a>
     <a href="contactUs">CONTACT US</a>
     
  </div>
</div>
  <form class="modal-content" action="saveCustomer" method="post" modelAttribute="passenger">
    <div class="container">
      <h1>REGISTRATION </h1>
      <h3>Please fill in this form to create an account.</h3>
      <hr>
      <label for="name"><b>Name</b></label>
      <input type="text" placeholder="Enter Name" name="name" required="required">

     <label for="phoneNo"><b>Phone No.</b></label>	<div style="color: red">
			<b>${error}</b>
		</div>
      <input type="text" placeholder="Enter Phone No." name="phoneNo" required="required" pattern="[0-9]{10}">
       
      <label for="password"><b>Create Password</b></label>
      <input  onkeyup='check();' id=password1 type="password" placeholder="Enter Password" name="password" required="required"> 
      
       <label for="password"><b>Confirm Password</b></label> <b><span id='message'></span></b>
      <input  onkeyup='check();' id=cPassword type="password" placeholder="Enter Password" name="confirmPassword" required="required">  

      <label for="email"><b>Email</b></label>
      <div style="color: red">
			<b>${error1}</b>
		</div>
      <input type="email" placeholder="Enter Email" name="email" required="required">

      <label for="DOB"><b>DOB</b></label>
      <input type="date" id="theDOB"  name="DOB" required="required">
      <script>
      
      function checkDOB() {
    	   var selectedText = document.getElementById('theDOB').value;
    	   var selectedDate = new Date(selectedText);
    	   var now = new Date();
    	   if (now < selectedDate) {
    		   alert("Please Enter a valid Date-Of-Birth");
    		   return false;
    		   }
    	   else{
    		   if (!(confirm('Press Ok to Register Yourself!'))) return false;
    	   }
    	 }    	 
      
      </script>

     

<label for="gender" ><b>Gender</b></label>
<input type="radio" name="gender" id="male" value=" Male "  required="required"   />
 <label for="male">Male</label>
 <input type="radio" name="gender" id="female" value=" Female " required="required"  /> 
<label for="female" >Female</label>
<input type="radio" name="gender" id="other" value=" Others "  required="required"  /> 
<label for="other" >Other</label>

      <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

      <div class="clearfix">
        <button type="submit" class="signupbtn" onclick="return checkDOB()"><b>SIGN UP</b></button>
      </div>
    </div>
  </form>
  

</body>
</html>
