<%@page import="data.dto.LocationDto"%>
<%@page import="data.dto.TimeDto"%>
<%@page import="data.dao.TimeDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.LocationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap"
	rel="stylesheet">
<%
	int user_no = Integer.parseInt(request.getParameter("user_no"));
%>
<body style="background-color: black;">
	<form action="./infoupdateAction.jsp?user_no=<%=user_no %>" method="post">
		<table class="table">
			<thead class="table-dark">
				<tr>
					<th><input type="text" name="user_password" placeholder="비밀번호 입력"></th>
					<td><input type="submit" value="제출"></td>
				</tr>
			</thead>
			</table>
	</form>
</body>
</html>
