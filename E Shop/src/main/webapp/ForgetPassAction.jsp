<%@ page import="project.DBClass"%>
<%@ page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String mobile = request.getParameter("mobilenumber");
String question = request.getParameter("SecurityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("Newpassword");

int ch = 0;
try{
	Connection con = DBClass.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email = '"+email+"' and mobileNumber='"+mobile+"' and sercurityQuestion = '"+question+"' and answer ='"+answer+"'");
	if(rs.next()){
		st.executeUpdate("update users set password = '"+password+"' where email = '"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=Success");
	}else{
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
}catch(Exception e){
	System.out.println(e);
}



%>
