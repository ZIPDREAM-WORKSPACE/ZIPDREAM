<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<style>
	div{
		/* border: 1px solid red; */
	}
	.listWrap>div{
		font-size: 25px;
		width: 350px;
		height: 70px;
		text-align:center;
		line-height:70px;
		color: gray;
		border: 1px solid lightgray;
	}
	.listWrap{
		margin-top:30px;
		height: 70px;
		display: flex;
		justify-content: center;
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
<body>

	<jsp:include page="../../views/common/header.jsp" />
	
	
	<div style="text-align: center; font-size: 40px; margin-top: 20px;">공인중개사 페이지</div>	
	<div class="listWrap">
		<div class="list"><a href="<%=request.getContextPath()%>/agent/list">등록한 매물</a></div>
		<div class="list"><a href="<%=request.getContextPath()%>/agent/apply">매물신청 리스트</a></div>
		<div class="list"><a href="<%=request.getContextPath()%>/agent/counsel">상담신청 리스트</a></div>
		<div class="list"><a href="<%=request.getContextPath()%>/agent/mypage">내 정보</a></div>
	</div>
	
	
	

</body>
</html>