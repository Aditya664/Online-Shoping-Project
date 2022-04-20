<%@page import="project.DBClass"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
	<%
	String msg = request.getParameter("msg");
	if ("invalid".equals(msg)) {
	%>
	<h3 class="alert">Some thing went wrong! Try Again!</h3>
	<%
	}
	%>
	<%
	if ("Success".equals(msg)) {
	%>
	<h3 class="alert">Product Added Successfully!</h3>
	
	<%
	}
	%>

	<%
	int id = 1;
	try {
		Connection con = DBClass.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select max(id) from product");
		if (rs.next()) {
			id = rs.getInt(1);
			id = id + 1;
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	%>

	<form action="addNewProductAction.jsp" method="post">
	<h3 style="color: yellow;">
		Product ID:
		<%
	out.println(id);
	%>
	</h3>
	<input type="hidden" name="id" value="<%out.println(id);%>">

	<div class="left-div">
		<h3>Enter Name</h3>
		<input class="input-style" type="text" name="name"
			placeholder="Enter name" required>
		<hr>
	</div>

	<div class="right-div">
		<h3>Enter Category</h3>
		<input class="input-style" type="text" name="category"
			placeholder="Enter category" required>
		<hr>
	</div>

	<div class="left-div">
		<h3>Enter Price</h3>
		<input class="input-style" type="number" name="price"
			placeholder="Enter price" required>

		<hr>
	</div>

	<div class="right-div">
		<h3>Active</h3>
		<select class="input-style" name="active">
			<option value="yes">Yes</option>]
			<option value="no">No</option>
		</select>
		<hr>
	</div>
	<button class="button">
		Save<i class='far fa-arrow-alt-circle-right'></i>
	</button>
	</form>

</body>
<br>
<br>
<br>
</body>
</html>