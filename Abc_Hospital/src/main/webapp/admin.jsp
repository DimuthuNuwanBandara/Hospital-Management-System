<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>C</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/admin.css" rel="stylesheet">
    <link href="css/hover.css" rel="stylesheet">
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
                <div class="search">
                    <label>
                        <input type="text" placeholder="Search here" name="search">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </label>
                </div>
                 

                <div class="duser">
                
                <ul>
                    <li>
                    <span class="icons"><i class="fa fa-cog" aria-hidden="true"></i></span>
                    </li>
                </ul>

                </div>   
 

            </div>
            


            <div class="cardBox">
<%!  
        int num3;
        PreparedStatement xs;
        ResultSet js;
%>  
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospdbms","root","mysql@123");
    PreparedStatement xs=c.prepareStatement("select count(id) from appointment",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    js=xs.executeQuery();
    if(js.next())
    {
        num3=js.getInt(1);         
%>         
                 <div class="card">
                    <div>
                        <div class="numbers"><%=num3%></div>
                        <div class="cardName">TODAY APOINTMENT</div>
                    </div>
                    <div class="iconBox">
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </div>
			</div>			 
<%
    }
    js.first();
    js.previous();
%>              	
<%!  
        int num;
        PreparedStatement ps;
        ResultSet rs;
%>
<%
    PreparedStatement ps=c.prepareStatement("select count(id) from appointment",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    rs=ps.executeQuery();
    if(rs.next())
    {
        num=rs.getInt(1);         
%> 
                <div class="card" >
 
                    <div>
                        <div class="numbers"><%=num%></div>
                        <div class="cardName">TOTAL APPOINTMENT</div>
                    </div>
                    <div class="iconBox">
                        <i class="fa fa-list-alt" aria-hidden="true"></i>
                    </div>
            </div>
<%
    }
    rs.first();
    rs.previous();
%>          

             <div class="card" >
<%!  
        int num1;
        PreparedStatement ds;
        ResultSet vs;
%>  
<%
    PreparedStatement ds=c.prepareStatement("select count(id) from patients",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    vs=ds.executeQuery();
    if(vs.next())
    {
        num1=vs.getInt(1);      
%>
                               
                   <div>
                    <div class="numbers"><%=num1%></div>                   
                    <div class="cardName">TOTAL USERS</div>
                    </div>
                    <div class="iconBox">
                        <i class="fa fa-users" aria-hidden="true"></i>
                    </div>
             </div>
<%
    }
    vs.first();
    vs.previous();
%>            
                <div class="card">
			
<%!  
        int num2;
        PreparedStatement bs;
        ResultSet zs;
%>  
<%
    PreparedStatement bs=c.prepareStatement("select count(id) from add_doctor",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    zs=bs.executeQuery();
    if(zs.next())
    {
        num2=zs.getInt(1);          
%>         
                <div>
                <div class="numbers"><%=num2%></div>
                <div class="cardName">TOTAL DOCTORS</div>
                </div>
                <div class="iconBox">
                     <i class="fa fa-user-md" aria-hidden="true"></i>
                </div>                                          
            </div>
           </div> 
<%
    }
    zs.first();
    zs.previous();
%>      
<%!  
        int num4;
        PreparedStatement ab;
        ResultSet aa;
%> 
<%
    PreparedStatement ab=c.prepareStatement("select count(*) from appointment where -7",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    aa=ab.executeQuery();
    if(aa.next())
    {
        num4=aa.getInt(1);          
 
    }
    aa.first();
    aa.previous();
%>
<%!  
        int num5;
        PreparedStatement uu;
        ResultSet vv;
%>
<%
    PreparedStatement uu=c.prepareStatement("select count(*) from appointment where -15",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    vv=uu.executeQuery();
    if(vv.next())
    {
        num5=vv.getInt(1);          
 
    }
    vv.first();
    vv.previous();
%>
<%!  
        int num6;
        PreparedStatement nn;
        ResultSet mm;
%>
<%
    PreparedStatement nn=c.prepareStatement("select count(*) from appointment where -30",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    mm=nn.executeQuery();
    if(mm.next())
    {
        num6=mm.getInt(1);          
 
    }
    mm.first();
    mm.previous();
%>
<script>
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
    animationEnabled: true,
    exportEnabled: true,
    theme: "light2", // "light1", "light2", "dark1", "dark2"
    title:{
        text: " "
    },
    axisY: {
      includeZero: true
    },
    data: [{
        type: "column", //change type to bar, line, area, pie, etc
        //indexLabel: "{y}", //Shows y value on all Data Points
        indexLabelFontColor: "#5A5757",
        indexLabelFontSize: 16,
        indexLabelPlacement: "outside",
        dataPoints: [
            { y: <%=num6%>, label: "Last 30 days" },
            { y: <%=num5%> ,  label: "Last 15 days" },
            { y: <%=num4%> ,  label: "Last 7 days" },
            { y: <%=num3%> ,  label: "Today" }
        ]
    }]
});
chart.render();

}            
</script>
 
<div id="chartContainer" style="height: 400px; width: 650px;margin-left: 200px"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>



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