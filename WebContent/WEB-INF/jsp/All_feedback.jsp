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
	int con = (int) request.getAttribute("submit");
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
		<h1 Style="text-align: center; color: white;">All feedbacks</h1>
	</div>
	<%
		if (con == 1) {
		out.print("<h2 style='text-align:center;'>Successfuly send..............</h2>");
	}
	%>

	<div class="content">
		<div class="content1">
			<h2>Feedbacks</h2>
		</div>
		<c:forEach var="book" items="${feedback}">
			<div class="content2">
				<div class="content2-header1" Style="background-color: #F5F5F5;">
					<form style="padding-left: 24%;" action="feedback_reply"
						method="get">
						<p>
							Name :-<span> &ensp;${book.name }</span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Email
							:-<span> &ensp; ${book.email}</span><br> <br> <br>
							Message :- <span> &ensp;${book.message }</span><br> <br>
							Feedback Type :- <span> &ensp;${book.feedback_type }</span><br>
							<br>Reply :-<br> <br> <input type="hidden"
								name="email" value="${book.email}">
							<textarea rows="10" cols="80" name="reply"
								placeholder="Some text here......."></textarea>
						</p>
						<input type="submit">
					</form>
					<hr>
				</div>
			</div>
		</c:forEach>
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
	width: 99%;
	padding: 1.5em;
	margin-left: 4px;
}

.content2-header1 p {
	font-family: 'Open Sans', sans-serif;
	font-size: 16px;
	font-weight: 700;
	color: black;
	margin: 0;
}

.content2-header1 span {
	font-family: 'Open Sans', sans-serif;
	font-size: 16px;
	font-weight: 700;
	color: #4E7D48;
}

input {
	border: none;
	outline: 0;
	padding: 12px;
	color: white;
	background-color: green;
	text-align: center;
	cursor: pointer;
	width: 16%;
	font-size: 18px;
	margin: 20px 200px;
}
</style>
</html>