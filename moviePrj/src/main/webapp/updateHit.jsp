<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="data.dao.BoardDao"%>
<%
    // 클라이언트로부터 전달된 board_no 파라미터를 받아옵니다.
    int boardNo = Integer.parseInt(request.getParameter("board_no"));
    
    // BoardDao를 생성하고 조회수를 증가시킵니다.
    BoardDao dao = new BoardDao();
    dao.updateHit(boardNo);
%>
