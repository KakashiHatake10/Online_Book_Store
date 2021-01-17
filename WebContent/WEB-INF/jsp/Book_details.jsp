<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/Header.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/footer.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/Book_details.css" />"
	rel="stylesheet">

</head>
<%
	String user = (String) session.getAttribute("name");
Integer l_id = (Integer) session.getAttribute("login_id");
System.out.println("login session 1 " + l_id + " " + user);
int con = (int) request.getAttribute("msg");
%>
<body>
	<div id="mainWrapper">
		<!-- Header content -->
		<header>
			<div id="logo">ONline BOoks STore</div>
			<div id="headerLinks">
				<a href="<c:url value="/cart?id=${login_id}"></c:url>">Cart</a> <a
					href="register">Register</a> <a href="login"> <%
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
		<%
			if (con == 1) {
			out.print("<h2 style='text-align:center;'>Successfuly Add to Cart..............</h2>");
		}
		%>
		<c:forEach var="im" items="${photo}">
			<div class="container">
				<div class="card">
					<div class="container-fliud">
						<div class="wrapper row">
							<div class="preview col-md-6">

								<div class="preview-pic tab-content">
									<div class="tab-pane active" id="pic-1">
										<img src=<c:url value='${im.imgloc}'></c:url> alt="sample" />
									</div>

								</div>

							</div>
							<div class="details col-md-6">
								<h3 class="product-title">${im.title}Programming</h3>
								<form action="order" method="get" name="myform"
									onsubmit="return validateForm()">
									<div class="rating">
										<div class="stars">
											<span class="fa fa-star checked"></span> <span
												class="fa fa-star checked"></span> <span
												class="fa fa-star checked"></span> <span class="fa fa-star"></span>
											<span class="fa fa-star"></span>
										</div>
										<span class="review-no">41 reviews</span><br> <span
											class="review-no">${im.author}</span>
									</div>
									<p class="product-description">${im.description }
										Suspendisse quos? Tempus cras iure temporibus? Eu laudantium
										cubilia sem sem! Repudiandae et! Massa senectus enim minim
										sociosqu delectus posuere.</p>
									<h4 class="price">
										current price: <span>$${im.price}</span>
									</h4>
									Quantity:- <input type="number" value="1" name="qty" min="1">
									select quantity
									<p class="vote">
										<strong>91%</strong> of buyers enjoyed this product! <strong>(87
											votes)</strong>
									</p>
									<div class="bag-total">
										<div class="subtotal">
											<p class="small">Subtotal:</p>
											<p class="small">$${im.price}.00</p>
										</div>
										<div class="delivery">
											<p class="small">
												Delivery (Standard - 2 working days):<br> <span
													class="change-delivery">Change delivery method</span>
											</p>
											<p class="small">Free</p>
										</div>
										<div class="total">
											<h3>Total:</h3>
											<h3>&#8377;${im.price}.00</h3>
										</div>
										<div class="promo-checkbox">
											<input type="checkbox" name="promo-check" checked> <label
												for="promo-check">I have a promo code</label>
										</div>
										<div class="promo-code">
											<input type="text" name="promo-checkbox"
												placeholder="Enter your promo code here" checked>
											<button class="apply">Apply</button>
										</div>
									</div>
									<input type="hidden" name="title" value='${im.title}'>
									<input type="hidden" name="price" value='${im.price}'>
									<input type="hidden" name="id" value='${im.bookid}'> <input
										type="hidden" name="login_id" value="<%=l_id%>" />
									<div class="action">
										<%
											if (l_id == 0) {
										%>
										<a href="login"> <input type="button"
											class="add-to-cart btn btn-default" value="Add to cart" /></a> <a
											href="login"> <input type="button"
											class="add-to-cart btn btn-default" value="Buy Now" /></a>
										<%
											} else {
										%>
										<input type="submit" class="add-to-cart btn btn-default"
											name="buy" value="Add to cart" /> <input type="submit"
											class="add-to-cart btn btn-default" value="Buy Now"
											name="buy" />
										<%
											}
										%>
									</div>
									<div class="help">
										<p>Need help? Call free 01234 567 890</p>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
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
</html>