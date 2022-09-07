<%@page import="java.sql.*" %>

<div style="text-align:center;margin-top:35%">
<font color="green">
<script type="text/javascript">
function Redirect()
{
    window.location="department.jsp";
}
document.write("<h2>Department Added Successfully</h2><br><Br>");
document.write("<h3>Redirecting you to home page....</h3>");
setTimeout('Redirect()', 3000);
</script>
</font>
</div>
