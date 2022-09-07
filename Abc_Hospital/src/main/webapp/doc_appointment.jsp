<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>C</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/doctor.css">
    <link rel="stylesheet" href="css/popup.css">
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
                        <th>Date Of Admit</th>
                        <th>Observed By</th>
                        <th>Status</th>    
                        <th>Options</th>
                </tr>
            </thead>
<%!
        int doctId,ap;
        String doctName;    
        int id,age;
        String name,gender,bgroup,phone,rov,doc_name,status,email,dname;
        Date admit_date;
        PreparedStatement ps;
        ResultSet rs;
%>
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
    PreparedStatement ps=c.prepareStatement("select * from appointment ",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
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
                            <a target="_blank" href="presc_report.jsp?ap=<%=ap%>"><i class="fa fa-eye" aria-hidden="true"></i></a></td>

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
  
  <form class="modal-content animate" action="presc_validation.jsp" method="post" style="width: 50%;">
    <div class="imgcontainer">
      <span onclick="document.getElementById('<%=ap%>').style.display='none'" class="close" title="Close Modal">&times;</span>
      <h3>ADD PRESCRIPTION</h3>
    </div>

         

 <div class="container">
    <p><b>Appointment no:</b></p> 
    <input type="number" name="apid" value="<%=ap%>" readonly> 
        <br>
 <p><b>Patient Name:</b><%=name%><b>&nbsp;&nbsp;&nbsp;  Doctor Name:</b><%=doc_name%></p>   
        <br>
  <table class="_table">
    <thead>
      <tr>
        <th>Prescription</th>
        <th width="50px">
          <div class="action_container">
            <span class="success" onclick="create_tr('table_id')">
              <i class="fa fa-plus"></i>
            </span>
          </div>
        </th>
      </tr>
    </thead>
    <tbody id="table_id">
      <tr>
        <td>
          <textarea style="height: 200px;" class="form_control" name="pre" placeholder="Direction for uses..."></textarea>
        </td>
        <td>
          <div class="action_container">
            <span class="danger" onclick="remove_tr(this)">
              <i class="fa fa-close"></i>
            </span>
          </div>
        </td>
      </tr>
    </tbody>
  </table>
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
<!----------------------popup end-------------------------------------------------->

     
    
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