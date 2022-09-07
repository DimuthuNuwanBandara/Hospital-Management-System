<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
<head>
    <script>
        function confirmDelete()
        {
            return confirm("Do You Really Want to Delete Doctor?");
        }
     </script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>C</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/admin.css" rel="stylesheet">
    <link rel="stylesheet" href="css/popup.css">
    <link rel="stylesheet" type="text/css" href="css/doctor.css">
     <link rel="stylesheet" type="text/css" href="css/tableHoverPresc.css">
     <script type="text/javascript" src="js code/titleClinic.js"></script>
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
                <form action="search_doctor.jsp">
                <div class="search">
                    <label>
                        <input type="text" placeholder="Id/Department/Address" name="searchString">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </label>
                </div>
                </form>

                <div class="duser">

                </div>   
 

            </div>

<!----------------------doct tab switch------------------------------------->
<div class="mytabs">
    <input type="radio" id="tabfree" name="mytabs" checked="checked">
    <label for="tabfree">Doctor List</label>
    <div class="tab">
      <h3>Available Doctors</h3>
       <table class="content-table">
        <thead>
                <tr class="active">
                        <th>Doctor ID</th>
                        <th>Doctor Name</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Phone No.</th>
                        <th>Department</th>
                        <th>Options</th>
                </tr>
            </thead>
<%!
        int deptId;
        String deptName;    
        int id;
        String name,email,pwd,add,phone,dept;
        PreparedStatement ps;
        ResultSet rs;
%>
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
    PreparedStatement ps=c.prepareStatement("select * from add_doctor",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    rs=ps.executeQuery();
    while(rs.next())
    {
        id=rs.getInt(1);
        name=rs.getString(2);
        email=rs.getString(3);
        add=rs.getString(5);
        phone=rs.getString(6);
        dept=rs.getString(7);
        
%>  

             <tbody>
                    <tr>
                            <td><%=id%></td>
                            <td><%=name%></td>
                            <td><%=email%></td>
                            <td><%=add%></td>
                            <td><%=phone%></td>
                            <td><%=dept%></td>
                            <td>
                            <button type="button" onclick="document.getElementById('<%=id%>').style.display='block'" ><i class="fa fa-pencil" aria-hidden="true"></i></button>
                            <a  href="delete_doct_validation.jsp?doctId=<%=id%>" onclick="return confirmDelete()" ><i class="fa fa-trash" aria-hidden="true"></i></a>
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
        email=rs.getString(3);
        pwd=rs.getString(4);
        add=rs.getString(5);
        phone=rs.getString(6);
        dept=rs.getString(7);
        
%>  
<div id="<%=id%>" class="modal">
  
  <form class="modal-content animate" action="edit_doct_validations.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('<%=id%>').style.display='none'" class="close" title="Close Modal">&times;</span>
      <h3>Edit Doctor Information</h3>
    </div>

        <div class="containerz">
        <p><b>Doctor Id:</b></p>
        <input type="number" name="doctid" placeholder="Doctor ID" value="<%=id%>" readonly="readonly">
        <br>
        <p><b>Name</b></p>
        <input type="text" name="doctname" value="<%=name%>" placeholder="Name" > 
        <br>
        <p><b>Email</b></p>
        <input type="email" name="email" value="<%=email%>" placeholder="Email" >
        <br>
        <p><b>Password</b></p>
        <input type="password"  name="pwd" value="<%=pwd%>" placeholder="Password" >
        <br>
        <p><b>Address</b></p>
        <input type="text" name="add" value="<%=add%>" placeholder="Address" >
        <br>
        <p><b>Phone</b></p>
        <input type="text" name="phone" value="<%=phone%>" placeholder="Phone No." >
        <br>
        <p><b>Department</b></p>
        <select name="dept">
            <option selected="selected"><%=dept%></option>
<%
    ps=c.prepareStatement("select * from add_depart",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    rs=ps.executeQuery();
    while(rs.next())
    {
        deptId=rs.getInt(1);
        deptName=rs.getString(2);
%>
                            
                  <option value="<%=deptName%>"><%=deptName%>(<%=deptId%>)</option>
<%
    }
%>               
        </select>

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
    <input type="radio" id="tabsilver" name="mytabs" >
    <label for="tabsilver">Add Doctor</label>
    <div class="tab">
       
 <!----------------   Add Doctor Start   --------------->
       
                <form action="addDoctor" method="post">
                    <div class="styler">
                    <p >Doctor Id:</p>
                        <input type="number"   name="doctid" placeholder="Doctor ID Auto Generated" readonly> 
                    <p>Name</p>
                        <input id="texting" type="text" class="form-control" name="doctname" placeholder="Name" required="required">
                    <p>Email</p>  
                        <input type="email"   name="email" placeholder="Email" required="required">
                    <p>Password</p>
                        <input type="password"  name="pwd" placeholder="Password" required="required">
                    <p>Address</p>
                        <input id="texting" type="text"   name="add" placeholder="Address" required="required">
                     <p>Phone</p>
                        <input id="texting" type="text"   name="phone" placeholder="Phone No." required="required">
                     <p>Department</p> 
                        <select name="dept">
 <option selected="selected">Select Department</option>
  <%
    ps=c.prepareStatement("select * from add_depart",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    rs=ps.executeQuery();
    while(rs.next())
    {
        deptId=rs.getInt(1);
        deptName=rs.getString(2);
%>  
             <option value="<%=deptName%>"><%=deptName%>(<%=deptId%>)</option> 
<%
    }
%>                      
                                                                              
                      </select>
                      

                 
                        
                            <input type="submit" class="psw" value="Add Doctor"></button>
                         </div>
                </form>
                           <!----------------   Add Doctor Ends   --------------->   
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