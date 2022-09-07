<%@page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat" %>


<%
    String pid=request.getParameter("patientid");

	String pname=request.getParameter("patientname");

	String phone=request.getParameter("phone");

	String rov=request.getParameter("rov");

	String gender=request.getParameter("gender");

	String joindate=request.getParameter("joindate");

	String age=request.getParameter("age");

	String bgroup=request.getParameter("bgroup");

	String doct=request.getParameter("doct");
	String status="not specified";

SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");
java.sql.Date udob=java.sql.Date.valueOf(joindate);
 

        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("insert into appointment(id,pname,gender,age,bgroup,phone,rea_of_visit,doc_name,date_ad,status,ap) values(?,?,?,?,?,?,?,?,?,?,seq.nextval)");
        ps.setString(1,pid);
      	ps.setString(2,pname);
      	ps.setString(3,gender);
     	ps.setInt(4,Integer.parseInt(age));
     	ps.setString(5,bgroup);
     	ps.setString(6,phone);
     	ps.setString(7,rov);
     	ps.setString(8,doct);
      	ps.setDate(9,udob);
      	ps.setString(10,status);
    
	int i =ps.executeUpdate();
  
	if(i>0)

	{
		 
%>
<div style="text-align:center;margin-top:25%">
<font color="magenta">
<script type="text/javascript">
function Redirect()
{
    window.location="userAppointment.jsp";
}
document.write("<h2>Appointment Added Successfully</h2><br><Br>");
document.write("<h3>Redirecting you to the page....</h3>");
setTimeout('Redirect()', 3000);
</script>
</font>
</div>
<%
	}

	ps.close();
	con.commit();	
%>