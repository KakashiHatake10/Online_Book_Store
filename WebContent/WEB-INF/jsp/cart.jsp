<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/Cart.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/Header.css" />"
	rel="stylesheet">
</head>
<body>
	<%
		String user = (String) session.getAttribute("name");
	Integer l_id = (Integer) session.getAttribute("login_id");
	System.out.println("login session 1 " + l_id + "  " + user);
	%>
	<header>
		<div id="logo">ONline BOoks STore</div>
		<div id="headerLinks">
			<a href="<c:url value="/cart?id=${login_id}"></c:url>">Cart</a><a
				href="register">Register</a> <a href="login"> <%
 	if (user == null) {
 %> login <%
 	} else
 out.print("<a href='logout' style='color:DodgerBlue;'>" + user + "(logout)</a>");
 %>
			</a>
		</div>
	</header>
	<h1>Shopping Cart</h1>

	<div class="shopping-cart">

		<div class="column-labels">
			<label class="product-image">Image</label> <label
				class="product-details">Product</label> <label class="product-price">Price</label>
			<label class="product-quantity">Quantity</label> <label
				class="product-removal">Remove</label> <label
				class="product-line-price">Total</label>
		</div>
		<c:set var="TotalPrice" value="${0}" />
		<c:forEach var="book" items="${order}">
			<div class="product">
				<div class="product-image">
					<img src="<c:url value='${book.imgloc}'/>">
				</div>
				<div class="product-details">
					<div class="product-title">${book.title}</div>
					<p class="product-description">${book.description }I'mafan.</p>
				</div>
				<div class="product-price">${book.price}</div>
				<div class="product-quantity">${book.qty}</div>
				<div class="product-removal">
					<button class="remove-product">Remove</button>
				</div>
				<c:set var="result" value="${book.price * book.qty}" />
				<div class="product-line-price">${result}.00</div>
			</div>

			<c:set var="TotalPrice" value="${TotalPrice + result}" />
		</c:forEach>
		<div class="totals">
			<div class="totals-item">
				<label>Grand total</label>
				<div class="totals-value" id="cart-subtotal">${TotalPrice}.00</div>
			</div>
		</div>
		<form action="Checkout" method="get">
			<input type="hidden" name="login_id" value="<%=l_id%>">
			<button type="submit" class="checkout">Checkout</button>
		</form>
	</div>
</body>
</html>