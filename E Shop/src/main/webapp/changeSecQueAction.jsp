<%@page import="project.DBClass"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String SecurityQuestion = request.getParameter("SecurityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
try{
	int z = 0;
	Connection con = DBClass.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email = '"+email+"' and password = '"+password+"'");
	while(rs.next()){
		z = 1;
		st.executeUpdate("update users set sercurityQuestion = '"+SecurityQuestion+"', answer = '"+answer+"' where email = '"+email+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
	}
	if(z == 0){
		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
	}
}catch(Exception e){
	System.out.println(e);
}
%>