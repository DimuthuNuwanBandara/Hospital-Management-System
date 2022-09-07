<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>c</title>
   
    <link rel="stylesheet" type="text/css" href="css/report.css">
</head>
<body>

<div class="rep" id="print">
     <div class="head">
        <button class="print" onclick="prints('print')"><i class="fa fa-print" aria-hidden="true"></i> PRINT</button>
    <h2>ABC<span style="color: #66BF0CFF;"> HOSPITAL</span></h2>   

   
</div>
<div class="strip"></div>

<div class="addr">
    <aside>
        <div class="asid">
            <h3><span class="icon"><i class="fa fa-volume-control-phone" aria-hidden="true"></i></span>&nbsp;&nbsp;&nbsp;CALL NOW</h3>
            <p>077-5236273</p>
        </div>
        <h3><span class="icon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>&nbsp;&nbsp;&nbsp;EMAIL</h3>
        <p>abchospital@gmail.com</p>
    </aside>
     <p><b>Prescriber Name:</p> 
</div>
<div class="strip1"></div>
<div class="strip2"></div>
<div class="pdetail">
    
</div>

<div class="strip2"></div>
<div class="strip2"></div>
<p><b>&nbsp;&nbsp;&nbsp;&nbsp;<u>Prescription:-</u></b></p>


<br>
<p> &nbsp;&nbsp;&nbsp;&nbsp; Signature......................  </p>
<div class="strip"></div>
<div class="footer"></div>
</div>

    <script type="text/javascript">
        function prints(paravalue){
            var backup=document.body.innerHTML;
            var divcontent=document.getElementById(paravalue).innerHTML;
            document.body.innerHTML =divcontent;
            window.print();
            document.body.innerHTML=backup;
        }
    </script>
    
</body>
</html>