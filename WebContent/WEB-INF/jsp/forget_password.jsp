<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/Header.css" />"
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
			<div id="logo">
				<a href="home">ONline BOoks STore</a>
			</div>
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
			Please enter your email address below and we will send you
			information to change your password
			<form name="myForm" method="post" action="sayhello"
				onsubmit="return validateForm()">
				<div class="textbox">
					<i class="fas fa-email"></i> <input type="Email"
						placeholder="Email" name="Email">
				</div>
				<input type="submit" class="btn" value="Reset">
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
<style>
.login-box h4 a:link, a:visited {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

@import "https://use.fontawesome.com/releases/v5.5.0/css/all.css";

body {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
	background-size: cover;
	background-color: blue;
}

.login-box {
	width: 280px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
}

.login-box h1 {
	float: left;
	font-size: 40px;
	border-bottom: 6px solid #4caf50;
	margin-bottom: 50px;
	padding: 13px 0;
}

.textbox {
	width: 100%;
	overflow: hidden;
	font-size: 20px;
	padding: 8px 0;
	margin: 8px 0;
	border-bottom: 1px solid #4caf50;
}

.textbox i {
	width: 26px;
	float: left;
	text-align: center;
}

.textbox input {
	border: none;
	outline: none;
	background: none;
	color: white;
	font-size: 18px;
	width: 80%;
	float: left;
	margin: 0 10px;
}

.btn {
	width: 100%;
	background: none;
	border: 2px solid #4caf50;
	color: white;
	padding: 5px;
	font-size: 18px;
	cursor: pointer;
	margin: 12px 0;
}

#images {
	position: absolute;
	z-index: -1;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	pointer-events: none
}
</style>
</html>