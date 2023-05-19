<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<!-- Jquey 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하있는 스타일 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부투스트랩에서 제공하고있는 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
html, body {
	margin: 0;
	background-color: #E5E5E5;
}

div {
	/* border: 1px solid red; */
	
}

/* header */
.header {
	height: 100px;
	display: flex;
	background: #FFFFFF;
	backdrop-filter: blur(32px);
}

.logo {
	min-width: 250px;
	max-width: 250px;
	display: flex;
	flex-direction: row;
	align-items: center;
	padding: 24px 32px 16px;
	border-right: 1px solid #E9ECEF;
	border-bottom: 1px solid #E9ECEF;
}

.logo_text {
	width: 100px;
	height: 43px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 500;
	font-size: 33px;
	line-height: 130%;
	color: #232D42;
}

.header_user {
	width: 1663px;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 16px 32px;
}
</style>
</head>
<body>
	<section class="header">
		<div class="logo">
			<img src="<%=request.getContextPath()%>/resources/images/logo3.png"
				height="43"> <span class="logo_text">집드림</span>
		</div>
		<div class="header_user">
			<img
				src="<%=request.getContextPath()%>/resources/images/personIcon.png"
				height="50">
			<div style="padding-left: 20px;">
				<b>류준하</b>
				<div>관리자</div>
			</div>
		</div>
	</section>
</body>
</html>