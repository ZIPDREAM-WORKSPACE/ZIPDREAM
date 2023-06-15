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
* {
	box-sizing: border-box;
}

.agentpageHeader {
	width: 100%;
	flex: 0 0 auto;
}

.agentpageHeader>div {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	height: 250px;
	position: relative;
	width: 1200px;
	/* height: 100%; */
	margin: 0px auto;
	padding: 0px 10px;
}

.agentpageTitle {
	margin: 80px 0px 64px;
	font-size: 46px;
	line-height: 70px;
	font-weight: 700;
	margin-block-start: 0.67em;
	margin-block-end: 0.67em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.listWrap>li {
	display: list-item;
	color: rgb(174, 174, 174);
	border: 1px solid lightgray;
	flex-grow: 1;
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	border: 0px;
	display: list-item;
}

.listWrap {
	flex: 0 0 auto;
	display: flex;
	width: 1180px;
	height: 64px;
	margin: 0px auto;
	list-style: none;
	padding-right: 40px;
	padding-left: 40px
}

.listWrap>li>a {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
	font-size: 16px;
	line-height: 26px;
	border: 1px solid rgb(237, 237, 237);
	font-weight: 600;
}

.list>a {
	text-decoration-line: none;
	color: rgb(174, 174, 174);
}

.list>a:hover {
	text-decoration-line: none;
	color: white;
}

.list:hover {
	background-color: #171F45;
}
</style>
</head>
<body>

	<jsp:include page="../../views/common/header.jsp" />


	<div class="agentpageHeader">
		<div>
			<div class="agentpageTitle">MY DREAM</div>
			<ul class="listWrap">
				<li class="list"><a href="<%=request.getContextPath()%>/agent/list">등록한 매물</a></li>
				<li class="list"><a href="<%=request.getContextPath()%>/agent/apply">매물신청 리스트</a></li>
				<li class="list"><a href="<%=request.getContextPath()%>/agent/counsel">상담신청 리스트</a></li>
				<li class="list"><a href="<%=request.getContextPath()%>/agent/mypage">내 정보</a></li>
			</ul>
		</div>
	</div>
	

	<script>
		// 클릭 css
		let pathName = window.location.pathname;
		let pathArray = pathName.split("/");

		let index = 0;
		switch (menuPathName = pathArray[3]) {
		case "list":
			index = 0;
			break;
		case "apply":
			index = 1;
			break;
		case "counsel":
			index = 2;
			break;
		case "mypage":
			index = 3;
			break;

		}

		let menu = $('.list').eq(index);

		menu.addClass("clicked");
		menu.css('background-color', '#171F45');
		menu.children()[0].style.color = '#FFFFFF';
	</script>
	

</body>
</html>