<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>DriverSignUp</title>
	<style>
		  body, html {
			  /*height: 100%;*/
			  font-family:  sans-serif;
			  text-align:center;
			}
			
			.bgimage {
			  background-image: url('../img/driver.jpg');
			  min-height:620px;
			  background-repeat: no-repeat;
			  background-size: 70% 100%;
			  background-position: right top;
			}
	
			.container {
			  position: absolute;
			  right: 1;
			  margin: 20px;
			  max-width: 300px;
			  padding: 16px;
			  background-color: none;
			}
		.inputtype{
				font-family: Poppins-Regular;
				font-size: 20px;
				line-height: 2.5;
				color: black;
				margin: 5 px;
				text-align:center;
			}
		.button {
			  background-color: brown;
			  color: white;
			  padding: 10px 5px;
			  text-align: center;
			  font-size: 20px;
			  margin: 10px 5px;
			  
			}	
	
	</style>
</head>
<body>
<div class="bgimage">
	<form action="/adddriver" method="post" class="container">
		<c:if test="${empty SignUpError}">
			<h1>${SignUpError}</h1>
		</c:if><br><br>
		<b><span style="font-size:20pt;color:brown">SIGN UP</span></b><br><br>
		<input  type="text" name="driverName" value="" placeholder="Name" class="inputtype" required ><br><br>
		<input type="tel" name="mobile" placeholder="MobileNumber" value="" pattern="{0-9}" class="inputtype" required><br><br>
		<input  type="password" name="password1" id="pwd" value="" placeholder="Password" class="inputtype" required><br><br>
		<input  type="password" name="password2" value="" id="pwd1" placeholder="Confirm Password" class="inputtype"required><br><br>
		<input type="submit" value="Sign Up" class="button">
	</form>
	
</div>
<script type="text/javascript">
	    window.onload = function () {
	        var txtPassword = document.getElementById("pwd");
	        var txtConfirmPassword = document.getElementById("pwd1");
	        txtPassword.onchange = ConfirmPassword;
	        txtConfirmPassword.onkeyup = ConfirmPassword;
	        function ConfirmPassword() {
	            txtConfirmPassword.setCustomValidity("");
	            if (txtPassword.value != txtConfirmPassword.value) {
	                txtConfirmPassword.setCustomValidity("Passwords do not match.");
	            }
	        }
	    }
	</script>
</body>
</html>
