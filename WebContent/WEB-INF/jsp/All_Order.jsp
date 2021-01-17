<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
			<a href="add">Add New book</a> <a href="update">Update book</a><a
				href="more_admin">make admin</a> <a href="login"> <%
 	if (user == null) {
 %> login <%
 	} else
 out.print("<a href='logout' style='color:DodgerBlue;'>" + user + "(logout)</a>");
 %>
			</a>
		</div>
	</header>
	<div class="header">
		<h1 Style="text-align: center;">All orders</h1>
	</div>

	<div class="content">
		<div class="content1">
			<h2>Lists</h2>
		</div>
		<div class="content2">
			<div class="content2-header1" style="background-color: #b5e6ae;">
				<p>Transcation ID</p>
			</div>
			<div class="content2-header1" style="background-color: #b5e6ae;">
				<p>Card Number</p>
			</div>
			<div class="content2-header1" style="background-color: #b5e6ae;">
				<p>Total Amount</p>
			</div>
			<div class="content2-header1" style="background-color: #b5e6ae;">
				<p>Order Date</p>
			</div>
			<div class="content2-header1" style="background-color: #b5e6ae;">
				<p>Expected Date</p>
			</div>
			<div class="content2-header1" style="background-color: #b5e6ae;">
				<p>Status</p>
			</div>
			<div class="clear"></div>
		</div>
		<div>

			<%!int j = 0;%>
			<c:forEach var="book" items="${order}">

				<div class="content2-header1" style="background-color: #cecece;">
					<p>
						<span>${book.transaction}</span>
					</p>
				</div>
				<div class="content2-header1" style="background-color: #cecece;">
					<p>
						<span>${book.card_no }</span>
					</p>
				</div>
				<div class="content2-header1" style="background-color: #cecece;">
					<p>
						<span>${book.total_amount } </span>
					</p>
				</div>

				<div class="content2-header1" style="background-color: #cecece;">
					<p>
						<span> ${book.strDate}</span>
					</p>
				</div>
				<div class="content2-header1" style="background-color: #cecece;">
					<p>
						<span> <c:choose>
								<c:when test="${book.productStatus =='0'}">
      										complete	   
								</c:when>
								<c:otherwise>${book.expected}</c:otherwise>
							</c:choose></span>
					</p>
				</div>
				<div class="content2-header1" style="background-color: #cecece;">
					<p>
						<span> <c:choose>
								<c:when test="${book.productStatus =='0'}">
            complete
         </c:when>
								<c:when test="${book.productStatus == '1'}">
            processing
         </c:when>
								<c:otherwise>
            Return
         </c:otherwise>
							</c:choose></span>
					</p>
				</div>

				<div class="clear"></div>

			</c:forEach>

		</div>
		<button>
			<h3 style="text-align: center;">
				<a href="change_Status" style="text-decoration: none;">Change
					Status</a>
			</h3>
		</button>

	</div>
</body>
<style>
.content {
	width: 95%;
	margin: 3% auto 0 auto;
	height: 460px;
	background-color: #F5F5F5;
}

.content1 {
	background-color: #98d091;
	text-align: center;
	padding: 2em;
}

.content1 h2 {
	font-family: 'Open Sans', sans-serif;
	text-transform: uppercase;
	margin: 0;
	color: #fff;
}

.content2 {
	background-color: #b5e6ae;
}

.content2-header1 {
	float: left;
	width: 211px;
	text-align: center;
	padding: 1.5em;
	margin-left: 4px;
}

.content2-header1 p {
	font-family: 'Open Sans', sans-serif;
	font-size: 16px;
	font-weight: 700;
	color: #4E7D48;
	margin: 0;
}

.content2-header1 span {
	font-size: 14px;
	font-weight: 400;
}

button {
	border: none;
	outline: 0;
	padding: 12px;
	color: white;
	background-color: green;
	text-align: center;
	cursor: pointer;
	width: 16%;
	font-size: 18px;
	margin: 20px 651px;
}
</style>
</html>