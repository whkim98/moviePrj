<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="data.dao.UserDao"%>
<%
    request.setCharacterEncoding("UTF-8");

    int user_no = Integer.parseInt(request.getParameter("user_no"));
    String user_password = request.getParameter("user_password");
    
    UserDao dao = new UserDao();
    
    if(dao.checkPassword(user_no, user_password)) {
%>
    <script>
        alert("비밀번호가 일치합니다!");
        window.close(); // 현재 창 닫기
        window.opener.location.href = "./updateForm.jsp?user_no=<%=user_no %>";
    </script>
<%
    } else {
%>
    <script>
        alert("비밀번호가 일치하지 않습니다!");
        history.back();
    </script>
<%
    }
%>
