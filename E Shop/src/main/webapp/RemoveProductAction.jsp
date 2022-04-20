<%@ page import="project.DBClass"%>
<%@ page import="java.sql.*"%>
<%
String product_id = request.getParameter("productid");
try{
Connection con = DBClass.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from cart where product_id = '"+product_id+"'");
if(rs.next()){
	st.executeUpdate("delete from cart where product_id = '"+product_id+"'");
	response.sendRedirect("myCart.jsp?msg=removed");
}else{
	response.sendRedirect("myCart.jsp?msg=error");
}
}catch(Exception e){
	System.out.print(e);
	response.sendRedirect("myCart.jsp?msg=invalid");
}
	





%>