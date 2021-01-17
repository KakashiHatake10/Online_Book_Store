
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
</head>


<%
	String user = (String) session.getAttribute("name");
Integer l_id = (Integer) session.getAttribute("login_id");
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
				href="update">Update book</a> <a href="login"> <%
 	if (user == null) {
 %> login <%
 	} else
 out.print("<a href='logout' style='color:DodgerBlue;'>" + user + "(logout)</a>");
 %>
			</a>
		</div>
	</header>
	<h2 style="text-align: center;">Admin/Customer</h2>
	<table border="1">

		<tr>
			<th colspan="2">Email</th>
			<th colspan="2">Service</th>
		</tr>
		<c:forEach var="d" items="${users}">
			<tr>
				<c:set var="numb" value='${d.type}' />
				<td colspan="2">${d.user}</td>
				<td colspan="2"><c:choose>
						<c:when test="${numb==0}">  
      Customer
    </c:when>
						<c:otherwise>  
        Admin 
    </c:otherwise>
					</c:choose></td>
			</tr>
		</c:forEach>
	</table>
	<h2 style="margin-left: 25%; margin-right: 25%;">Enter the Email
		id to mail any user to admin</h2>
	<form action="more_admin" method="post">

		<input type="text" name="name" placeholder="Enter the Email id" /> <select
			name="type">
			<option>Customer/Admin</option>
			<option value="1">Admin</option>
			<option value="0">Customer</option>
		</select><br>
		<button type="submit" name="update">Update</button>
	</form>
	<footer style="background-color: #232f3e;">
		<!-- This is the footer with default 3 divs -->
		<div>
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
<style>
form {
	margin-left: 25%;
	margin-right: 25%;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

button {
	border: none;
	outline: 0;
	padding: 12px;
	color: white;
	background-color: green;
	text-align: center;
	cursor: pointer;
	width: 72%;
	font-size: 18px;
}

input, select {
	margin-bottom: 15px;
	border-left: 6px solid green;
	background-color: lightgrey;
	width: 250px;
	height: 40px;
}
</style>
</html>