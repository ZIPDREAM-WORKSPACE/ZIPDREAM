<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<!-- Jquery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" crossorigin="anonymous"></script>
<!-- 부트스트랩에서 제공하고있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩에서 제공하있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
rel="stylesheet">	

<!-- 슬릭 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"> 

<!-- alert창 꾸미기  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/adminSideBar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/adminFooter.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/adminMain.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/adminNotice.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/adminReportDetail.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/adminBkMemberDetail.css">
<script src="<%=request.getContextPath()%>/resources/js/admin/donut.js"></script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

html, body {
	min-width: 1803px;
	width: 100%;
	min-height: 1240px;
	margin: 0;
	background-color: #E5E5E5;
}

div {
	/* border: 1px solid red; */
	
}

.header {
	height: 80px;
	display: flex;
	background: #FFFFFF;
	backdrop-filter: blur(32px);
}

.logo {
	min-width: 250px;
	max-width: 250px;
	padding: 24px 32px 16px;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	border-right: 1px solid #E9ECEF;
	border-bottom: 1px solid #E9ECEF;
	cursor: pointer;
}

.header_user {
	width: 1553px;
	padding: 16px 32px;
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
	align-items: center;
}

.content {
	min-width: 1553px;
	width: calc(100% - 300px); 
	min-height: 1160px;
	position: absolute;
	top: 80px;
	left: 250px;
}

.content-wrap {
	width: 1500px;
	height: 1100px;
	padding: 25px;
   	position: absolute;
   	top: 30px;
   	left : 30px;
   	border-radius: 10px;
   	background-color: #FFFFFF;
   	box-shadow: 0px 10px 13px rgba(17, 38, 146, 0.05);
}

.content-title {
	display:flex;
	justify-content:space-between;
}

.donut {
    width: 70px;
    padding-bottom: 70px;
    position: relative;
    text-align: center;
    transition: background .3s ease-in-out;
    border-radius: 50%;
    background: conic-gradient(#3F8BC9 0% 0%, rgba(222, 222, 222, 0.098) 0% 100%);
}

.donut::before {
    width: 71.5%;
    padding: 13.2px 0px;
    position: absolute;
    left: 14.7%;
    top: 14.7%;
    display: block;
    content: attr(data-percent);
    border-radius: 50%;
    background: #FFFFFF;
    color: #000000;
}

#searchForm {
	display:flex;
	justify-content:flex-start;
	margin-bottom:25px;
	gap:10px;
}
</style>
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			swal("", '${alertMsg.message}','${alertMsg.type}');
		</script>
		<c:remove var="alertMsg" />
	</c:if>
	<header class="header">
		<nav class="logo" onclick="location.href='<%=request.getContextPath()%>/admin/main'">
			<img src="<%=request.getContextPath()%>/resources/images/logo4.png" height="43">
		</nav>
		<div class="header_user">
			<img
				src="<%=request.getContextPath()%>/resources/images/personIcon.png" height="50">
			<div style="padding-left: 20px;">
					<b>${sessionScope.loginUser.userName}</b>
					<div>관리자</div>				
			</div>
			<button type="button" class="btn btn-secondary" onclick="location.href='<%= request.getContextPath()%>/member/logout'" style="margin-left:30px;">로그아웃</button>
		</div>
	</header>
</body>
</html>