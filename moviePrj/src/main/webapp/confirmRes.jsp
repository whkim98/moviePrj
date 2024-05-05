<%@page import="data.dao.SitDao"%>
<%@page import="data.dto.SitDto"%>
<%@page import="data.dao.ResDao"%>
<%@page import="data.dto.ResDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
    String seatName = request.getParameter("seat_name");
    System.out.println("좌석번호" + seatName);
    int location_no = Integer.parseInt(request.getParameter("location_no"));
    int time_no = Integer.parseInt(request.getParameter("time_no"));
    int info_no = Integer.parseInt(request.getParameter("info_no"));
    ResDto dto = new ResDto();
    ResDao dao = new ResDao();
    
    SitDto dtoS = new SitDto();
    SitDao daoS = new SitDao();
    
    int sit_no = daoS.getSitNo(seatName);
    
    dao.insertRes(location_no, time_no, info_no, sit_no, request);
%>
<body>
    <script>
        alert("예약이 완료되었습니다.");
        window.location.href = "reservationComplete.jsp";
    </script>
</body>
</html>
