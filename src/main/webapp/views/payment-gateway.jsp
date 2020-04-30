<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
<!DOCTYPE html>
<html>
<head>
<title>Payment Gateway</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="<c:url value="/resources/static/style/RegistrationStyle.css"/>" rel="stylesheet">
  <link href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/static/style/AfterLoginStyle.css"/>"rel="stylesheet">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}


.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 50%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}
select {

background-repeat:no-repeat;
background-position:300px;
width:353px;
padding:12px;
margin-top:8px;
font-family:Arial;
line-height:1;
border-radius:5px;
background-color:#f1f1f1;
color:black;
font-size:18px;
-webkit-appearance:none;

outline:none
}


</style>
</head>
<body background="<c:url value="/resources/static/images/mytripsback.jpg"/> "/>
<div class="header">

<c:url var="updateLink1" value="/myInfo">
    <c:param name="phoneNo" value="${passenger.phoneNo}" /></c:url>
    <a href="${updateLink1}"><b>Cancel Payment</b></a>
    </div>
    
<form name="myform"  class="modal-content" action="pay" method="post" modelAttribute="passenger">
 
          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>

   		    <label for="phoneNo">Phone Number</label>
            <input type="text" id="phoneNo" name="phoneNo" value="${passenger.phoneNo}" readonly="readonly">

			<label for="walletAmount">Amount</label>
            <input type="number" id="walletAmount" name="walletAmount" placeholder="Amount" required="required">

            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="Card Holder's Name" required="required">

            <label for="ccnum">Credit/Debit card number</label>
            <input type="text" id="CreditCardNumber" name="CreditCardNumber" placeholder="1111-2222-3333-4444" required="required">

            <label for="expmonth">Exp Month</label>
            <select required="required">
             	
                    <option value="01">January</option>
                    <option value="02">February </option>
                    <option value="03">March</option>
                    <option value="04">April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
                <br><br>
         <!--    <input type="text" id="expmonth" name="expmonth" placeholder="September" required="required"> -->

              <label for="expyear">Exp Year</label>
              <select required="required">
              
                    <option value="16"> 2020</option>
                    <option value="17"> 2021</option>
                    <option value="18"> 2022</option>
                    <option value="19"> 2023</option>
                    <option value="20"> 2024</option>
                    <option value="21"> 2025</option>
                </select>
                <br><br>
<!--                 <input type="text" id="expyear" name="expyear" placeholder="2024"  required="required"> -->           
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="123" required="required">
              <br>
              <br>
         <button type="submit" class="updatebtn" onclick="return validate_creditcardnumber();"><b>Pay Now</b></button>
        
        </div>
        
 </form>  
 <script>
 function validate_creditcardnumber() {
	    var re16digit = /^\d{16}$/
	    if (!re16digit.test(document.myform.CreditCardNumber.value)) {
	        alert("Please Enter Your 16 digit Card Number");
	        return false;
	    }
	}
 </script>    
</body>
</html>
