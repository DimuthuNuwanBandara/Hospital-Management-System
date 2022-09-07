<!DOCTYPE html>
<html>
<head>
	<title>C</title>
	<link rel="stylesheet" type="text/css" href="login.css">
	<script type="text/javascript" src="js code/titleClinic.js"></script>
</head>
<body>
	<h1 style="text-align: center;">ABC HOSPITAL</h1>
	<div style="text-align:center;font-weight:bold;color:red">Login Failed!!! Check Username or Password.</div>
	<section>
	<div class="box">
		<div class="square" style="--i:0;"></div>
			<div class="square" style="--i:1;"></div>
			<div class="square" style="--i:2;"></div>
			<div class="square" style="--i:3;"></div>
			<div class="square" style="--i:4;"></div>
			<div class="container">
				<div class="form">
					<h2>Login </h2>
					<form name="myform" role="form" action="login_validation.jsp" method="post">
						<div class="inputBox">
							<input type="text" id="name" name="email" placeholder="Username">
						</div>
						<div class="inputBox">
							<input type="password" id="pass" name="password" placeholder="Password">
						</div>
						<div class="inputBox">
							<select id="select" name="userrole">
       						<option value="select">Select</option>
   							<option value="admin">ADMIN</option>
    						<option value="DOCTOR">DOCTOR</option>
    						<option value="USER">USER</option>
  							</select>
						</div>
						<div class="inputBox">
							<input type="submit" value="Login">
						</div>
						<p class="forget">Forgot Password ? <a href="#">Click Here</a></p>
						<p class="forget">Don't have an account ? <a href="register_patient.jsp">Sign up</a></p>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>