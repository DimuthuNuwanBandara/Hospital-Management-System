<%@page import="java.sql.*" %>

<div style="text-align:center;margin-top:30%">
<font color="green">
<script type="text/javascript">
function Redirect()
{
    window.location="nurse.jsp";
}
document.write("<h2>Ward Information Added Successfully</h2><br><Br>");
document.write("<h3>Redirecting you to home page....</h3>");
setTimeout('Redirect()', 3000);
</script>
</font>
</div>
