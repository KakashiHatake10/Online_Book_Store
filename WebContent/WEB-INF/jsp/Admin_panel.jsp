
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

<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/Header.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/footer.css" />"
	rel="stylesheet">
</head>
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
	String s = (String) request.getAttribute("name");
Integer l_id = (Integer) request.getAttribute("login_id");
System.out.print(s);
System.out.print(l_id);
session.setAttribute("name", s);
session.setAttribute("login_id", l_id);
%>

<body>

	<div id="mainWrapper">

		<header>
			<!-- This is the header content. It contains Logo and links -->
			<div id="logo">
				<!-- <img src="logoImage.png" alt="sample logo"> -->
				<!-- Company Logo text -->
				ONline BOoks STore
			</div>
			<div id="headerLinks">
				<a href="All_feedback">Feedbacks</a> <a
					href="<c:url value="/change_password?id=${login_id}"></c:url>">Change
					password</a> <a href="all_order">All Order</a> <a href="add">Add
					New book</a> <a href="update">Update book</a><a href="more_admin">make
					admin</a> <a href="login"> <%
 	if (s == null) {
 %> login <%
 	} else
 out.print("<a href='logout' style='color:DodgerBlue;'>" + s + "(logout)</a>");
 %>
				</a>
			</div>
		</header>
		<section id="offer"
			style="background-image: url('https://colombostrategy.com/wp-content/uploads/2020/04/jaredd-craig-HH4WBGNyltc-unsplash.jpg')">
			<!-- The offer section displays a banner text for promotions -->
			<!-- <img src=""/> -->

			<strong style="font-size: 24px;">OFFER 50%</strong>

			<p>
				<strong>REALLY AWESOME DISCOUNTS THIS MONTH</strong>
			</p>
		</section>
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
				<input type="text" class="search"
					placeholder="Search By Book name,Author"> <i
					class="fa fa-search" class="search"
					style="font-size: 36px; margin-top: 5px;" aria-hidden="true"></i>

			</div>
			<div class="grid-container">
				<c:set var="count" value="0" scope="page" />
				<c:forEach var="im" items="${photo}">
					<c:if test="${count < 8}">
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
						<c:set var="count" value="${count + 1}" scope="page" />
					</c:if>
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
			<div style="margin-top: 31px; margin-left: -125px;">
				<a href="feedback" style="color: wheat; cursor: pointer;">FeedBack</a>
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
</html>