<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>C</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/admin.css" rel="stylesheet">
    <link rel="stylesheet" href="css/popup.css">
    <link rel="stylesheet" type="text/css" href="css/doctor.css">
    <link rel="stylesheet" type="text/css" href="css/tableHoverPresc.css">
    <script type="text/javascript" src="js code/titleAbc.js"></script>
</head>
<body> 
    <div class="container">

        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                    <span class="icon"></span>
                    <span class="title"><h2>ABC<span style="color: #66BF0CFF;"> HOSPITAL</span></h2></span>    
                    </a>
                </li>
                <li>
                    <a href="patient_page.jsp">
                    <span class="icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                    <span class="title">MY DETAIL</span>    
                    </a>                 
                </li>
                <li>
                    <a href="userAppointment.jsp">
                    <span class="icon"><i class="fa fa-user-md" aria-hidden="true"></i></span>
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
        
        <!----------------------patient tab switch------------------------------------->
<div class="mytabs">
    <input type="radio" id="tabfree" name="mytabs" checked="checked">
    <label for="tabfree">Appointment Lists</label>
    <div class="tab">
      <h3>Recent Appointments</h3>
       <table class="content-table">
        <thead>
                <tr class="active">
                        <th>ID</th>
                        <th>Patient Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>Blood Grp</th>
                        <th>Reason</th>
                        <th>Date Of Admit</td>
                        <th>Observed By</th>
                        <th>Status</th>
                        <th>Prescription</th>
                </tr>
            </thead>
<%!
        int doctId,ap;
        String doctName;    
        int id,age;
        String name,gender,bgroup,phone,rov,doc_name,status,email;
        Date admit_date;
        PreparedStatement ps;
        ResultSet rs;
%>    
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
    PreparedStatement ps=c.prepareStatement("select * from appointment",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    rs=ps.executeQuery();
    while(rs.next())
    {
        id=rs.getInt(1);
        name=rs.getString(2);
        gender=rs.getString(3);
        age=rs.getInt(4);
        bgroup=rs.getString(5);
        phone=rs.getString(6);
        rov=rs.getString(7);
        doc_name=rs.getString(8);
        admit_date=rs.getDate(9);
        status=rs.getString(10);
        ap=rs.getInt(11);
        
%>               
             <tbody>
                    <tr>
                            <td><%=id%></td>
                            <td><%=name%></td>
                            <td><%=age%></td>
                            <td><%=gender%></td>
                            <td><%=phone%></td>
                            <td><%=bgroup%></td>
                            <td><%=rov%> </td>
                            <td><%=admit_date%></td>
                            <td><%=doc_name%></td>
                            <td><%=status%></td>
                            <td><a target="_blank" href="presc_report.jsp?ap=<%=ap%>"><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                    </tr>
            </tbody>
<%
        }
    rs.first();
    rs.previous();
    
%>
        </table>

    </div>
 

    <input type="radio" id="tabsilver" name="mytabs" >
    <label for="tabsilver">Make Appointment</label>
    <div class="tab">

 <!----------------   Add patient Start   --------------->
<%!  
        PreparedStatement ds;
        ResultSet ss;
%> 
<%
    
    PreparedStatement ds=c.prepareStatement("select * from patients",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    ss=ds.executeQuery();
    if(ss.next())
    {
        id=ss.getInt(1);
        name=ss.getString(2);
        gender=ss.getString(3);
        age=ss.getInt(4);
        bgroup=ss.getString(5);
        phone=ss.getString(6);
        email=ss.getString(7);
%>   
                <form action="appointment_validation.jsp" method="post">
                    <div class="styler">
                    <p >Patient Id:</p>
                        <input type="number" name="patientid" value="<%=id%>" readonly>
                    <p>Name</p>
                        <input id="texting" type="text" name="patientname" value="<%=name%>" required="required">
                    <p>Age</p>
                        <input id="texting" type="text"  name="age" value="<%=age%>">
                    <p>sex</p>
                        <input id="texting" type="text"  name="gender" value="<%=gender%>">
                    <p>Phone</p>
                        <input id="texting" type="text"   name="phone" value="<%=phone%>" required="required">
                    <p>Blood Group</p> 
                        <input id="texting" type="text"   name="bgroup" value="<%=bgroup%>" required="required">
                    <p>Reason Of Visit</p>
                        <input id="texting" type="text"   name="rov" placeholder="Reason Of Visit">
                     <p>Reffered To</p>
        <select name="doct">
    <option selected="selected"><%=doc_name%></option>
 <%
    PreparedStatement ps2=c.prepareStatement("select * from add_doctor",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    ResultSet rs2=ps2.executeQuery();
    while(rs2.next())
    {
        doctId=rs2.getInt(1);
        doctName=rs2.getString(2);
%>      
                                                       
                          <option value="<%=doctName%>"><%=doctName%>(<%=doctId%>)</option>
 <%
    }
    ps2.close();
    rs2.close();
%>                         

    
    </select>
                    
                    <p>Admission Date</p>
                        <input type="date"  name="joindate" placeholder="Admission date">
                    
                
                            <input type="submit" class="psw" value="APPLY"></button>
                         </div>
                </form> 
 <%
    }
    ds.close();
    ss.close();
%> 
 <!----------------   Add patient Ends   --------------->   
    </div>
    
</div>
 
<!----------------------patient tab switch(end)------------------------------------->

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