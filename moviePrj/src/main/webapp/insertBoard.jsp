<%@page import="data.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.BoardDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
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
<title>게시판</title>
</head>
<style>
.table-fixed thead {
	position: sticky;
	top: 0;
	z-index: 1;
	background-color: #fff;
}

.info-button {
	background-color: transparent;
	border: 1px solid white;
	color: white;
	padding: 10px 20px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
	border-radius: 10px;
}

.info-button:hover {
	background-color: white;
	color: black;
}
</style>
<%
int user_no = Integer.parseInt(request.getParameter("user_no"));

UserDao udao = new UserDao();
UserDto udto = udao.myInfo(user_no);
%>
<body
	style="background-image: url('img/background.png'); background-size: cover;">
	<form action="./boardInsertAction.jsp" method="post">
		<input type="hidden" name="user_no" value="<%=user_no%>">
		<table class="table table-dark table-borderless" style="opacity: 0.7;">
			<thead>
				<tr>
					<th scope="col">제목</th>
					<td><input type="text" name="board_title"> 작성자 | <b>
							<%=udto.getUser_id()%></b></td>
				</tr>
				<tr>
					<th scope="col">내용</th>
					<td colspan="3"><textarea name="board_content" rows="4"
							cols="50"></textarea></td>
				</tr>
				<tr>
					<th>영화선택</th>
					<td colspan="3"><img src="img/범죄도시1.jpg" class="info_no"
						style="width: 100px;"> <select name="info_no" id="info_no">
							<%
							for (int i = 1; i <= 4; i++) {
							%>
							<option value="<%=i%>">범죄도시<%=i%></option>
							<%
							}
							%>
					</select> <script type="text/javascript">
						$(document).ready(function() {
							$("#info_no").change(function() {
								let value = $(this).val();
								let src = "img/범죄도시" + value + ".jpg";
								$(".info_no").attr("src", src);
							});
						});
					</script></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit"
						value="글쓰기"></td>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</form>
</body>
</html>
