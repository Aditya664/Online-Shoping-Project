<%@ page import="project.DBClass"%>
<%@ page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
if("admin@gmail.com".equals(email) && "Admin@123".equals(password)){
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
}else{
	int z = 0;
	try{
		Connection con = DBClass.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password = '"+password+"'");
		if(rs.next()){
	session.setAttribute("email", email);
	response.sendRedirect("home.jsp");
		}else{
	response.sendRedirect("login.jsp?msg=Notexit");

		}
	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("login.jsp?msg = invalid");
	}
}
%>
