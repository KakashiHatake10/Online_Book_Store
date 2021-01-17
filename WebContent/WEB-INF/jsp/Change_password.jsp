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
int con = (int) request.getAttribute("done");
%>

<body>
	<img id="images" src="<c:url value="/resources/img/bg.jpg"/>" />

	<div class="mainWrapper">
		<header>
			<!-- This is the header content. It contains Logo and links -->
			<div id="logo">ONline BOoks STore</div>
			<div id="headerLinks">
				<a href="login"> <%
 	if (user == null) {
 %> login <%
 	} else
 out.print("<a href='logout' style='color:DodgerBlue;'>" + user + "(logout)</a>");
 %>
				</a>
			</div>
		</header>


		<div class="login-box">
			<%
				if (con == 1) {
				out.print("<h2 style='text-align:center;'>Successfully password change..............</h2>");
			}
			%>
			<form name="myForm" method="POST" action="change_password"
				onsubmit="return validateForm()">
				<h2>Change Password</h2>
				<input type="hidden" name="login_id" value="<%=l_id%>" />
				<div class="textbox">
					<i class="fas fa-user"></i> <input type="text"
						placeholder="Current password" name="curt_pass">
				</div>
				<div class="textbox">
					<i class="fas fa-key"></i> <input type="password"
						placeholder="password" id="password" name="new_pass"
						onkeyup='check();'>
				</div>
				<div class="textbox">
					<i class="fas fa-user"></i> <input type="password"
						placeholder="Re-password" id="confirm_password" onkeyup='check();'>
				</div>
				<span id='message'></span>
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
			document.getElementById('message').style.color = 'green';
			document.getElementById('message').innerHTML = 'matching';
		} else {
			document.getElementById('message').style.color = 'red';
			document.getElementById('message').innerHTML = 'not matching';
		}
	}
</script>
</html>