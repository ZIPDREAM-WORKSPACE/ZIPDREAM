<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="clist" value="${map.clist}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담신청 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.myRoomListWrap {
	width: 100%;
	margin-bottom: 180px;
    margin-top: 40px;
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

.myroomsellList>thead th {
	border: 1px solid rgb(237, 237, 237);
}

.myroomsellList>thead tr {
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

.myroomsellList>tbody>tr {
	cursor: pointer;
}

/*모달창*/
/* modal css */

.modalContent {
	display:flex;
	align-items:center;
	justify-content:center;
	gap:30px;
}

.modalBody {
	max-width: 600px;
}

.modalFooter {
	margin-top: 30px;
}

.modalFooter>.btn {
	width:150px;
}

.modalFooter>.btn-success {
	margin-left: 30px;
}
</style>
</head>
<body>

	<jsp:include page="agentPage.jsp"/>
	
<!-- 	<div class="counselHeader">
		<table border="collapse">
			<thead class="thead">
				<tr>
					<th id="sellNo">매물번호</th>
					<th id="sellType">매물명</th>
					<th id="sellName">신청자 이름</th>
					<th id="date">신청방식</th>
					<th id="count">신청날짜</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr>
					<td>12345678910</td>
					<td>시그니엘</td>
					<td>오현지</td>
					<td>비대면 상담</td>
					<td>2023.05.25</td>
				</tr>
				<tr>
					<td>12345678910</td>
					<td>트리마제</td>
					<td>김예진</td>
					<td>대면상담</td>
					<td>2023.05.18</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div id="modal" class="modal-overlay" style="display: none;">
        <div class="modal-window">
            <div class="counsel radius" >
                <div class="modal_header1">
                    <span>매물상담 수락하기</span>
                </div>
                <div class="modal_header2">
                    <p>공인중개사님이 등록한 매물에 상담을 신청하셨습니다.</p>
                    <p>아래 정보를 확인하시고 상담을 진행하세요.</p>
                </div>
                <hr>
                <div class="modal_body">
                	<p>김예진</p>
                	<p>010-1234-5668</p>
                   <textarea cols="40" rows="5" readonly="readonly" style="resize: none">
                   	날짜는 상관없고 오전에 상담받았으면 좋겠어요
                   </textarea>
                </div>
                <div class="modal_footer">
                    <input type="button" class="close_apply" value="거절하기">
                    <input type="button" class="apply" value="수락하기">
                </div>
            </div>
            <div class="last_counsel radius" style="display:none;">
                <div class="modal_header1">
                    <span>상담 수락 완료</span>
                </div>
                <div class="modal_header2">
                    <p>신청자번호를 확인하고 컨텍을 진행하세요</p>
                </div>
                <hr>
                <div class="modal_body">
                	<p>김예진</p>
                	<p>010-1234-5668</p>
                </div>
                <div class="modal_footer">
                    <input type="button" class="close_apply" value="닫기">
                </div>
            </div>
        </div>
    </div> -->
    
    
    <div class="myRoomListWrap">
		<div>
			<table class="myroomsellList">
				<thead>
					<tr>
						<th id="sellNo">매물번호</th>
						<th id="sellType">매물명</th>
						<th id="sellName">신청자 이름</th>
						<th id="sellPhone">신청자번호</th>
						<th id="date">신청방식</th>
						<th id="accept">수락여부</th>
						<th id="count">신청날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty clist}">
						<c:forEach items="${clist}" var="c">
							
							<tr class="cList" onclick="acceptModal(${c.sellNo});" data-sellNo="${c.sellNo}" data-refUno="${c.refUno}" data-content="${c.counsleContent }" data-method="${c.counsleMethod}">
								<td>${c.sellNo}</td>
								<td>${c.sellName}</td>
								<td>${c.userName}</td>
								<td>010-1234-5678</td>
								<td>
									<c:if test="${c.counsleMethod==1}">대면상담</c:if>
									<c:if test="${c.counsleMethod==2}">비대면상담</c:if>
								</td>
								<td>
									<c:if test="${c.accept == 'N' }">대기</c:if>
									<c:if test="${c.accept == 'O' }">수락</c:if>
									<c:if test="${c.accept == 'X'}">거절</c:if>
								</td>
								<td>${c.applyDate }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>

			<!-- 상담 신청이 없을때 -->
			
			<!-- <div class="myRoomList">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
					fill="currentColor" class="bi bi-exclamation-circle-fill"
					viewBox="0 0 16 16">
                    	<path
						d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                	</svg>
				<span>등록된 게시글이 없습니다.</span>
			</div> -->

		</div>
	</div>
    
       <div class="modal fade" id="reportInsertModal" tabindex="-1" aria-labelledby="reportInsertModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">상담수락하기</h5>
					
						<button type="button" class="btn-close" onclick="$('#reportInsertModal').modal('hide');"
							aria-label="Close"
							style="border: none; background: white; font-size: 20px;">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" align="center">
						<h3>매물상담 수락하기</h3>
						<p>공인중개사님이 등록한 매물에 상담을 신청하셨습니다.</p>
							<textarea rows="3" cols="80" class="reportContent" style="resize: none;"></textarea>
						</div>
						<div class="modal-footer">
							<button onclick="applyCounsle();" class="apply btn btn-success" >수락하기</button>
							<button onclick="xCounsle();"class="btn btn-primary Xcounsle">거절하기</button>
	      				</div>
				</div>
			</div>
		</div>   
    
    
    
    <jsp:include page="../../views/common/footer.jsp" />
    <script src="<%=request.getContextPath()%>/resources/js/chat/noticeChat.js"></script>
</body>
<script>
	refUno = 0; 
	sellNo = 0;
	method = 0;
	let houseSock = new SockJS("<%=request.getContextPath()%>/notice"); 
	function acceptModal(sno){
		$("#reportInsertModal").modal("show");
		let currentList = $(".cList[data-sellNo="+ sno +"]")[0];
		$(".reportContent").val(currentList.dataset.content);
		sellNo = currentList.dataset.sellno;
		refUno = currentList.dataset.refuno;
		method = currentList.dataset.method;
	};

	
	
	function applyCounsle(){
		let refTno = '${loginUser.userNo}';
		$.ajax({
			url : "<%=request.getContextPath()%>/agent/applyCounsle",
			data : {refUno, sellNo, refTno},
			type : "POST",
			success : function(result){
				if(result >= 1){
					console.log("신청상태 수락 완료");
					alert("수락이 완료되었습니다");
					$("#reportInsertModal").modal("hide");
					console.log(refUno);
					sendMessage5(method,refUno);
				}else{
					console.log("불가");
				}
			},
			error : function(){
				console.log("접근실패")
			}
		});
	}
	
	function xCounsle(){
		let refTno = '${loginUser.userNo}';
		$.ajax({
			url : "<%=request.getContextPath()%>/agent/Xcounsle",
			data : {refUno, sellNo, refTno},
			type : "POST",
			success : function(result){
				if(result == 1){
				console.log("신청상태 거절 완료");
				alert("신청 거절 완료");
				$("#reportInsertModal").modal("hide");
				}else{
					console.log("신청상태 거절 실패");
				}
			},
			error :  function(){
				console.log("접근 실패");
			}
		})			
	}
	
	
</script>
</html>