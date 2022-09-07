<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
<head>
    <script>
        function confirmDelete()
        {
            return confirm("Do You Really Want to Delete Ward record?");
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
                    <a href="store.jsp">
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
                <form action="search_nurse.jsp">
                <div class="search">
                    <label>
                        <input type="text" placeholder="Name/Address" name="searchString">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </label>
                </div>
                </form> 

                <div class="duser">

                </div>   
 

            </div>

<!----------------------nurse tab switch------------------------------------->
<div class="mytabs">
    <input type="radio" id="tabfree" name="mytabs" checked="checked">
    <label for="tabfree">Ward List</label>
    <div class="tab">
      <h3>Available Ward</h3>
       <table class="content-table">
        <thead>
                <tr class="active">
                        <th>Ward ID</th>
                        <th>Ward Name</th>
                        <th>Patient Name</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Phone No.</th>
                        <th>Options</th>
                </tr>
            </thead>
<%!
        int wardId;
        String wardName,patientName,email,add,phone;
%>
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
    PreparedStatement ps=c.prepareStatement("select * from ward",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
        wardId=rs.getInt(1);
        wardName=rs.getString(2);
        patientName=rs.getString(3);
        email=rs.getString(4);
        add=rs.getString(5);
        phone=rs.getString(6);
        
%>   
             <tbody>
                    <tr>
                            <td><%=wardId%></td>
                            <td><%=wardName%></td>
                            <td><%=patientName%></td>
                            <td><%=email%></td>
                            <td><%=add%></td>
                            <td><%=phone%></td>
                            <td>
                            <button type="button" onclick="document.getElementById('<%=wardId%>').style.display='block'" ><i class="fa fa-pencil" aria-hidden="true"></i></button>
                            <a  href="delete_nurse_validation.jsp?nurseId=<%=wardId%>" onclick="return confirmDelete()" ><i class="fa fa-trash" aria-hidden="true"></i></a>
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
        wardId=rs.getInt(1);
        wardName=rs.getString(2);
        email=rs.getString(3);
        add=rs.getString(4);
        phone=rs.getString(5);
        
%>   
<div id="<%=wardId%>" class="modal">
  
  <form class="modal-content animate" action="edit_nurse_validation.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('<%=wardId%>').style.display='none'" class="close" title="Close Modal">&times;</span>
      <h3>Edit Ward Information</h3>
    </div>

        <div class="containerz">
        <p><b>Ward Id</b></p>
        <input type="number" name="wardId" placeholder="Nurse Id" value="<%=wardId%>" readonly="readonly">
        <br>
        <p><b>Ward Name</b></p>
        <input type="text" name="wardName" value="<%=wardName%>">
        <br>
        <p><b>Patient Name</b></p>
        <input type="text" name="patientName" value="<%=patientName%>">
        <br>
        <p><b>Email</b></p>
        <input type="email" name="email" value="<%=email%>">
        <br>
        <p><b>Address</b></p>
        <input type="text" name="add" value="<%=add%>">
        <br>
        <p><b>Phone</b></p>
        <input type="text" name="phone" value="<%=phone%>">
        <br>
         </div>
    <div class="containerz" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('<%=wardId%>').style.display='none'" class="cancelbtn">Cancel</button>
      <input type="submit" class="psw" value="Update"></button>
    </div>
  </form>
</div>
<%
    }
    ps.close();
    rs.close();
%>
<!----------------------popup end-------------------------------------------------->
    <input type="radio" id="tabsilver" name="mytabs" >
    <label for="tabsilver">Add Ward</label>
    <div class="tab">
       
 <!----------------   Add nurse Start   --------------->
       
                <form action="add_nurse_validation.jsp" method="post">
                    <div class="styler">
                    <p >Ward Id:</p>
                        <input type="number" name="id" placeholder="Ward ID auto generated" readonly> 
                    <p>Ward Name</p>
                        <input id="texting" type="text" name="wardName" placeholder="wardName" required="required">
                    <p>Patient Name</p>
                        <input id="texting" type="text" name="patientName" placeholder="patientName" required="required">
                    <p>Email</p>  
                        <input type="email"   name="email" placeholder="Email" required="required">
                    <p>Password</p>
                        <input type="password"  name="password" placeholder="Password" required="required">
                    <p>Address</p>
                        <input id="texting" type="text"   name="address" placeholder="Address" required="required">
                     <p>Phone</p>
                        <input id="texting" type="text"   name="phone" placeholder="Phone No." required="required">
                      
                            <input type="submit" class="psw" value="Add Ward"></button>
                         </div>
                </form>
           <!--------------------------   Add ward Ends   --------------->   
    </div>
    
</div>
 
<!----------------------doct tab switch(end)------------------------------------->

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