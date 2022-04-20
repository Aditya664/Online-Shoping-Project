<%@page import="project.DBClass"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("done".equals(msg)){
	%>
	<h3 class="alert">Your Mobile Number successfully changed!</h3>
	<%
}
%>
<%
if("wrong".equals(msg)){
	%>
<h3 class="alert">Your Password is wrong!</h3>
	<%
}
%>

<form action = "changeMobileAction.jsp" method = "post">

 <h3>Enter Your New Mobile Number</h3>
 <input type = "number" name = "mobileNo" class = "input-style" placeholder = "Enter new Mobile number" required>
 <hr>
<h3>Enter Password (For Security)</h3>
 <input type = "password" name = "pass" class = "input-style" placeholder = "Enter Your Password" required>

<hr>
 <button class = "input-style">Submit<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>