<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pi" value="${map.pi }" />
<c:set var="myroomsellList" value="${map.myroomsellList }"/>
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
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
    padding-left: 45px;
    padding-right: 45px;
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
.pagination{
	justify-content: center;
 	margin-top: 30px;
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
								<td><button type="button" class="btn btn-outline-primary" id="wating">대기</button></td>
							</c:if>
							<c:if test="${myroom.status == 2}">
								<td><button type="button" class="btn btn-secondary" id="approve">승인</button></td>
							</c:if>
							<c:if test="${myroom.status == 3}">
								<td><button type="button" class="btn btn-danger" id="refuse"  value="${myroom.userSrNo }">거절</button></td>

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
			
			<!-- 페이지네이션 구현 -->
			<c:set var="url" value="/zipdream/mypage/myroomlist?cpage="/>
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">

							<li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${url}${pi.currentPage -1 }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>

						</c:otherwise>
					</c:choose>

					<c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
						<li class="page-item"><a class="page-link" href="${url}${item }">${item }</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${url}${pi.currentPage + 1 }" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>

						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			
		</div>
	</div>
	
	<script>
		$(function(){
			$(".btn").on("click", function(e){
				console.log(e.target.id);
				if(e.target.id == "wating"){
					swal({
						  text: "승인대기 중입니다.",
						  icon: "info",
						  button: "확인",
						});
				}else if(e.target.id == "approve"){
					swal({
						text:"승인완료된 매물입니다.",
						icon:"success",
						button:"확인"
					});
				}else if(e.target.id == "refuse"){
					let userSrNo = e.target.value;
					swal({
						  title: "삭제하시겠습니까?",
						  text: "공인중개사로부터 승인거절당한 매물입니다. 해당 매물 정보를 삭제하시겠습니까?",
						  icon: "warning",
						  buttons: ["취소", "삭제"],
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
						    $.ajax({
						    	url:"<%=request.getContextPath()%>/myroomsell/deletemyroom",
						    	method:"get",
						    	data:{userSrNo},
						    	success:function(){
						    		swal({
										text:"삭제완료되었습니다",
										icon:"success",
										button:"확인"
									}).then(function(){
										location.href = "<%=request.getContextPath()%>/mypage/myroomlist";
									});
						    	},
						    	error:function(){
						    		console.log("에러발생");
						    	}
						    });
						};
					})
				}	
			})
		});
	</script>



	<jsp:include page="../common/footer.jsp" />
</body>
</html>