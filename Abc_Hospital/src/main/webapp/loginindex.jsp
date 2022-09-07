<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>C</title>
	<link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
	<h1 style="text-align: center;">ABC HOSPITAL</h1>
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
							<input type="text" id="name" name="email" placeholder="Username" required>
						</div>
						<div class="inputBox">
							<input type="password" id="pass" name="password" placeholder="Password" required>
						</div>
						<div class="inputBox">
							<select id="select" name="userrole" required>
       						<option value="select">Select</option>
   							<option value="admin">ADMIN</option>
    						<option value="DOCTOR">DOCTOR</option>
    						<option value="USER">USER</option>
  							</select>
						</div>
						<div class="inputBox">
							<input type="submit" value="Login">
						</div>
						<p class="forget">Forgot Password ? <a href="changepassword.jsp">Click Here</a></p>
						<p class="forget">Don't have an account ? <a href="register_patient.jsp">Sign up</a></p>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script>

    let characterIndex = 0;

    let titleNames = ["A", "AB", "ABC", "ABC H", "ABC HO", "ABC HOS", "ABC HOSP", "ABC HOSPI", "ABC HOSPIT", "ABC HOSPITA", "ABC HOSPITAL"];

    window.updateTitleName = function () {
        document.getElementsByTagName("title")[0].innerHTML = titleNames[characterIndex++ % titleNames.length];
    }

    setInterval(() => {
        window.updateTitleName()
    }, 500);
 
	</script>
</body>
</html>