<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/Header.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/Login_Register.css" />"
	rel="stylesheet">
</head>

<%
	String err_msg = (String) request.getAttribute("error_msg");
String user = (String) session.getAttribute("name");
Integer l_id = (Integer) session.getAttribute("login_id");
System.out.println("login session 1 " + l_id);
%>
<body>
	<img id="images" src="<c:url value="/resources/img/bg.jpg"/>" />

	<div class="mainWrapper">
		<header>
			<!-- This is the header content. It contains Logo and links -->
			<div id="logo">ONline BOoks STore</div>
			<div id="headerLinks">
				<a href="cart/${login_id}">Cart</a> <a href="register">Register</a>
				<a href="login"> <%
 	if (user == null) {
 %> login <%
 	} else
 out.print("<a href='logout'>" + user + "(logout)</a>");
 %>
				</a>
			</div>
		</header>

		<div class="login-box">
			<%
				if (err_msg != null) {
				out.write("<h3>Please try again...</h3>");
			}
			%>

			<form name="myForm" method="post" action="sayhello"
				onsubmit="return validateForm()">
				<h1>Login</h1>
				<div class="textbox">
					<i class="fas fa-user"></i> <input type="text"
						placeholder="Username" name="user">
				</div>
				<div class="textbox">
					<i class="fas fa-lock"></i> <input type="password"
						placeholder="Password" name="pass">
				</div>

				<input type="submit" class="btn" value="Sign in">
				<h4>
					<a href="forget_password">Forget password</a>
				</h4>
			</form>
		</div>
	</div>
</body>
<script>
	function validateForm() {
		var x = document.forms["myForm"]["user"].value;
		if (x == "") {
			alert("Name must be filled out");
			return false;
		}
		var y = document.forms["myForm"]["pass"].value;
		if (y == "") {
			alert("password must be filled out");
			return false;
		}
	}
</script>
</html>