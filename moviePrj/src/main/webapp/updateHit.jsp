<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="data.dao.BoardDao"%>
<%
    int boardNo = Integer.parseInt(request.getParameter("board_no"));
    
    BoardDao dao = new BoardDao();
    dao.updateHit(boardNo);
%>
