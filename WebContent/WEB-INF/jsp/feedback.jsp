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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/Header.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/footer.css" />"
	rel="stylesheet">
<%--  <link href="<c:url value="/resources/css/Add_Update_Page.css" />"
	rel="stylesheet">  --%>
</head>
<%
	String user = (String) session.getAttribute("name");
Integer l_id = (Integer) session.getAttribute("login_id");
System.out.println("login session 1 " + l_id + " " + user);
int con = (int) request.getAttribute("done");
%>
<body Style="background-color: #e3e2df;">
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
		</div>
	</header>


	<form action="feedback" method="post">
		<div class="container">
			<div class="row">
				<%
					if (con == 1) {
					out.println("<h3>Your Message reached...........</h3>");
				}
				%>
				<h1>Feedback Form</h1>
				<p>We would love to hear your thoughts, suggestions, concerns or
					problems with anything so we can improve! instead of next to each
					other.</p>
				<hr>
				<div class="col-25">
					<label for="fname">First Name</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="fname"
						placeholder="Your name.." required>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="lname">Last Name</label>
				</div>
				<div class="col-75">
					<input type="text" id="lname" name="lname"
						placeholder="Your last name.." required>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="Email">Email</label>
				</div>
				<div class="col-75">
					<input type="Email" id="lname" name="email"
						placeholder="Your email id.." required>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="lname">Feedback Type</label>
				</div>
				<div class="col-75">
					<input type="radio" id="lname" name="type"
						placeholder="Your last name.." value="comments"> <label>Comments</label>
					&emsp;&emsp;&emsp;&emsp; <input type="radio" id="lname" name="type"
						placeholder="Your last name.." value="Suggestions" checked><label>Suggestions</label>
					&emsp;&emsp;&emsp;&emsp; <input type="radio" id="lname" name="type"
						placeholder="Your last name.." value="Questions"><label>Questions</label>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="subject">Message</label>
				</div>
				<div class="col-75">
					<textarea id="subject" name="message"
						placeholder="Write something.." style="height: 200px" required></textarea>
				</div>
			</div>
			<div class="row">
				<%-- 		<input type="hidden" name="login_id" value="<%=l_id%>" />  --%>
				<input type="submit" value="Submit">
			</div>
		</div>
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
</body>
<style>
* {
	box-sizing: border-box;
}

input[type=text], input[type=email], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 83px;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}

input[type=radio] {
	border: 0px;
	width: 9%;
	height: 2em;
}
</style>
</html>