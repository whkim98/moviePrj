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
    int pageSize = 5; // 한 페이지에 보여질 글의 개수
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1; // 현재 페이지 번호, 기본값은 1
    BoardDao dao = new BoardDao();
    int totalCount = dao.getTotalCount(); // 전체 글의 개수
    int totalPage = (int) Math.ceil((double) totalCount / pageSize); // 전체 페이지 수
    List<BoardDto> list = dao.getListByPage(currentPage, pageSize); // 현재 페이지에 해당하는 글 목록
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
            <td class="board-title" data-board-no="<%= board.getBoard_no() %>"><%= board.getBoard_title() %></td>
            <td><%= board.getUser_id() %></td>
            <td><%= board.getInfo_title() %></td>
            <td class="board-hit"><%= board.getBoard_hit() %></td>
        </tr>
        <tr class="board-content" style="display: none;">
            <td colspan="5"><%= board.getBoard_content() %></td>
        </tr>
        <% } %>
    </tbody>
</table>

<div class="pagination" style="text-align: center;">
    <%-- 이전 페이지 링크 --%>
    <% if (currentPage > 1) { %>
        <a href="?user_no=<%= user_no %>&page=<%= currentPage - 1 %>" class="btn btn-secondary">이전</a>
    <% } %>
    
    <%-- 페이지 번호 링크 --%>
    <% for (int i = 1; i <= totalPage; i++) { %>
        <% if (i == currentPage) { %>
            <a href="#" class="btn btn-primary disabled"><%= i %></a>
        <% } else { %>
            <a href="?user_no=<%= user_no %>&page=<%= i %>" class="btn btn-primary"><%= i %></a>
        <% } %>
    <% } %>
    
    <%-- 다음 페이지 링크 --%>
    <% if (currentPage < totalPage) { %>
        <a href="?user_no=<%= user_no %>&page=<%= currentPage + 1 %>" class="btn btn-secondary">다음</a>
    <% } %>
</div>

<script type="text/javascript">
$(document).ready(function() {
    $(".board-title").click(function() {
        var boardNo = $(this).data("board-no"); // 데이터 속성을 통해 게시글 번호 가져오기
        
        // AJAX를 사용하여 서버로 조회수를 증가시키는 요청 보내기
        $.ajax({
            type: "POST", // HTTP 요청 방식
            url: "updateHit.jsp", // 조회수를 증가시키는 서버 측 페이지의 URL로 변경해야 합니다.
            data: { board_no: boardNo }, // 서버로 보낼 데이터
            success: function(response) {
                // AJAX 요청이 성공적으로 처리되었을 때 수행할 작업 (예: 조회수 업데이트)
                $(".board-hit").filter(function() {
                    return $(this).closest("tr").find(".board-title").data("board-no") === boardNo;
                }).text(response.updatedHitCount);
            },
            error: function(xhr, status, error) {
                // AJAX 요청이 실패했을 때 수행할 작업
                console.error("Error occurred while updating hit count:", error);
            }
        });

        $(this).closest("tr").next(".board-content").slideToggle();
    });
});
</script>

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
