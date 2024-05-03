<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.TimeDto"%>
<%@page import="data.dao.TimeDao"%>
<%@page import="data.dto.LocationDto"%>
<%@page import="data.dao.LocationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
<%
    // Get parameters from request
    int location_no = Integer.parseInt(request.getParameter("location_no"));
    int time_no = Integer.parseInt(request.getParameter("time_no"));
    int info_no = Integer.parseInt(request.getParameter("info_no"));
    // Instantiate DAOs
    LocationDao dao = new LocationDao();
    TimeDao daoT = new TimeDao();
    
    // Retrieve location detail and time information
    String location_detail = dao.locationDetail(location_no);
    Timestamp time_time = daoT.timeDetail(time_no);
    
    // Format timestamp to display
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body style="background-color: black;">
    <table class="table">
        <thead class="table-dark">
            <tr>
                <th colspan="10"><%=location_detail %> (<%=sdf.format(time_time) %>)좌석선택</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <% for(int i = 1; i <= 5; i++) { %>
                    <td><button class="reserve-button" onclick="confirmReservation('A<%=i%>')">A<%=i%></button></td>
                <% } %>
            </tr>
            <tr>
                <% for(int i = 1; i <= 5; i++) { %>
                    <td><button class="reserve-button" onclick="confirmReservation('B<%=i%>')">B<%=i%></button></td>
                <% } %>
            </tr>
            <tr>
                <% for(int i = 1; i <= 5; i++) { %>
                    <td><button class="reserve-button" onclick="confirmReservation('C<%=i%>')">C<%=i%></button></td>
                <% } %>
            </tr>
        </tbody>
    </table>

    <script>
    function confirmReservation(seatName) {
        // Show confirmation dialog
        var confirmation = confirm('선택한 좌석을 예약하시겠습니까?');
        // If user confirms reservation
        if (confirmation) {
            // Construct URL with seat information
            var url = './confirmRes.jsp?info_no=<%=info_no %>&location_no=<%=location_no%>&time_no=<%=time_no%>&seat_name=' + seatName;
            // Redirect to reservation page
            window.location.href = url;
        } else {
            // If user cancels, do nothing
            return;
        }
    }
</script>

</body>
</html>
