
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Online Books</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="http://use.edgefonts.net/montserrat:n4:default;source-sans-pro:n2:default.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="<c:url value="/resources/css/Header.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/footer.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/Add_Update_Page.css" />"
	rel="stylesheet">
</head>

<%
	String user = (String) session.getAttribute("name");
Integer l_id = (Integer) session.getAttribute("login_id");
Integer delete = (Integer) request.getAttribute("update");
session.setAttribute("name", user);
System.out.println("login session 1 " + l_id);
System.out.println("login user " + user);
%>

<body>
	<header>
		<!-- This is the header content. It contains Logo and links -->
		<div id="logo">
			<!-- <img src="logoImage.png" alt="sample logo"> -->
			<!-- Company Logo text -->
			ONline BOoks STore
		</div>
		<div id="headerLinks">
			<a href="all_order">All Order</a> <a href="add">Add New book</a> <a
				href="update">Update book</a><a href="more_admin">make admin</a> <a
				href="login"> <%
 	if (user == null) {
 %> login <%
 	} else
 out.print("<a href='logout' style='color:DodgerBlue;'>" + user + "(logout)</a>");
 %>
			</a>
		</div>
	</header>
	<%
		if (delete == 1) {
		out.print("<h2 style='text-align:center;'>Sucessfully Update...</h2>");
	}
	%>
	<form action="change_Status" method="post">

		<h2></h2>
		<fieldset>
			<legend style="margin-left: 230px; color: blue">
				<h3>Change Status</h3>
			</legend>
			<h3 style="text-align: center;">Enter the Transcation ID</h3>
			<br> <input type="number" placeholder="Transaction ID"
				name="trans_id"><br>
			<button type="submit" value="submit">Update Status</button>
		</fieldset>
	</form>
	<footer style="background-color: #232f3e;">
		<!-- This is the footer with default 3 divs -->
		<div>
			x
			<h3>HELP & INFORMATION</h3>
			<ul>
				<li>Help</li>
				<li>Delivery information</li>
				<li>Return policy</li>
				<li>Term & Condition</li>
			</ul>
		</div>
		<div>
			<h3>About Books Store</h3>
			<ul>
				<li>Make Donate</li>
				<li>View</li>
				<li>About Book Store</li>
			</ul>
		</div>
		<div class="footerlinks">
			KEEP UP WITH BOOK STORE SHOPPINGS<br> <a href="#"
				class="fa fa-facebook" style="box-sizing: unset;"></a> <a href="#"
				class="fa fa-twitter" style="box-sizing: unset;"></a><a href="#"
				class="fa fa-pinterest" style="box-sizing: unset;"></a> <a href="#"
				class="fa fa-instagram" style="box-sizing: unset;"></a>
		</div>
	</footer>
</body>
</html>