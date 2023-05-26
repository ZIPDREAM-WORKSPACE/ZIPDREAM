<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<style>
	div{
		/* border: 1px solid red; */
	}
	.listWrap>div{
		font-size: 25px;
		width: 200px;
		height: 70px;
		text-align:center;
		line-height:70px;
		color: gray;
		border: 1px solid lightgray;
	}
	.listWrap{
		margin-top:30px;
		margin-left:24%;
		height: 70px;
		display: flex;
		
	}
	.list>a{
		 text-decoration-line: none;
		 color: gray;
	}
	.list>a:hover{
		text-decoration-line: none;
		color: white;	
	}
	.list:hover{
		background-color: #171F45;
		
	}
	
</style>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<body>
	<jsp:include page="../common/header.jsp" />
	<div style="text-align: center; font-size: 40px; margin-top: 20px;">MY DREAM</div>	
	<div class="listWrap">
		<div class="list"><a href="<%=request.getContextPath()%>/mypage/currentPage">최근 본 방</a></div>
		<div class="list"><a href="#">내 매물</a></div>
		<div class="list"><a href="#">찜하기</a></div>
		<div class="list"><a href="#">내 정보</a></div>
		<div class="list"><a href="<%=request.getContextPath()%>/mypage/couponlist">쿠폰함</a></div>
	</div>
	
</body>
</html>