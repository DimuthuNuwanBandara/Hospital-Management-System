<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
<head>
    <script>
        function confirmDelete()
        {
            return confirm("Do You Really Want to Delete Donor?");
        }
     </script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/admin.css" rel="stylesheet">
    <link rel="stylesheet" href="css/popup.css">
    <link rel="stylesheet" type="text/css" href="css/doctor.css">
    <script type="text/javascript" src="js code/print.js"></script>
</head>
<body>

    <div class="container">

        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                    <span class="icon"></span>
                    <span class="title"><h2>ABC HOSPITAL</h2></span>    
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
                    <a href="#">
                    <span class="icon"><i class="fa fa-list-alt" aria-hidden="true"></i></span>
                    <span class="title">BILLING</span>    
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
                <form action="search_donor.jsp">
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

<!----------------------donor tab switch------------------------------------->
<div class="mytabs">
    <input type="radio" id="tabfree" name="mytabs" checked="checked">
    <label for="tabfree">Donor List</label>
    <div class="tab"  id="print">
    <h3>Available Donors<button  class="print" style="width: 80px; height: 30px; border: 2px solid grey; border-radius: 10px; margin-left: 600px;" onclick="prints('print')"><i class="fa fa-print" aria-hidden="true"></i> PRINT</button>

    <form action="search_blood.jsp" style="top: 0; float: right;"><input style="width: 120px; height: 30px; border: 2px solid grey; border-radius: 10px;padding-left: 20px;" type="text" placeholder="Blood group" name="searchblg">
    </form> 

</h3>
       <table class="content-table">
        <thead>
                <tr class="active">
                        <th>Donor ID</th>
                        <th>Donor Name</th>
                        <th>Gender</th>
                        <th>Age</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Blood Group</td>
                        <th>Donation Date</th>
                        <th>Options</th>
                </tr>
            </thead>
<%!
        int donorId,age;
        String donorName;   
        String gender,email,phone,add,bgroup,donationDate;
        PreparedStatement ps;
        ResultSet rs;
%>
             <tbody>
                    <tr>
                            <td><%=donorId%></td>
                            <td><%=donorName%></td>
                            <td><%=gender%></td>
                            <td><%=age%></td>
                            <td><%=email%></td>
                            <td><%=phone%></td>
                            <td><%=add%></td>
                            <td><%=bgroup%></td>
                            <td><%=donationDate%></td>
                            <td>
                            <button type="button" onclick="document.getElementById('<%=donorId%>').style.display='block'" ><i class="fa fa-pencil" aria-hidden="true"></i></button>
                            <a  href="delete_donor_validation.jsp?donorId=<%=donorId%>" onclick="return confirmDelete()" ><i class="fa fa-trash" aria-hidden="true"></i></a>
                            </td>
                    </tr>
            </tbody>               
        </table>

    </div>

<!----------------------pop up --------------------------------------------------->
 
<div id="<%=donorId%>" class="modal">
  
  <form class="modal-content animate" action="edit_donor_validation.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('<%=donorId%>').style.display='none'" class="close" title="Close Modal">&times;</span>
      <h3>Edit Donor Information</h3>
    </div>

        <div class="containerz">
        <p><b>Donor ID</b></p>
        <input type="number"   name="donorid" placeholder="Donor ID" value="<%=donorId%>" readonly="readonly">
        <br>
        <p><b>Donor Name</b></p>
        <input type="text" name="donorname" value="<%=donorName%>" placeholder="Donor Name" >
        <br>
        <p><b>Gender</b></p>
        <input type="text" name="gender" value="<%=gender%>" placeholder="Gender" >
        <br>
        <p><b>Age</b></p>
        <input type="text" name="age" value="<%=age%>" placeholder="Age" >
        <br>
        <p><b>Email</b></p>
        <input type="email"  name="email" value="<%=email%>" placeholder="Email" >
        <br>
        <p><b>Phone</b></p>
        <input type="text" name="phone" value="<%=phone%>" placeholder="Phone No." >
        <br>
        <p><b>Address</b></p>
        <input type="text" name="add" value="<%=add%>" placeholder="Address" >  
        <br>
        <p><b>Blood Group</b></p>
         <select name="bgroup">
                        <option selected="selected"><%=bgroup%></option>
                        
                        <option> B+</option>
                        <option> AB+</option>
                        <option> O-</option>
                        <option> O+</option>
                        <option> A-</option>
                        <option> A+</option>
                   
                              
                        </select>
        <br>
        <p><b>Donation Date</b></p>
        <input type="text" name="ddate" value="<%=donationDate%>" placeholder="Donation Date" >
         </div>
    <div class="containerz" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('<%=donorId%>').style.display='none'" class="cancelbtn">Cancel</button>
      <input type="submit" class="psw" value="Update"></button>
    </div>
  </form>
</div>
<!----------------------popup end-------------------------------------------------->
    <input type="radio" id="tabsilver" name="mytabs" >
    <label for="tabsilver">Add Donor</label>
    <div class="tab">
       
 <!----------------   Add donor Start   --------------->
       
                <form action="add_donor_validation.jsp" method="post">
                    <div class="styler">
                    <p >Donor Id:</p>
                        <input type="number" name="donorid" placeholder="Donor ID Auto Generated" readonly>
                    <p>Name</p>
                        <input  id="texting" type="text" name="donorname" placeholder="Name" required="required">
                    <p>Gender</p>  
                        <select name="gender">
                        <option selected="selected">Male</option>                        
                        <option>Female</option>                                                
                        </select>
                    <p>Age</p>
                       <input id="texting" type="text"  name="age" placeholder="Age" required="required">
                    <p>Email</p>
                        <input type="email" name="email" placeholder="Email" required="required">
                    <p>Phone</p>
                        <input id="texting" type="text"   name="phone" placeholder="Phone No." required="required">
                    <p>Address</p>
                        <input  id="texting" type="text" name="add" placeholder="Address" required="required">
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
                    <p>Donation Date</p>
                        <input type="date" name="ddate" placeholder="Donation Date" required="required">
                     <br>
                     <br>
                        
                            <input type="submit" class="psw" value="Add Donor"></button>
                         </div>
                </form>
                           <!----------------   Add donor Ends   --------------->   
    </div>
    
</div>
 
<!----------------------donor tab switch(end)------------------------------------->

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