<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>C</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/admin.css" rel="stylesheet">
    <link href="css/madtable.css" rel="stylesheet">
    <link rel="stylesheet" href="css/popup.css">
    <script type="text/javascript" src="js code/titleAbc.js"></script>
</head>
<body>
    <div class="container">

        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                    <span class="icon"></span>
                    <span class="title"><h2>ABC<span style="color: #66BF0CFF;">HOSPITAL</span></h2></span>  
                    </a>
                </li>
                <li>
                    <a href="doctor_page.jsp">
                    <span class="icon"><i class="fa fa-user-md" aria-hidden="true"></i></span>
                    <span class="title">MY DETAIL</span>    
                    </a>                 
                </li>
                <li>
                    <a href="mypatient.jsp">
                    <span class="icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                    <span class="title">MY PATIENTS</span>    
                    </a>
                </li>
                <li>
                    <a href="doc_appointment.jsp">
                    <span class="icon"><i class="fa fa-list-alt" aria-hidden="true"></i></span>
                    <span class="title">APPOINTMENT</span>    
                    </a>
                </li>
                <li>
                    <a href="logout.jsp">
                    <span class="icon"><i class="fa fa-sign-out" aria-hidden="true"></i></span>
                    <span class="title">LOGOUT</span>  
                    </a>                   
                </li>
            </ul>
        </div>



        <div class="main">
            <div class="topbar">
                <div class="toggle" onclick="toggleMenu();"></div>
                <div class="search">
                    <label>
                        <input type="text" placeholder="Search here" name="search">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </label>
                </div>
                 

                <div class="duser">

                </div>   
        </div>
        

        <div class="patientD">
        
        <!----------------   Display Patients Data List Start  --------------->
<%!  
        int id;
        String name,phone,add,email,dept;
        PreparedStatement ps;
        ResultSet rs;
%>
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
    PreparedStatement ps=c.prepareStatement("select * from add_doctor",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    rs=ps.executeQuery();
    if(rs.next())
    {
        id=rs.getInt(1);
        name=rs.getString(2);
        email=rs.getString(3);
        add=rs.getString(5);
        phone=rs.getString(6);
        dept=rs.getString(7);

          
%>   
               <span class="pic"><span class="icons"><i style="color:#8CDEF2FF;font-size: 100px;" class="fa fa-user-md" aria-hidden="true"></i></span> </span>
               <table>
                <tr>
                    <td> ID:</td>
                    <td> <%=id%> </td>
                </tr>
                <tr>
                    <td>NAME:</td>
                    <td><%=name%></td>
                </tr>
                <tr>
                    <td>PHONE NO:</td>
                    <td><%=phone%></td>
                </tr>
                <tr>
                    <td>E-MAIL:</td>
                    <td><span><%=email%></td>
                </tr>
                <tr>
                    <td>ADDRESS:</td>
                    <td><%=add%></td>
                </tr>
                <tr>
                    <td>DEPARTMENT:</td>
                    <td><%=dept%></td>
                </tr>
                <tr>
                    <td></td>
                    <td><a  href="#"><input style="width: auto;padding: 7px 18px;background-color: 
                    #8CDEF2FF;  border-radius: 35px;" onclick="document.getElementById('<%=id%>').style.display='block'" type="submit" class="psw" value="EDIT"></button></a></td>
                </tr>
              </table>
<%
    }
    rs.first();
    rs.previous();
%>              
    <!----------------------pop up --------------------------------------------------->
<%
    while(rs.next())
    {
        id=rs.getInt(1);
        name=rs.getString(2);
        email=rs.getString(3);
        add=rs.getString(5);
        phone=rs.getString(6);
        dept=rs.getString(7);
%> 
<div id="<%=id%>" class="modal">
  
  <form class="modal-content animate" action="edit_doctorPage.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('<%=id%>').style.display='none'" class="close" title="Close Modal">&times;</span>
      <h3>Edit Profile</h3>
    </div>

        <div class="containerz">
        <p><b>Patient Id:</b></p>
        <input type="number" name="patientid" placeholder="Patient ID" value="<%=id%>" readonly="readonly">
        <br>
        <p><b>Name</b></p>
        <input type="text" name="patientname" value="<%=name%>" placeholder="Name" readonly="readonly"> 
        <br>
        <p><b>Email</b></p>
        <input type="email" name="email" value="<%=email%>" placeholder="Email" >
        <br>
        <p><b>Address</b></p>
        <input type="text" name="add" value="<%=add%>" placeholder="Address" >
        <br>
        <p><b>Phone</b></p>
        <input type="text" name="phone" value="<%=phone%>" placeholder="Phone" >
        <br>
        <p><b>Department</b></p>
        <input type="text" name="dept" value="<%=dept%>" placeholder="Phone" >
        <br>
         </div>
    <div class="containerz" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('<%=id%>').style.display='none'" class="cancelbtn">Cancel</button>
      <input type="submit" class="psw" value="Update"></button>
    </div>
  </form>
</div>
<%
    }
%>
<!----------------------popup end-------------------------------------------------->
        </div>   

         





        </div>
    </div>
    <script>
        function toggleMenu(){
            let toggle= document.querySelector('.toggle');
            let navigation= document.querySelector('.navigation');
            let main= document.querySelector('.main');
            toggle.classList.toggle('active');
            navigation.classList.toggle('active');
            main.classList.toggle('active');
        }
    </script>
</body>
</html>