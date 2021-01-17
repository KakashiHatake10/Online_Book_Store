<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%
	String user = (String) session.getAttribute("name");
Integer l_id = (Integer) session.getAttribute("login_id");
String product = (String) request.getAttribute("title");
String price = (String) request.getAttribute("price");
String product_data = (String) request.getAttribute("one_product");
System.out.println("login session 1 " + l_id + "  " + user);
System.out.println(product + "  " + price);
int con = (int) request.getAttribute("payment");
%><link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<c:url value="/resources/css/Payment.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/Header.css" />"
	rel="stylesheet">

</head>
<body>
	<header>
		<div id="logo">ONline BOoks STore</div>
		<div id="headerLinks">
			<a href="cart/${login_id}">Cart</a> <a href="register">Register</a> <a
				href="login"> <%
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
	<h3
		style="text-align: center; color: #03f70d; margin-right: 285px; font-size: xx-large;">Payment
		Gateway</h3>
	<%
		if (con == 1) {
		out.print("<h2 style='text-align:center;'>Successfuly Payment..............</h2>");
	}
	%>
	<div class="Fields">
		<div>
			<div class="formContainer" style="float: left; border: blue;">
				<%
					if (product_data.equalsIgnoreCase("one")) {
				%>
				<h4>
					Cart <span class="price" style="color: black"><i
						class="fa fa-shopping-cart"></i> <b>1</b></span>
				</h4>
				<p>
					<a href="#"><%=product%></a> <span class="price">&#8377; $<%=price%></span>
				</p>
				<hr>
				<p>
					<c:set var="TotalPrice" value="${price}" />
					Total <span class="price" style="color: black"><b>&#8377;$<%=price%></b></span>
				</p>
			</div>
			<%
				}
			%>
			<%
				if (product_data.equalsIgnoreCase("mul")) {
			%>
			<h4>
				Cart <span class="price" style="color: black"><i
					class="fa fa-shopping-cart"></i> <b></b></span>
			</h4>
			<c:set var="TotalPrice" value="${0}" />
			<c:forEach var="book" items="${order}">
				<p>
					<a href="#">${book.title}</a> <span class="price">&#8377;${book.price * book.qty}</span>
				</p>
				<c:set var="TotalPrice" value="${book.price*book.qty + TotalPrice}" />
			</c:forEach>
			<hr>
			<p>
				Total <span class="price" style="color: black"><b>&#8377;${TotalPrice}</b></span>
			</p>
		</div>


		<%
			}
		%>

		<div>
			<div class="formContainer" style="width: 900px;">
				<form action="payment" method="get">
					<div class="Fields">
						<label for="cname">Name on Card</label> <input type="text"
							id="cname" name="cardname" /> <label for="ccnum">Credit
							card number</label> <input type="text" id="ccnum" name="cardnumber" />
						<div class="Fields">
							<div style="margin-left: -3pc;">
								<label for="expyear">Exp Year</label> <input type="text"
									id="expyear" name="expyear" />
							</div>
							<div>
								<label for="cvv">CVV</label> <input type="text" id="cvv"
									name="cvv" />
							</div>
						</div>
					</div>

					<input type="hidden" name="login_id" value="<%=l_id%>" /> <input
						type="hidden" name="total_price" value="${TotalPrice}" /> <input
						type="submit" value="Continue to checkout" class="checkout" />
				</form>
			</div>
		</div>
	</div>
</body>
<style>
body {
	margin: 0px;
	padding: 0px;
}

header {
	font-family: 'Montserrat', sans-serif;
	color: rgba(146, 146, 146, 1.00);
	font-size: 16px;
	font-style: normal;
	font-weight: 400;
}

.dark-mode {
	background-color: black;
	color: white;
}
/* Logo placeholder*/
#logo {
	float: left;
	padding-top: 10px;
	padding-bottom: 10px;
	width: 179px;
	text-align: center;
	color: rgba(255, 255, 255, 1.00);
	background-color: cadetblue;
}
/* div for Links in header */
#headerLinks {
	float: left;
	width: calc(100% - 179px);
	text-align: right;
	padding-top: 0px;
	padding-bottom: 10px;
	margin: 0px;
}
/* Links in header */
#headerLinks a {
	text-decoration: none;
	color: black;
	padding-left: 66px;
	font-size: 14px;
}
</style>
</html>