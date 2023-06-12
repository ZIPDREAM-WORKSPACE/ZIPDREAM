<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="list" value="${map.list}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록한 매물 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.myRoomListWrap {
	width: 100%;
	margin-bottom: 180px;
}

.myRoomListWrap>div {
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
	padding-left: 45px;
	padding-right: 45px;
}

.head_button {
	display: flex;
	width: 100%;
	margin-bottom: 20px;
	justify-content: flex-end;
	margin-bottom: 20px;
}

.agentListHeader {
	margin-top: 20px;
	display: flex;
	justify-content: center;
}

.registration {
	width: 150px;
	height: 3rem;
	background-color: white;
	border-radius: 30px;
	margin-left: 25px;
}

.myroomsellList {
	width: 100%;
	border-top: 2px solid rgb(23, 31, 69);
	text-align: center;
}

.myroomsellList>thead {
	background-color: #171F45;
	color: white;
	border: 1px solid rgb(237, 237, 237);
}
.myroomsellList>thead th{
	border: 1px solid rgb(237, 237, 237);
}
.myroomsellList>thead tr{
	border: 1px solid rgb(237, 237, 237);
}
.myroomsellList>thead th {
	padding: 17px 0;
	line-height: 2.0rem;
	font-weight: 500;
	letter-spacing: -0.0em;
}

.myroomsellList>tbody {
	color: rgb(23, 31, 69);
	border-bottom: 1px solid rgb(21 27 55/ 13%);
}

.myroomsellList>tbody tr {
	border-bottom: 1px solid rgb(21 27 55/ 13%);
}

.myroomsellList>tbody td {
	padding: 17px 0;
	line-height: 2.0rem;
	letter-spacing: -0.0em;
}

.myRoomList {
	display: flex;
	width: 100%;
	padding-top: 100px;
	padding-bottom: 100px;
	border-bottom: 0.5px solid rgb(23, 31, 69);
	color: rgb(23, 31, 69);
	text-align: center;
	justify-content: center;
	align-items: center;
}

.myRoomList span {
	color: rgb(23, 31, 69);
	font-size: 20px;
	font-weight: 400;
	margin-left: 10px;
}
.myroomsellList>tbody>tr{
	cursor:pointer;
}
</style>
</head>
<body>

	<jsp:include page="agentPage.jsp"/>
	<div class="myRoomListWrap">
		<div>
			<div class="head_button">
				<button type="button" class="registration"><a href="<%=request.getContextPath()%>/sell/insert">매물등록하기</a></button>
			</div>
			<table class="myroomsellList">
				<thead>
					<tr>
						<th id="sellNo">매물번호</th>
						<th id="sellType">매물타입</th>
						<th id="sellName">매물이름(상가명, 아파트명)</th>
						<th id="date">작성날짜</th>
						<th id="count">찜 횟수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty list }">
						<c:forEach items="${list}" var="sell">
									<tr onclick="movePage(${sell.sellNo})">
										<td class="sno">${sell.sellNo}</td>
										<td>${sell.sellType}</td>
										<td>${sell.sellName}</td>
										<td>${sell.createDate} </td>
										<td>22</td>
									</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<c:if test="${empty list}">
				<div class="myRoomList">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
                    	<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                	</svg>
					<span>등록된 게시글이 없습니다.</span>
				</div>
			</c:if>	
		</div>
	</div>
	
	
	<jsp:include page="../../views/common/footer.jsp" />

</body>
<script>
	function movePage(sno){
		location.href="<%=request.getContextPath()%>/sell/detail/"+sno;
	}
</script>
</html>