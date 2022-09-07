<!DOCTYPE html>
<html>
<head>
	<title>register</title>
</head>
<link rel="stylesheet" type="text/css" href="css/register.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<body>
	<header>
    <h1>ABC HOSPITAL</h1>
    <a href="index.jsp">LOGIN</a>
  </header>
<div class="modal">
<form role="form"  class="modal-content "  action="patientRegistration" onsubmit="return dis()" method="post">
	<div class="imgcontainer">
         <h3>Registration Form</h3>
    </div>
	<div class="container">
	<label>Doctor Id:</label>
	<input type="number" name="patientid" placeholder="unique_id auto generated" readonly>
	<label>Name</label>
	<input type="text" name="patientname" id="name" placeholder="Name" >
	<span id="username" style="color: red; font-weight: bold;"> </span><br>
	<label>Email</label>
	<input type="email" name="email" id="email" placeholder="Email" autocomplete="off" >
	<label>Password</label>
    <input type="password" name="pwd" id="pwd" placeholder="Password" >
    <span id="passwords" style="color: red; font-weight: bold;"> </span><br>
	<label>Address</label>							 	  
	<input type="text" name="add" id="add" placeholder="Address" >
	<label>Wards</label>							 	  
	<input type="text" name="wards" id="wards" placeholder="Wards" >						  						
	<label>Phone</label>						 
	<input type="text" name="phone" id="phone" placeholder="Phone No." >
	<span id="mobileno" style="color: red; font-weight: bold;"> </span><br>	 											
	<label>Sex</label>						 
	<select name="gender">
	    <option>Male</option>
		<option>Female</option>
	</select>							  											  			
    </div>			
    <div class="container" style="background-color:#f1f1f1">	
	<button type="submit" class="cancelbtn">Register As Doctor Now</button>
</div>
</form>
</div>
<script type="text/javascript">
  function dis()
  {
  	var name=document.getElementById('name').value;
  	var email=document.getElementById('email').value;
  	var pwd=document.getElementById('pwd').value;
  	var add=document.getElementById('add').value;
  	var add=document.getElementById('wards').value;
    var phone=document.getElementById('phone').value;
  	var age=document.getElementById('age').value;
  	if(name== "" || email == "" || pwd == "" || add == "" | | wards == "" || phone== "" || age== ""){
				swal({
                title: "Field Empty!",
                text: "Please enter the details!!",
                 icon: "warning",
                  button: "OKAY",
        });
				return false;
			}
			if(!isNaN(name)){
				document.getElementById('username').innerHTML =" ** only characters are allowed";
				return false;
			}
		
			if((pwd.length <= 5) || (pwd.length > 20)) {
				document.getElementById('passwords').innerHTML =" ** Passwords lenght must be between  5 and 20";
				return false;	
			}


			if(isNaN(phone)){
				document.getElementById('mobileno').innerHTML =" ** user must write digits only not characters";
				return false;
			}
			if(phone.length!=10){
				document.getElementById('mobileno').innerHTML =" ** Mobile Number must be 10 digits only";
				return false;
			}
		

  }  
 </script>
</body>
</html>