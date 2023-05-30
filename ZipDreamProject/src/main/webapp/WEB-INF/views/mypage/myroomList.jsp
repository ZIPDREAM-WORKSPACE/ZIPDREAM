<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.myRoomListWrap {
	width: 100%;
	flex-grow: 1;
}

.myRoomListWrap>div {
	width: 1000px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
}

.myRoomListWrap>div>ul {
	width: 100%;
	margin: 40px 0px 48px;
	padding-left: 10px;
	list-style: none;
}

.myRoomListWrap>div>ul>li {
	font-size: 14px;
	line-height: 24px;
	font-weight: 400;
	color: rgb(101, 101, 101);
	position: relative;
}

.myRoomList {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
	height: 200px;
}

.myRoomList>p {
	font-size: 16px;
	line-height: 26px;
	font-weight: 400;
	color: rgb(34, 34, 34);
}

.myRoomInsert {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
    margin-bottom: 40px;
}
</style>
</head>
<body>
	<jsp:include page="mypage.jsp" />

	<div class="myRoomListWrap">
		<div>
			<ul>
				<li>· 승인중 : 내가 등록한 매물이 공인중개사에게 신청되어 승인을 기다리고 있는 상태</li>
				<li>· 공개중 : 내가 등록한 매물이 승인이 완료되어 공개중인 상태</li>
			</ul>
			<div class="myRoomList">
				<p>등록된 매물이 없습니다.</p>
			</div>
			<div class="mx-auto myRoomInsert">
				<button class="btn btn-outline-dark btn-lg" type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/myroominsert'">방 내놓기</button>
			</div>
		</div>
	</div>



	<jsp:include page="../common/footer.jsp" />
</body>
</html>