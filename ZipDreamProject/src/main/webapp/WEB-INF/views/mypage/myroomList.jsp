<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.myRoomListWrap {
	width: 100%;
	margin-bottom:50px;
}

.myRoomListWrap>div {
	width: 1000px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
}

.myRoomListWrap>div>ul {
	width: 100%;
	margin: 20px 0px 0px;
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
   	display:flex;
    width: 100%;
    padding-top: 100px;
    padding-bottom: 100px;
    border-bottom: 0.5px solid rgb(23, 31, 69);
    color:rgb(23, 31, 69);
    text-align:center;
    justify-content: center;
    align-items: center;
}

.myRoomList span {
    color: rgb(23, 31, 69);
    font-size: 20px;
    font-weight: 400;
    margin-left:10px;
}

.myRoomInsert {
	display: flex;
	width: 100%;
    margin-bottom: 20px;
    justify-content: flex-end;
}
.myroomsellList{
	width:100%;
	border-top: 2px solid rgb(23, 31, 69);
    color: #2a2a2a;
    text-align:center;
}
.myroomsellList>thead{
	background-color: #fcfcfe;
    border-bottom: 1px solid #dbe3f1;
}
.myroomsellList>thead th{
    padding: 17px 0;
    line-height: 2.0rem;
    font-weight: 500;
    letter-spacing: -0.0em;
}
.myroomsellList>tbody{
    border-bottom: 1px solid rgb(21 27 55 / 13%);
}

.myroomsellList>tbody tr{
    border-bottom: 1px solid rgb(21 27 55 / 13%);
}

.myroomsellList>tbody td{
 	padding: 17px 0;
    line-height: 2.0rem;
    letter-spacing: -0.0em;

}
.approve{
	color: rgb(255, 255, 255);
    font-size: 15px;
    font-weight: 400;
    width: 62px;
    height: 28px;
    margin: 0px auto;
    line-height: 28px;
    border-radius: 2px;
    background-color: rgb(22, 107, 229);
}
.refuse{
    font-size: 15px;
    font-weight: 400;
    width: 62px;
    height: 28px;
    margin: 0px auto;
    line-height: 28px;
    border-radius: 2px;
    color: #E45A64;
	border: 1px solid #E45A64;
}
.wating{
	font-size: 15px;
    font-weight: 400;
    width: 62px;
    height: 28px;
    margin: 0px auto;
    line-height: 28px;
    border-radius: 2px;
    color: #326CF9;
	border: 1px solid #326CF9;

}
</style>
</head>
<body>
	<jsp:include page="mypage.jsp" />

	<div class="myRoomListWrap">
		<div>
			<ul>

				<li>· 대기 : 내가 등록한 매물이 공인중개사에게 신청되어 승인을 기다리고 있는 상태</li>
				<li>· 승인 : 내가 등록한 매물이 공인중개사에게 승인된 상태</li>
				<li>· 거절 : 공인중개사가 해당 매물에 대한 승인을 거절한 상태</li>

			</ul>
			<div class="myRoomInsert">
				<button class="btn btn-outline-dark" type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/myroominsert'">방 내놓기</button>
			</div>
			<table class="myroomsellList">
				<thead>
					<tr>
						<th>매물종류</th>
						<th>건물종류</th>
						<th>주소</th>
						<th>거래종류</th>
						<th>진행사항</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${myroomsellList }" var="myroom">
						<tr>
							<td>${myroom.roomType}</td>
							<td>${myroom.buildingType}</td>
							<td>${myroom.address }</td>
							<td>${myroom.dealType}</td>
							<c:if test="${myroom.status == 1}">

								<td><p class="wating">대기</p></td>
							</c:if>
							<c:if test="${myroom.status == 2}">
								<td><p class="approve">승인</p></td>
							</c:if>
							<c:if test="${myroom.status == 3}">
								<td class="refuse">거절</td>

							</c:if>
						</tr>
					</c:forEach>
				</tbody>	
			</table>
			<c:if test="${ empty myroomsellList}">
				<div class="myRoomList">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
					  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
					</svg>
					<span>등록된 매물이 없습니다.</span>
				</div>
			</c:if>
			
		</div>
	</div>



	<jsp:include page="../common/footer.jsp" />
</body>
</html>