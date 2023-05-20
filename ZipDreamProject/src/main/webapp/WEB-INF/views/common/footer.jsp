<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zipdream</title>
<style>
.footer {
	width: 100%;
	height: 200px;
	background: #171F45;
	position: relative;
}

.footer_inner {
	width: 60%;
	height: 80%;
	margin-left: 20%;
	margin-right: 20%;
	position: absolute;
	top:10%;
}

.footer_inner>ul {
	padding: 0px;
}

.footer_list {
	width: 90%;
	display: flex;
	list-style: none;
}

.f_text>a {
	text-decoration-line: none;
}

#chat_btn {
	width: 60px;
}

#q_btn {
	width: 90px;
}

.btn_inner {
	height: 30px;
	background: #515151;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.footer a {
	text-decoration-line: none;
	color: white;
	font-size: 0.6vw;
	
}

.btn {
	display: flex;
	margin-top: 8px;
	margin-bottom: 8px;
}

.footer>* {
	font-size: 0.6vw;
	color: white;
}
#top_logo{
	width:1.6vw;
	height:1vw;
	min-width:24px;
	min-height:15px;
	position:absolute;
	right:10px;
	top: 10px;
	
}
</style>
</head>
<body>
	<div class="footer">
		<div class="footer_inner">
			<ul class="footer_list">
				<li class="f_text"><a href="#">회사소개&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
				<li class="f_text"><a href="#">이용약관&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
				<li class="f_text"><a href="#">개인정보처리방침&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
				<li class="f_text"><a href="#">매물관리규정</a></li>
			</ul>
			<div>
				(주)내집마련<br>주소 : 서울시 강남구 테헤란로 14길 6 남도빌딩
			</div>
			<div class="btn">
				<span class="btn_inner" id="chat_btn"><a href="#">1:1문의</a></span>&nbsp;
				<span class="btn_inner" id="q_btn"><a href="#">자주묻는 질문</a></span>
			</div>
			<div>KH, Inc. All rights reserved.</div>
			<div><a href="javascript:window.scrollTo(0,0);"><img id="top_logo" src="<%=request.getContextPath()%>/resources/images/top.png"></a></div>
		</div>
	</div>
</body>
</html>