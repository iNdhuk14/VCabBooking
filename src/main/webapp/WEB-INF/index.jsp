<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<title>CabBooking</title>
	<style>
		.center {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  height: 500px;
		 }
		 
		.button {
		  background-color: #4CAF50;
		  border: none;
		  color: black;
		  padding: 32px 32px;
		  text-align: center;
		  font-size: 40px;
		  margin: 50px 30px;
		  display:block;
		}
		.title {
			font-family: "Allerta Stencil", Sans-serif;
			font-size: 50px;
			text-align: center;
			float: center;
			padding: 16px;
			background-color:grey;
			color: white;
		}
	</style>
</head>
<body>
<div class="title">
		<span class="glyphicon glyphicon-map-marker"></span>V CABS
</div>
<div class="center">
	<button class="button" onclick="goToLogin()">User<i class="fa fa-user" style="font-size:100px"></i></button>
	<button class="button" onclick="goToDriverLogin()">Driver<i class="fa fa-taxi" style="font-size:100px"></i></button>
	<button class="button" onclick="goToAdmin()">Admin <i class='fas fa-user-lock' style="font-size:100px"></i></button>	
</div>	
<script type="text/javascript">
	function goToLogin() {
		//alert("Going to Login page...");
		window.location.href="/login";
	}
	function goToDriverLogin() {
		alert("Going to Login page...");
		window.location.href="/DriverLogin";
	}
	function goToAdmin() {
		alert("Going to Admin page...");
		window.location.href="/Admin";
	}
</script>
</body>	
