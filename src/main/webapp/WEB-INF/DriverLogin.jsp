<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Driver Login</title>
<style>
		  body, html {
			  /*height: 100%;*/
			  font-family:  sans-serif;
			  text-align:center;
			}
			
			.bgimage {
			  background-image: url('../img/driver2.jpg');
			  min-height:620px;
			  background-repeat: no-repeat;
			  background-size: 70% 100%;
			  background-position: left top;
			}
	
			.container {
			  position: absolute;
			  right: 0;
			  margin: 20px;
			  max-width: 300px;
			  padding: 16px;
			  background-color: white;
			}
			.button {
			  background-color: grey;
			  color: white;
			  padding: 10px 5px;
			  text-align: center;
			  font-size: 20px;
			  margin: 10px 5px;
			}
			.inputtype{
				font-family: Poppins-Regular;
				font-size: 20px;
				line-height: 2.5;
				color: black;
				margin: 5px;
				text-align:center;
			}
</style>
</head>
<body>

<div class="bgimage">
  <form action="/AcceptRide" class="container">
	<b><span style="font-size:20pt;color:brown">LOGIN</span></b><br><br>
		<input  type="text" name="id" value="" placeholder="Driver Id" class="inputtype" required><br><br>
		<input  type="password" name="password" value="" placeholder="Password" class="inputtype" required><br><br>
		<input type="submit" value="Login" class="button" ><br><br>
		<input type="button" value="New Driver ? SignUp Here" class="button" onclick="goToDriverSignUp()" > 
	</form>

</div>
<script type="text/javascript">
	function goToDriverSignUp() {
		alert("Going to SignUp page...");
		window.location.href="/DriverSignUp";
	}
</script>


</body>
</html>
