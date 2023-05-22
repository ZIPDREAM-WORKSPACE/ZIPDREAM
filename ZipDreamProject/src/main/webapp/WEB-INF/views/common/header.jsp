<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<!--  공통적으로사용할 라이브러리 추가 -->
	

<!-- Jquey 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
 <!-- 부트스트랩에서 제공하있는 스타일  -->
 <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
<!-- 부투스트랩에서 제공하고있는 스크립트   -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<!-- 	
<!-- 슬릭 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"> 



<!-- aos 라이브러리 -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 


<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.header {
	width: 100%;
	height: 80px;
	position: sticky;
	top: 0;
	background-color: white;
	border-bottom: 1px solid rgb(206, 206, 206);
	z-index: 9;
}

.header_inner {
	width: 100%;
	height: 100%;
	position: relative;
}

.header_inner>ul {
	padding: 0px;
}

.login {
	position: absolute;
	right: 5%;
	top: 25%;
	width: 6%;
	height: 40px;
	font-size: 1.1vw;
	background: #1F4B6B;
	color: white;
	text-align: center;
	border-radius: 10px;
	min-width:45px;
	line-height : 40px;
	box-shadow: 0 17px 20px -18px rgba(0, 0, 0, 1);
	cursor: pointer;
	font-weight: 500;
}
.login>a{
	color:white;
	text-decoration-line: none;
}

.header_list {
	width: 60%;
	margin: auto;
	height: 100%;
	display: flex;
	justify-content: center;
	list-style: none;
}

.h_list {
	width: 20%;
	text-align: center;
	margin: auto;
}

#logo {
	width: 4.5vw;
	height: 3.5vw;
	cursor: pointer;
	justify-content: center;
	min-width: 50px;
	min-height: 40px;
	
}

.h_text {
	margin: auto; /* 25px; */
	font-size: 1.2vw;
	width: 18%;
	text-align: center;
	cursor: pointer;
	font-weight: 500;
}

.h_text>a:hover {
	color: rgb(76, 129, 141);
}

.h_text>a {
	text-decoration-line: none;
	color: black;
}


</style>
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("서비스 요청 성공", '${alertMsg}');
		</script>
		<c:remove var="alertMsg" />
	</c:if>

	<div class="header">
		<div class="header_inner">
			<ul class="header_list">
				<li class="h_text"><a href="<%=request.getContextPath()%>/map/main">지도</a></li>
				<li class="h_text"><a href="#">분양</a></li>
				<li class="h_list"><a href="#"><img id="logo"
						src="<%=request.getContextPath()%>/resources/images/logo1.png"></a></li>
				<li class="h_text"><a href="#">알림</a></li>
				<li class="h_text"><a href="<%=request.getContextPath()%>/mypage/mypage">마이페이지</a></li>
			</ul>
			<c:if test="${ empty sessionScope.loginUser}"> 
            		<div class="login"><a href="#">로그인</a></div>

            </c:if>
			<div class="login"><a href="#">로그인</a></div>
		</div>
		
	</div>
	
	<script>
	</script>
</body>
</html>