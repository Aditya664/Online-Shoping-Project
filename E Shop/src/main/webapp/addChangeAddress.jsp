<%@page import="project.DBClass"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
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
	<h3 class="alert">Address Successfully Updated !</h3>
<%}
%>
<%
if("error".equals(msg)){
	%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%}
%>


<%
try{
	Connection con = DBClass.getCon();
	Statement st = con.createStatement();
	ResultSet rs3 = st.executeQuery("select * from users where email = '" + email + "'");
	while(rs3.next()){
%>
<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
 <input class="input-style" name="address" type="text"
			value="<%=rs3.getString(7)%>" placeholder="please enter address"
			required>
 <hr>
 <h3>Enter city</h3>
 <input class="input-style" name="city" type="text"
			value="<%=rs3.getString(8)%>" placeholder=" please enter city"
			required>
<hr>
<h3>Enter State</h3>
<input class="input-style" name="state" type="text"
			value="<%=rs3.getString(9)%>" placeholder=" please enter State"
			required>
<hr>
<h3>Enter country</h3>
<input class="input-style" name="country" type="text"
			value="<%=rs3.getString(10)%>" placeholder=" please enter country"
			required>
<hr>
<button class="input-style" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i>
</button>
</form>
<%
	}
}catch(Exception e){
	System.out.print(e);
}%>
</body>
<br><br><br>
</html>