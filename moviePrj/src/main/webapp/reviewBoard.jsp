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
  /* 테이블 헤더를 고정하기 위한 스타일 */
  .table-fixed thead {
    position: sticky;
    top: 0;
    z-index: 1;
    background-color: #fff; /* 선택적으로 배경색 지정 */
  }
  .info-button{
    background-color: transparent; /* 배경을 투명하게 설정 */
    border: 1px solid white; /* 테두리를 흰색으로 설정 */
    color: white; /* 글자 색상을 흰색으로 설정 */
    padding: 10px 20px; /* 버튼 내부 여백 설정 */
    cursor: pointer; /* 커서를 포인터로 변경하여 버튼임을 나타냄 */
    transition: background-color 0.3s, color 0.3s; /* 부드러운 전환 효과를 위한 transition 속성 추가 */
    border-radius: 10px;
  }
  
  .info-button:hover{
    background-color: white; /* 마우스 오버시 배경을 흰색으로 전환 */
    color: black; /* 마우스 오버시 글자 색상을 검정색으로 전환 */
  }
</style>
<%
    int user_no = Integer.parseInt(request.getParameter("user_no"));
    BoardDao dao = new BoardDao();
    List<BoardDto> list = dao.allList();
%>
<body style="background-image: url('img/background.png'); background-size: cover;">
<% if (!list.isEmpty()) { %>
<table class="table table-dark table-borderless" style="opacity: 0.7;">
    <thead>
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">영화제목</th>
            <th scope="col">조회수</th>
        </tr>
    </thead>
    <tbody>
        <% for (BoardDto board : list) { %>
        <tr>
            <td><%= board.getBoard_no() %></td>
            <td><%= board.getBoard_title() %></td>
            <td><%= board.getUser_id() %></td>
            <td><%= board.getInfo_title() %></td>
            <td><%= board.getBoard_hit() %></td>
        </tr>
        <% } %>
    </tbody>
</table>
<% } else { %>
<table class="table table-dark table-borderless" style="opacity: 0.7;">
    <thead>
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">영화제목</th>
            <th scope="col">조회수</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="5" style="text-align: center;">작성된 글이 없습니다.</td>
        </tr>
    </tbody>
</table>
<% } %>
<div style="text-align: center; margin-top: 20px;">
    <a href="./insertBoard.jsp?user_no=<%=session.getAttribute("user_no") %>" class="btn btn-primary">글쓰기</a>
</div>
</body>
</html>
