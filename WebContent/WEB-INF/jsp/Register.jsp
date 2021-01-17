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
				<a href="cart/${login_id}">Cart</a> <a href="login"> <%
 	if (user == null) {
 %> login <%
 	} else
 out.print("<a href='logout'>" + user + "(logout)</a>");
 %>
				</a>
				<%
					if (user != null) {
				%>
				<%
					}
				%>
			</div>
		</header>


		<div class="login-box">

			<form name="myForm" method="POST" action="submit"
				onsubmit="return validateForm()">
				<h2>Registration Info</h2>
				<div class="textbox">
					<i class="fas fa-user"></i> <input type="text" placeholder="Name"
						name="name">
				</div>
				<div class="textbox">
					<i class="fas fa-user"></i> <input type="text"
						placeholder="Address" name="address">
				</div>
				<div class="textbox">
					<i class="fas fa-user"></i> <input type="email" placeholder="Email"
						name="email">
				</div>
				<div class="textbox">
					<i class="fas fa-key"></i> <input type="password"
						placeholder="password" id="password" onkeyup='check();'>
				</div>
				<div class="textbox">
					<i class="fas fa-user"></i> <input type="password"
						placeholder="Re-password" id="confirm_password" onkeyup='check();'>
				</div>
				<span id='message'></span>
				<div class="textbox">
					<i class="fas fa-user"></i> <input type="text" placeholder="Phone"
						name="phone">
				</div>
				<div class="textbox">
					<i class="fas fa-user"></i>
					<button class="btn" type="submit">Submit</button>
				</div>
			</form>
		</div>
	</div>

</body>
<script>
	var check = function() {
		if (document.getElementById('password').value == document
				.getElementById('confirm_password').value) {
			document.getElementById('message').style.color = 'blue';
			document.getElementById('message').innerHTML = 'matching';
		} else {
			document.getElementById('message').style.color = 'red';
			document.getElementById('message').innerHTML = 'not matching';
		}
	}
	function validateForm() {
		var x = document.forms["myForm"]["name"].value;
		if (x == "") {
			alert("Name must be filled out");
			return false;
		}
		var y = document.forms["myForm"]["address"].value;
		if (y == "") {
			alert("Address must be filled out");
			return false;
		}
		var z = document.forms["myForm"]["phone"].value;
		if (z == "") {
			alert("Name must be filled out");
			return false;
		}

	}
</script>
</html>