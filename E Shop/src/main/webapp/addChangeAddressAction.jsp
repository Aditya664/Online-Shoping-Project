<%@page import="project.DBClass"%>
<%@page import="java.sql.*"%>
<%

String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
try{
	Connection con = DBClass.getCon();
	PreparedStatement ps = con.prepareStatement("update users set address = '"+address+"',city = '"+city+"',state='"+state+"', country = '"+country+"' where email='"+email+"'");
	ps.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=done");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addChangeAddress.jsp?msg=error");
}

%>