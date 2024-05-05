<%@page import="data.dto.BoardDto"%>
<%@page import="data.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int user_no = Integer.parseInt(request.getParameter("user_no"));
	int info_no = Integer.parseInt(request.getParameter("info_no"));
	String board_title = request.getParameter("board_title");
	String board_content = request.getParameter("board_content");
	BoardDao dao = new BoardDao();
	dao.boardInsert(user_no, info_no, board_content, board_title);
	response.sendRedirect("reviewBoard.jsp?user_no="+user_no);
%>