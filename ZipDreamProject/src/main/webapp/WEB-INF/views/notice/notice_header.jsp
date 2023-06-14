<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.listWrap>div {
	font-size: 25px;
	width: 500px;
	height: 70px;
	text-align: center;
	line-height: 70px;
	color: gray;
	border: 1px solid lightgray;
}

.listWrap {
	margin-top: 30px;
	justify-content: center;
	height: 70px;
	display: flex;
	width: 100%;
}

.list>a {
	text-decoration-line: none;
	color: gray;
}

.list>a:hover {
	text-decoration-line: none;
	color: white;
}

.list:hover {
	background-color: black;
}

.noticeHeaderTitle {
	text-align: center;
	font-size: 46px;
	margin-top: 20px;
	font-weight: 700;
	margin-block-start: 0.67em;
	margin-block-end: 0.67em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}
</style>

<body>
	<jsp:include page="../common/header.jsp" />
	<div class="noticeHeaderTitle">알림</div>
	<div class="listWrap">
		<div class="list">
			<a href="<%=request.getContextPath()%>/notice/manage">운영 알림</a>
		</div>
		<div class="list">
			<a href="<%=request.getContextPath()%>/notice/interest">관심 분양 알림</a>
		</div>

	</div>
</body>


<script>
	// 클릭 css
	let pathName = window.location.pathname;
	let pathArray = pathName.split("/");

	let index = 0;
	switch (menuPathName = pathArray[3]) {
	case "manage":
		index = 0;
		break;
	case "interest":
		index = 1;
		break;
	}

	let menu = $('.list').eq(index);

	menu.addClass("clicked");
	menu.css('background-color', 'black');
	menu.children()[0].style.color = '#FFFFFF';
</script>