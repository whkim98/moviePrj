<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<title>예매 페이지</title>
</head>
<body
	style="background-image: url('img/background.png'); background-size: cover;">

	<div id="header-placeholder"></div>
	<div class="hi">안녕하세요</div>
	<div class="typing-effect">우플릭스</div>
	<div class="nanum-gothic-coding-regular-sub">WOOFLIX</div>

	<div class="content" id="contents">
		<div class="image-size">
			<div class="image-overlay">
				<img src="img/범죄도시1.jpg" style="width: 300px;">
				<div class="overlay-content">
					<button class="reserve-button" onclick="openReserveWindow('./city1Res.jsp?user_no=<%= session.getAttribute("user_no") %>&info_no=1')">예매하기</button>

					<a href="./city1.jsp">
						<button class="info-button">영화정보</button>
					</a>
				</div>
			</div>
		</div>
		<div class="image-size">
			<div class="image-overlay">
				<img src="img/범죄도시2.jpg" style="width: 300px;">
				<div class="overlay-content">
					<button class="reserve-button"
						onclick="openReserveWindow('./city2Res.jsp?user_no=<%= session.getAttribute("user_no") %>')">예매하기</button>
					<a href="./city2.jsp">
						<button class="info-button">영화정보</button>
					</a>
				</div>
			</div>
		</div>
		<div class="image-size">
			<div class="image-overlay">
				<img src="img/범죄도시3.jpg" style="width: 300px;">
				<div class="overlay-content">
					<button class="reserve-button"
						onclick="openReserveWindow('./city3Res.jsp?user_no=<%= session.getAttribute("user_no") %>')">예매하기</button>
					<a href="./city3.jsp">
						<button class="info-button">영화정보</button>
					</a>
				</div>
			</div>
		</div>
		<div class="image-size">
			<div class="image-overlay">
				<img src="img/범죄도시4.jpg" style="width: 300px;">
				<div class="overlay-content">
					<button class="reserve-button"
						onclick="openReserveWindow('./city4Res.jsp?user_no=<%= session.getAttribute("user_no") %>')">예매하기</button>
					<a href="./city4.jsp">
						<button class="info-button">영화정보</button>
					</a>
				</div>
			</div>
		</div>
	</div>

	<script>
function openReserveWindow(url) {
  window.open(url, "_blank", "width=600,height=400");
}
</script>

	<script src="js/content.js"></script>
</body>
</html>
