<%@page import="project.DBClass"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String mobileNo = request.getParameter("mobileNo");
String pass = request.getParameter("pass");
try{
	Connection con = DBClass.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email = '"+email+"' and password = '"+pass+"'");
	int z = 0;
	while(rs.next()){
		z = 1;
		st.executeUpdate("update users set mobileNumber = '"+mobileNo+"' where email = '"+email+"'");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
	}
	if(z == 0){
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
	}
}catch(Exception e){
System.out.println(e);	
}



%>