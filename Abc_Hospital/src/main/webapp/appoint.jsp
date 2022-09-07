<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
<head>
    <script>
        function confirmDelete()
        {
            return confirm("Do You Really Want to Delete appointment?");
        }
     </script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>C</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/admin.css" rel="stylesheet">
    <link rel="stylesheet" href="css/popup.css">
    <link rel="stylesheet" type="text/css" href="css/doctor.css">
     <link rel="stylesheet" type="text/css" href="css/tableHoverPresc.css">
     <script type="text/javascript" src="js code/titleAbc.js"></script>
     <script type="text/javascript" src="js code/print.js"></script>
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
                    <a href="admin.jsp">
                    <span class="icon"><i class="fa fa-home" aria-hidden="true"></i></span>
                    <span class="title">DASHBOARD</span>    
                    </a>                 
                </li>
                <li>
                    <a href="department.jsp">
                    <span class="icon"><i class="fa fa-building" aria-hidden="true"></i></span>
                    <span class="title">DEPARTMENT</span>    
                    </a>
                </li>
                <li>
                    <a href="doctors.jsp">
                    <span class="icon"><i class="fa fa-user-md" aria-hidden="true"></i></span>
                    <span class="title">DOCTORS</span>    
                    </a>
                </li>
                <li>
                    <a href="patients.jsp">
                    <span class="icon"><i class="fa fa-users" aria-hidden="true"></i></span>
                    <span class="title">PATIENTS</span>    
                    </a>
                </li>
                <li>
                    <a href="nurse.jsp">
                    <span class="icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                    <span class="title">WARD</span>    
                    </a>   
                </li>
                 <li>
                    <a href="nurse.jsp">
                    <span class="icon"><i class="fa fa-cog" aria-hidden="true"></i></span>
                    <span class="title">STORE</span>    
                    </a>   
                </li>
                <li>
                    <a href="donor.jsp">
                    <span class="icon"><i class="fa fa-tint" aria-hidden="true"></i></span>
                    <span class="title">BLOOD DONOR</span>    
                    </a>                    
                </li>
                <li>
                    <a href="appoint.jsp">
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
                <form action="search_patients.jsp">
                <div class="search">
                    <label>
                        <input type="text" placeholder="ID/Address" name="searchString">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </label>
                </div>
                </form> 

                <div class="duser">

                </div>   
 

            </div>

<!----------------------patient tab switch------------------------------------->
<div class="mytabs">
    <input type="radio" id="tabfree" name="mytabs" checked="checked">
    <label for="tabfree">Appointment Lists</label>
    <div class="tab" id="print">
      <h3>Recent Appointments<button  class="print" style="width: 80px; height: 30px; border: 2px solid grey; border-radius: 10px; margin-left: 600px;" onclick="prints('print')"><i class="fa fa-print" aria-hidden="true"></i> PRINT</button>
</h3>
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
                        <th>Options</th>
                </tr>
            </thead>
<%!
        int doctId;
        String doctName;    
        int id,age,ap;
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
                            <td>
                            <button type="button" title="EDIT" onclick="document.getElementById('<%=ap%>').style.display='block'" ><i class="fa fa-pencil" aria-hidden="true"></i></button>
                            <a  href="delete_appoint_validation.jsp?appointid=<%=ap%>" title="DELETE" onclick="return confirmDelete()" ><i class="fa fa-trash" aria-hidden="true"></i></a>
                             <a target="_blank" href="presc_report.jsp?ap=<%=ap%>"><i class="fa fa-eye" aria-hidden="true"></i></a>
                            </td>
                    </tr>
            </tbody>  
<%
        }
    rs.first();
    rs.previous();
%>    
        </table>

    </div>
    
<!----------------------pop up --------------------------------------------------->
<%
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
<div id="<%=ap%>" class="modal">
  
  <form class="modal-content animate" action="appoint_validation.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('<%=ap%>').style.display='none'" class="close" title="Close Modal">&times;</span>
      <h3>Edit Patient Information</h3>
    </div>

        <div class="containerz">
        <p><b>Appointment Id:</b></p>
        <input type="number" name="appointid"  value="<%=ap%>" readonly="readonly">
        <br>
        <p><b>Reffered To</b></p>
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
         
         </div>
    <div class="containerz" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('<%=ap%>').style.display='none'" class="cancelbtn">Cancel</button>
      <input type="submit" class="psw" value="Update"></button>
    </div>
  </form>
</div>
<%
    }
%>

 
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