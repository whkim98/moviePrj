<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="data.dto.UserDto"/>
<jsp:useBean id="dao" class="data.dao.UserDao"/>
<jsp:setProperty name="dto" property="*"/>

<%
	dao.insertUser(dto);
	response.sendRedirect("index.jsp");
%>