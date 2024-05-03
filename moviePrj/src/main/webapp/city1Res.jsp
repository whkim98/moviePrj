<%@page import="data.dto.LocationDto"%>
<%@page import="data.dto.TimeDto"%>
<%@page import="data.dao.TimeDao"%>
<%@page import="java.util.List"%>
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
<%
int info_no = Integer.parseInt(request.getParameter("info_no"));
LocationDao dao = new LocationDao();
List<LocationDto> list = dao.allLocation();

TimeDao daoT = new TimeDao();
List<TimeDto> listT = daoT.allTime(info_no);
%>
<body style="background-color: black;">
	<form action="./selectSit.jsp" method="post">
		<table class="table">
			<thead class="table-dark">
				<tr>
					<th>지점 선택</th>
				</tr>
			</thead>
			<thead class="table-light">
				<tr>
					<td><select class="form-select" aria-label="Select Location"
						onchange="showMovieTimes(this)" name="location_no">
							<option selected>지점을 선택하세요</option>
							<%
							for (LocationDto location : list) {
							%>
							<option value="<%=location.getLocation_no()%>">
								<%=location.getLocation_detail()%>
							</option>
							<%
							}
							%>
					</select></td>
				</tr>
			</thead>
		</table>

		<div id="movieTimes" style="display: none;">
			<table class="table">
				<thead class="table-dark">
					<tr>
						<th>영화시간 선택</th>
					</tr>
				</thead>
				<thead class="table-light">
					<tr>
						<td><select class="form-select"
							aria-label="Select Movie Time" name="time_no">
								<option selected>시간을 선택하세요</option>
								<%
								for (TimeDto time : listT) {
								%>
								<option value="<%=time.getTime_no()%>">
									<%=time.getTime_time()%>
								</option>
								<%
								}
								%>
						</select></td>
					</tr>
				</thead>
				<tr>
				<td colspan="2">
				<input type="submit" value="확인">
				</td>
				</tr>
			</table>
			
		</div>

		<script>
			function showMovieTimes(selectElement) {
				var selectedIndex = selectElement.selectedIndex;
				if (selectedIndex !== 0) {
					document.getElementById("movieTimes").style.display = "block";
				} else {
					document.getElementById("movieTimes").style.display = "none";
				}
			}
		</script>

	</form>
</body>
</html>
