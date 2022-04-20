<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="ForgetPassAction.jsp" method="post">
				<input type="email" name="email" placeholder="Enter email" required>
				<input type="number" name="mobilenumber"
					placeholder="Enter Mobile Number" required> <select
					name="SecurityQuestion" required>
					<option value="What is your first car?">What is your first
						car?</option>
					<option value="What is your name of your first pet?">What
						is your name of your first pet?</option>
					<option value="What elementary school did you attend?">What
						elementary school did you attend?</option>
					<option value="What is name of town where you born?">What
						is name of town where you born?</option>
				</select> <input type="text" name="answer" placeholder="Enter Answer"
					required> <input type="password" name="Newpassword"
					placeholder="Enter You New Password" required> <input
					type="submit" value="Save">
			</form>
			<h2>
				<a href="login.jsp">Login</a>
			</h2>
		</div>
		<div class='whyforgotPassword'>
			<%
			String msg = request.getParameter("msg");
			if ("invalid".equals(msg)) {
			%>
			<h1>Incorrect Email or Password!</h1>
			<%
			}
			%>
			<%
			if ("Success".equals(msg)) {
			%>
			<h1>Success!</h1>
			<%
			}
			%>


			<h2>Online Shopping</h2>
			<p>The Online Shopping System is the application that allows the
				users to shop online without going to the shops to buy them.</p>
		</div>
	</div>
</body>
</html>