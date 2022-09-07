<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
<head>
    
    <script>
        function confirmDelete()
        {
            return confirm("Do You Really Want to Delete Department?");
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
                    <a href="#">
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
                <form action="search_department.jsp">
                <div class="search">
                    <label> 
                        <input type="text" placeholder="Search department" name="searchString">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </label>
                </div>
                </form> 

                <div class="duser">

                </div>   
 

            </div>

<!----------------------dept tab switch------------------------------------->
<div class="mytabs">
    <input type="radio" id="tabfree" name="mytabs" checked="checked">
    <label for="tabfree">Department List</label>
    <div class="tab">
      <h3>Available Departments</h3>
       <table class="content-table">
        <thead>
                <tr class="active">
                        <th>Department ID</th>
                        <th>Department Name</th>
                        <th>Department Description</th>
                        <th>Options</th>                     
                </tr>
                                      
         </thead>
<%!
        int deptId;
        String deptName;
        String deptDesc;
%>
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
    PreparedStatement ps=c.prepareStatement("select * from add_depart",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
        deptId=rs.getInt(1);
        deptName=rs.getString(2);
        deptDesc=rs.getString(3);
        
%>
    
         
             <tbody>
                    <tr>
                           <td><%=deptId%></td>
                           <td><%=deptName%></td>
                           <td><%=deptDesc%></td>
                            <td>
                            <button type="button" onclick="document.getElementById('<%=deptId%>').style.display='block'" ><i class="fa fa-pencil" aria-hidden="true"></i></button>
                            <a  href="delete_dept_validation.jsp?deptId=<%=deptId%>" onclick="return confirmDelete()" ><i class="fa fa-trash" aria-hidden="true"></i></a>
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
        deptId=rs.getInt(1);
        deptName=rs.getString(2);
        deptDesc=rs.getString(3);
        
%>
<div id="<%=deptId%>" class="modal">
  
  <form class="modal-content animate" action="edit_dept_validation.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('<%=deptId%>').style.display='none'" class="close" title="Close Modal">&times;</span>
      <h3>Edit Department Information</h3>
    </div>

        <div class="containerz">
        <p><b>Department ID:</b></p>
        <input type="number" name="deptId" placeholder="Department ID" value="<%=deptId%>" readonly="readonly">
        <br>
        <p><b>Department Name</b></p>
        <input type="text" name="deptName" value="<%=deptName%>" placeholder="Department Name" > 
        <br>
        <p><b>Department Description</b></p>
        <input type="text" name="deptDesc" value="<%=deptDesc%>" placeholder="Department Description" >
        <br>
         </div>
    <div class="containerz" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('<%=deptId%>').style.display='none'" class="cancelbtn">Cancel</button>
      <input type="submit" class="psw" value="Update"></button>
    </div>
  </form>
</div>
<%
    }
%>
<!----------------------popup end-------------------------------------------------->
    <input type="radio" id="tabsilver" name="mytabs" >
    <label for="tabsilver">Add Department</label>
    <div class="tab">
       
 <!----------------   Add Department Start   --------------->
       
                <form action="addDepartment" method="post">
                    <p >Department ID:</p>
                        <input type="number"   name="deptId" placeholder="ID Auto Generated" readonly> 
                    <p>Department Name:</p>
                        <input id="texting" type="text" name="deptName" placeholder="Enter Department Name" required="required">
                    <p>Department Description:</p>
                        <input id="texting" type="text"   name="deptDesc" placeholder="Enter Department Description here..." required="required">
                   
                            <input type="submit" class="psw" value="Add Department"></button>
                </form>
                           <!----------------   Add Dept Ends   --------------->   
    </div>
    
</div>
 
<!----------------------dept tab switch(end)------------------------------------->

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