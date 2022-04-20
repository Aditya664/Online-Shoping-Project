<%@ page import="project.DBClass"%>
<%@ page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String status = "processing";
try{
	Connection con = DBClass.getCon();
	PreparedStatement ps = con.prepareStatement("update cart set status  = '"+status+"' where email = ? and status = 'bill'");
	ps.setString(1, email);
	ps.executeUpdate();
	response.sendRedirect("home.jsp");
}catch(Exception e){
	System.out.println(e);
}


%>