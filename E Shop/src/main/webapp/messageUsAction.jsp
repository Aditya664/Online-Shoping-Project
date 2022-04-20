<%@page import="project.DBClass"%>
<%@page import="java.sql.*"%>
<%
String subject = request.getParameter("subject");
String body = request.getParameter("msg");
String email = session.getAttribute("email").toString();
try{
	Connection con = DBClass.getCon();
	PreparedStatement ps = con.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
	ps.setString(1, email);
	ps.setString(2, subject);
	ps.setString(3, body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
}catch(Exception e){
	response.sendRedirect("messageUs.jsp?msg=invalid");
}


%>