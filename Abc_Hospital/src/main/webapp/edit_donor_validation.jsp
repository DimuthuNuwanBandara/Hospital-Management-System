<%@page import="java.sql.*" %>

<div style="text-align:center;margin-top:25%">
<font color="blue">
<script type="text/javascript">
function Redirect()
{
    window.location="donor.jsp";
}
document.write("<h2>Donor Details Updated Successfully</h2><br><Br>");
document.write("<h3>Redirecting you to home page....</h3>");
setTimeout('Redirect()', 3000);
</script>
</font>
</div>
