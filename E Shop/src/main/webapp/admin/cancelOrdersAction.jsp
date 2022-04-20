<%@page import="project.DBClass"%>
<%@page import="java.sql.*"%>
<%
String id= request.getParameter("id");
String email= request.getParameter("email");
String status = "Cancle";
try{
	Connection con = DBClass.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("update cart set status = '"+status+"' where product_id = '"+id+"' and email ='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=cancle");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=error");
}

%>