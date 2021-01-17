<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="http://use.edgefonts.net/montserrat:n4:default;source-sans-pro:n2:default.js"
	type="text/javascript"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/Header.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/footer.css" />"
	rel="stylesheet">
</head>
<%
	String user = (String) session.getAttribute("name");
Integer l_id = (Integer) session.getAttribute("login_id");
System.out.println("login session 1 " + l_id + " " + user);
%>
<body>
	<!-- Header content -->
	<header>
		<div id="logo">ONline BOoks STore</div>
		<div id="headerLinks">
			<a href="<c:url value="/myorder?id=${login_id}"></c:url>">My
				Order</a> <a href="<c:url value="/cart?id=${login_id}"></c:url>">Cart</a>
			<a href="register">Register</a> <a href="login"> <%
 	if (user == null) {
 %> login <%
 	} else
 out.print("<a href='logout' style='color:DodgerBlue;'>" + user + "(logout)</a>");
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
	<div id="content">
		<div class="store">
			<ul>
				<li><a href="<c:url value="/books?id=1"></c:url>"
					style="color: white;">C</a></li>
				<li><a href="<c:url value="/books?id=2"></c:url>"
					style="color: white;">C++</a></li>
				<li><a href="<c:url value="/books?id=3"></c:url>"
					style="color: white;">java</a></li>
				<li><a href="<c:url value="/books?id=4"></c:url>"
					style="color: white;">python</a></li>
				<li><a href="<c:url value="/books?id=5"></c:url>"
					style="color: white;">Javascript</a></li>
			</ul>
		</div>
		<div class="grid-container">
			<c:forEach var="im" items="${photo}">
				<div class="grid-item">
					<a href="details?id=${im.bookid}"><img
						src=<c:url value='${im.imgloc}'></c:url> />
						<h2 class="product-name">
							<c:url value='${im.title}' />
						</h2>
						<h3 class="price">
							&#8377;
							<c:url value='${im.price}' />
						</h3> </a>
					<form action="order" method="get" name="myform"
						onsubmit="return validateForm()">
						<h3>
							Quantity<input type="number" class="price" value="1" name="qty"
								min="1">
						</h3>
						<input type="hidden" name="title" value='${im.title}'> <input
							type="hidden" name="price" value='${im.price}'> <input
							type="hidden" name="id" value='${im.bookid}'> <input
							type="hidden" name="login_id" value="<%=l_id%>" />
						<button type="submit" name="buy"
							class="w3-button w3-block w3-teal">Add to cart</button>
					</form>
				</div>
			</c:forEach>
		</div>
	</div>
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
	</div>
</body>
<style>
.store ul {
	position: -webkit-sticky; /* Safari */
	position: sticky;
	top: 0;
	color: #333;
	list-style-type: none;
	margin: 0;
	overflow: hidden;
	background-color: #333;
	text-align: center;
}

.store a:link, a:visited {
	display: block;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	padding-left: 200px;
}

.store a:hover:not(.active) {
	background-color: #111;
}

.store a:active {
	background-color: #4CAF50;
}

.store a:hover, a:active {
	background-color: #999fff;
}

.store li {
	float: left;
}

button {
	border: none;
	outline: 0;
	padding: 12px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
}

/* Content section product info image  */
.grid-container, .grid-container:before, .grid-container:after {
	box-sizing: border-box;
}

h2 {
	font-size: 18px;
	padding: 14px 10px;
}

h3 {
	font-size: 16px;
	padding: 12px 10px;
}

h2, h3, a {
	clear: both;
	margin: 0;
	font-family: sans-serif;
	text-align: center;
}

img {
	width: 100%;
	height: 200px;
	display: block;
}

.grid-item a {
	display: block;
	text-decoration: none;
	width: 100%;
}

a:hover {
	text-decoration: underline;
	color: #333;
}

.grid-container {
	max-width: 1024px;
	margin: 0 auto;
	font-size: 0;
}

.grid-item {
	width: 23%;
	border: 1px solid #ccc;
	margin: 1%;
	display: inline-block;
}

.vew-product {
	width: 100%;
	display: block;
	margin: 0;
}

.view-product * {
	
}

.product-name {
	width: 100%;
	height: 44px;
}

.price {
	width: 100%;
	bottom: 44px;
	text-align: center;
}

.grid-item .add-to-cart {
	height: 44px;
	line-height: 44px;
	width: 100%;
	color: black;
	font-size: 16px;
}
</style>
</html>