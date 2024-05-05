<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int user_no = Integer.parseInt(request.getParameter("user_no"));
	String user_name = request.getParameter("user_name");
	String user_password = request.getParameter("user_password");
	String user_phone = request.getParameter("user_phone");
	UserDao dao = new UserDao();
	dao.updateInfo(user_no, user_name, user_password, user_phone);
	response.sendRedirect("./myInfo.jsp?user_no="+user_no);
%>