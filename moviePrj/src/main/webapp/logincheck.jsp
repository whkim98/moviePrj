<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String user_id = request.getParameter("user_id");
    String user_password = request.getParameter("user_password");
    System.out.println(user_id);
    UserDto dto = new UserDto();
    UserDao dao = new UserDao();

    if(dao.loginCheck(user_id, user_password, request)){
        response.sendRedirect("main.jsp");
    } else {
%>
        <script>
            alert("아이디 또는 비밀번호가 일치하지 않습니다.");
            history.back(); // 이전 페이지로 이동
        </script>
<%
    }
%>
