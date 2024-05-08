<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
</head>
<body>
<header class="nanum-gothic-coding-regular">
    <div style="margin-left: 20px;">WOOGABOX</div>
    <ul>
        <li><a href="main.jsp#contents">Contents</a></li>
        <li><a href="#" onclick="userInfo()">My Info</a></li>
        <li><a href="#" onclick="reviewBoard()">Reviews</a></li>
    </ul>
</header>

<script>
    function userInfo() {
        var user_no = '<%= session.getAttribute("user_no") %>';
        location.href = './myInfo.jsp?user_no=' + user_no;
    }

    function reviewBoard() {
        var user_no = '<%= session.getAttribute("user_no") %>';
        location.href = './reviewBoard.jsp?user_no=' + user_no;
    }

</script>
</body>
</html>
