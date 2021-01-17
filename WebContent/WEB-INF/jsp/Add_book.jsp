
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


<script>
	function myFunction() {
		var element = document.body;
		element.classList.toggle("dark-mode");
	}
	window.onload = function() {
		if (!window.location.hash) {
			window.location = window.location + '#loaded';
			window.location.reload();
		}
	}
</script>
<%
	Integer l_id = (Integer) session.getAttribute("login_id");
String s = (String) session.getAttribute("name");
System.out.println("login session 1 " + s);
/* int con = (int) request.getAttribute("msg"); */
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
			<a href="all_order">All Order</a> <a href="update">Update book</a><a
				href="more_admin">make admin</a> <a href="login"> <%
 	if (s == null) {
 %> login <%
 	} else
 out.print("<a href='logout' style='color:DodgerBlue;'>" + s + "(logout)</a>");
 %>
			</a>
		</div>
	</header>

	<div id="content">
		<form method="get" action="savefile" enctype="multipart/form-data"
			class="card-body">
			<fieldset>
				<legend style="margin-left: 100px; color: blue">
					<h2 class="title">Add New Book</h2>
				</legend>
				<input type="text" placeholder="Title" name="title"><br>
				<input type="text" placeholder="Author" name="author"><br>
				<input type="text" placeholder="Quantity" name="qty"><br>
				<select name="catogory">
					<option value="1">C</option>
					<option value="2">C++</option>
					<option value="3">java</option>
					<option value="4">python</option>
				</select><br> <input type="number" placeholder="Price" name="price"><br>
				<input type="text" placeholder="Description" name="description"><br>
				<input type="file" name="file" placeholder="image"><br>

				<button type="submit">Add Book</button>
			</fieldset>
		</form>
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
</body>

</html>