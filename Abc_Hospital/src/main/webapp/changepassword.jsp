<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CHANGE PASSWORD</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- //web font -->
</head>
<body>
<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>CHANGE PASSWORD</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form action="changepassword.jsp" method="post">
					<input class="text" type="text" name="doctorId" placeholder="DoctorID" required=""><br>
					<input class="text" type="password" name="pass" placeholder="New Password" required="">
					<input class="text w3lpass" type="password" name="pass1" placeholder="Confirm Password" required="">
					
						
						
					<input type="submit" value="CHANGE PASSWORD">
				</form>
				
			</div>
		</div>
		<!-- copyright -->
		
		<!-- //copyright -->
		
	</div>
	<!-- //main -->
<% 
String userid=request.getParameter("UserId");
String password=request.getParameter("pass");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
	PreparedStatement ps=c.prepareStatement("update registration2 set pass=? where UserId=?");
	ps.setString(2,userid);
	ps.setString(1,password);
	int i=ps.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("change_pass_validation.jsp");
	}
	else{
		response.sendRedirect("index.jsp");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
	%>
</body>
</html>