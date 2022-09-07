<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
<head>
    <script>
        function confirmDelete()
        {
            return confirm("Do You Really Want to Delete patient?");
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
    <label for="tabfree">Patient List</label>
    <div class="tab">
      <h3>Available Patients</h3>
       <table class="content-table">
        <thead>
                <tr class="active">
                        <th>ID</th>
                        <th>Patient Name</th>
                        <th>Email</th>
                        <th>Age</th>
                        <th>Sex</th>
                        <th>Phone</th>
                        <th>Blood Grp</th>
                        <th>Address</th>
                        <th>Ward</th>
                        <th>Options</th>
                </tr>
            </thead>
<%!
        int doctId;
        String doctName;    
        int id,age;
        String name,gender,bgroup,phone,rov,doc_name,admit_date,add,email,ward;
        PreparedStatement ps;
        ResultSet rs;
%>
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
    PreparedStatement ps=c.prepareStatement("select * from patients",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    rs=ps.executeQuery();
    while(rs.next())
    {
        id=rs.getInt(1);
        name=rs.getString(2);
        gender=rs.getString(3);
        age=rs.getInt(4);
        bgroup=rs.getString(5);
        phone=rs.getString(6);
        email=rs.getString(7);
        add=rs.getString(8);
        ward=rs.getString(9);
        
        
%>    
             <tbody>
                    <tr>
                            <td><%=id%></td>
                            <td><%=name%></td>
                            <td><%=email%></td>
                            <td><%=age%></td>
                            <td><%=gender%></td>
                            <td><%=phone%></td>
                            <td><%=bgroup%></td>
                            <td><%=add%></td>
                            <td><%=ward%></td>
                            <td>
                            <button type="button" onclick="document.getElementById('<%=id%>').style.display='block'" ><i class="fa fa-pencil" aria-hidden="true"></i></button>
                            <a  href="delete_patient_validation.jsp?patientId=<%=id%>" onclick="return confirmDelete()" ><i class="fa fa-trash" aria-hidden="true"></i></a>
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
        email=rs.getString(7);
        add=rs.getString(8);
        ward=rs.getString(9);
        
%> 
<div id="<%=id%>" class="modal">
  
  <form class="modal-content animate" action="edit_patient_validation.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('<%=id%>').style.display='none'" class="close" title="Close Modal">&times;</span>
      <h3>Edit Patient Information</h3>
    </div>

        <div class="containerz">
        <p><b>Patient Id:</b></p>
        <input type="number" name="patientid" placeholder="Patient ID" value="<%=id%>" readonly="readonly">
        <br>
        <p><b>Name</b></p>
        <input type="text" name="patientname" value="<%=name%>" placeholder="Name" > 
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
        <br>
        <p><b>Gender</b></p>
        <input type="text" name="gender" value="<%=gender%>" placeholder="Gender" >
        <br>
        
        <p><b>Age</b></p>
         <input type="text" name="age" value="<%=age%>" placeholder="Age" >
        <br>
        <p><b>Blood Group</b></p>
        <input type="text" name="bgroup" value="<%=bgroup%>" placeholder="Blood Group" >
        <br>
        <p><b>Ward</b></p>
        <input type="text" name="ward" value="<%=ward%>" placeholder="ward" >
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
    <input type="radio" id="tabsilver" name="mytabs" >
    <label for="tabsilver">Add Patient</label>
    <div class="tab">
       
 <!----------------   Add patient Start   --------------->
       
                <form action="add_patient_validation.jsp" method="post">
                    <div class="styler">
                    <p >Patient Id:</p>
                        <input type="number" name="patientid" placeholder="unique_id auto generated" readonly>
                    <p>Name</p>
                        <input id="texting" type="text" name="patientname" placeholder="Name" required="required">
                    <p>Email</p>  
                        <input type="email" name="email" placeholder="Email">
                    <p>Password</p>
                        <input type="password"  name="pwd" placeholder="Password">
                    <p>Address</p>
                        <input id="texting" type="text"   name="add" placeholder="Address" required="required">
                    <p>Phone</p>
                        <input id="texting" type="text"   name="phone" placeholder="Phone No." required="required">
                    
                    <p>sex</p>
                        <select name="gender">
                         <option>Male</option>
                          <option>Female</option>
                        </select>
                    <p>Age</p>
                        <input id="texting" type="text"  name="age" placeholder="Age">
                     <p>Blood Group</p> 
                         <select name="bgroup">
                        <option>A<sup>+</sup></option>
                        <option>A<sup>-</sup></option>
                        <option>B<sup>+</sup></option>
                        <option>B<sup>-</sup></option>
                        <option>AB<sup>+</sup></option>
                        <option>AB<sup>-</sup></option>
                        <option>O<sup>+</sup></option>
                        <option>O<sup>-</sup></option>
                         </select>
                      <p>Ward</p>
                      <input id="texting" type="text"   name="ward" placeholder="ward" required="required">                         
                      

                 
                        
                            <input type="submit" class="psw" value="Add Patient"></button>
                         </div>
                </form>
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