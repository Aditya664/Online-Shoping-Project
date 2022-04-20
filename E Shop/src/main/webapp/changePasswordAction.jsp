<%@page import="project.DBClass"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String oldpass = request.getParameter("oldpass");
String newpass1 = request.getParameter("newpass1");
String newpass2 = request.getParameter("newpass2");

if(!newpass2.equals(newpass1)){
	response.sendRedirect("changePassword.jsp?msg=notMatch");
}else{
	int check = 0;
	try{
		Connection con = DBClass.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email = '"+email+"' and password = '"+oldpass+"'");
		while(rs.next()){
			check = 1;
			st.executeUpdate("update users set password = '"+newpass2+"' where email = '"+email+"'");
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		if(check == 0){
			response.sendRedirect("changePassword.jsp?msg=wrong");
		}
	}catch(Exception e){
		System.out.println(e);
		//response.sendRedirect("changePassword.jsp?msg=error");
	}
}


%>