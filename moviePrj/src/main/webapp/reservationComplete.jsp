<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.ResDto"%>
<%@page import="data.dao.ResDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
</head>
<%
ResDao dao = new ResDao();
ResDto dto = dao.confirmRes(request);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body style="background-color: black;">
	<table class="table">
		<thead class="table-dark">
			<tr>
				<th><%=dto.getUser_name() %>님 예약이 완료되었습니다.</th>
			</tr>
		</thead>
		<thead class="table-light">
			<tr>
				<td><img style="width: 230px;" src='<%=dto.getInfo_img()%> '>
				</td>
			</tr>
			<tr>
				<td>지점: <%=dto.getLocation_detail()%></td>
			</tr>
			<tr>
				<td>영화제목: <%=dto.getInfo_title()%></td>
			</tr>
			<tr>
				<td>시작시간: <%=sdf.format(dto.getTime_time())%></td>
			</tr>
			<tr>
				<td>좌석번호: <%=dto.getSit_name()%></td>
			</tr>
		</thead>

	</table>

</body>
</html>