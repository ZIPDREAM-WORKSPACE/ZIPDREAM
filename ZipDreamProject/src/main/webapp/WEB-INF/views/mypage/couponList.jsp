<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		/* border: 1px solid red; */
	}
	.contentWrap{
		padding-top: 30px;
		width: 100%;
		height: 509px;
	}
	.coupon{
		display: inline-flex;
		width: 200px;
		height: 150px;
		background-color: #e9ecef;
		border-radius: 10px;
		margin: 20px;
	}
	.couponWrap{
		position: absolute;
		left: 460px;
	}
</style>
</head>
<body>
	<jsp:include page="mypage.jsp"/>
	<div class="contentWrap">
		<div class="couponWrap">
			<div class="coupon">
				
			</div>
			<div class="coupon">
				
			</div>
			<div class="coupon">
				
			</div>
			<div class="coupon">
				
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>