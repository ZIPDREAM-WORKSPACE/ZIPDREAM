<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.noticeHeader {
	width: 100%;
	flex: 0 0 auto;
}

.noticeHeader>div {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	height: 250px;
	position: relative;
	width: 1000px;
	height: 100%;
	margin: 0px auto;
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
	width: 1000px;
	height: 64px;
	margin: 0px auto;
	list-style: none;
	padding: 0px;
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
	<div class="noticeHeader">
		<div style="height: 250px;">
	<div class="noticeHeaderTitle">알림</div>
	<ul class="listWrap">
		<li class="list"><a href="<%=request.getContextPath()%>/notice/manage">운영 알림</a></li>
		<li class="list"><a href="<%=request.getContextPath()%>/notice/interest">관심 분양 알림</a></li>
	</ul>
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