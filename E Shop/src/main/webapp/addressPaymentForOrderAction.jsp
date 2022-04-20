<%@page import="project.DBClass"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String mobile = request.getParameter("mobile");
String transactionId = "";
transactionId = request.getParameter("transactionId");
String pay = request.getParameter("pay");
String status = "Bill";
try{
	Connection con = DBClass.getCon();
	PreparedStatement ps = con.prepareStatement("update users set address = '"+address+"',city = '"+city+"',state='"+state+"', country = '"+country+"'");
	ps.executeUpdate();
	
	PreparedStatement ps1 = con.prepareStatement("update cart set address = '"+address+"',city = '"+city+"',state='"+state+"' , country = '"+country+"',mobileno = '"+mobile+"',orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod = '"+pay+"',transactionId = '"+transactionId+"',status= '"+status+"' where email = '"+email+"'");
	ps1.executeUpdate();
	
	response.sendRedirect("bill.jsp");
}catch(Exception e){
	System.out.println(e);
}

%>