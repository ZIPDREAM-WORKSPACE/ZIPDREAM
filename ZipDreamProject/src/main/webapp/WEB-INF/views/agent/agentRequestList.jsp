<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pi" value="${map.pi }" />
<c:set var="requestList" value="${map.requestList }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.requestListWrap {
	width: 100%;
	margin-bottom: 50px;
}

.requestListWrap>div {
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
	padding-left: 50px;
	padding-right: 50px;
    margin-top: 50px;
}

.noRequest {
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

.noRequest span {
	color: rgb(23, 31, 69);
	font-size: 20px;
	font-weight: 400;
	margin-left: 10px;
}

.requestTable {
	width: 100%;
	border-top: 2px solid rgb(23, 31, 69);
	color: #2a2a2a;
	text-align: center;
}

.requestTable>thead {
	background-color: #fcfcfe;
	border-bottom: 1px solid #dbe3f1;
}

.requestTable>thead th {
	padding: 17px 0;
	line-height: 2.0rem;
	font-weight: 500;
	letter-spacing: -0.0em;
}

.requestTable>tbody {
	border-bottom: 1px solid rgb(21 27 55/ 13%);
}

.requestTable>tbody tr {
	border-bottom: 1px solid rgb(21 27 55/ 13%);
}

.requestTable>tbody td {
	padding: 17px 0;
	line-height: 2.0rem;
	letter-spacing: -0.0em;
}

.pagination {
	justify-content: center;
	margin-top: 30px;
}

#modalWrap {
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	display: none;
}

#modal-dialog {
	width: 600px;
	height: 500px;
	padding: 30px 30px;
	margin: 0 auto;
	border: 1px solid #777;
	background-color: #fff;
	border-radius: 20px;
}

.modalContent {
	width: 100%;
	/* background-color: #1f306b4d;       */
}

.modalHeader {
	text-align: center;
	border-bottom: 1px solid #777;;
}

.modalHeader>h4 {
	font-size: 24px;
	font-weight: 600;
}

.modalHeader div {
	font-size: 13px;
}

.modalBody {
	height: 100%;
	overflow: auto;
}

table.type05 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.type05 th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: middle;
	border-bottom: 1px solid #ccc;
	background: #efefef;
}

table.type05 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
/* 	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis; */
}
</style>
</head>
<body>

	<jsp:include page="agentPage.jsp"/>
	
	<div class="requestListWrap">
		<div>
			<table class="requestTable">
				<thead>
					<tr>
						<th>매물종류</th>
						<th>건물유형</th>
						<th>매물 위치 정보</th>
						<th>거래종류</th>
						<th>신청자 이름</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestList }" var="request">
						<tr >
							<td style="display:none;">${request.userSrNo }</td>
							<td>${request.roomType }</td>
							<td>${request.buildingType }</td>
							<td>${request.address }</td>
							<td>${request.dealType }</td>
							<td>${request.userName }</td>
							<c:if test="${request.status == 1}">
								<td><button type="button" class="btn btn-outline-primary" id="wating" value="대기">대기<input type="hidden" value="${request.userSrNo }"/></button></td>
							</c:if>
							<c:if test="${request.status == 2}">
								<td><button type="button" class="btn btn-secondary" id="approve" value="승인">승인</button></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${ empty requestList}">
					<div class="noRequest">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
						  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
						</svg>
						<span>등록 요청된 매물이 없습니다.</span>
					</div>
			</c:if>
			
			<!-- 페이지네이션 구현 -->
			<c:set var="url" value="/zipdream/agent/apply?cpage=" />
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
	
							<li class="page-item disabled"><a class="page-link" href="#"
								aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${url}${pi.currentPage -1 }" aria-label="Previous"><span
									aria-hidden="true">&laquo;</span></a></li>
	
						</c:otherwise>
					</c:choose>
	
					<c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
						<li class="page-item"><a class="page-link"
							href="${url}${item }">${item }</a></li>
					</c:forEach>
	
					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#"
								aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="" aria-label="Next"><span
									aria-hidden="true">&raquo;</span></a></li>
	
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 모달 창  -->
	<div id="modalWrap" tabindex="-1">
	    <div id="modal-dialog"> 
            <div class="modalContent">
                <div class="modalHeader">
                    <h4>매물 신청 수락하기</h4>
                    <div>공인중개사님에게  매물등록요청이 왔습니다.<br>아래사항을 확인해 매물을 등록해주세요</div>
                </div> 
                <div class="modalBody">
                	<form action="<%=request.getContextPath() %>/agent/updateMs" method="post">
                    	<table class="type05"></table>
		                <div class="d-grid gap-2 d-md-flex justify-content-md-center">
		                    <button class="btn btn-outline-secondary" type="submit" name ="status" value="3" style="margin-right: 30px; margin-left: 30px;">거절하기</button>
		                    <button id="requestSubmit" class="btn btn-outline-primary" type="submit" name ="status" value="2"  >수락하기</button>
		                </div> 
                	</form>
                </div>
            </div>
	    </div>
	</div>


	<jsp:include page="../../views/common/footer.jsp" />

</body>

<script>
let houseSock = new SockJS("<%=request.getContextPath()%>/notice"); 
	const modal = document.getElementById('modalWrap');


	$(function(){
		$(".btn").on("click", function(e){
			/* console.log(e.target.value); */
			if(e.target.value == "대기"){
				modal.style.display = 'block';
				
				let userSrNo = $(e.target).children().eq(0).val();
				/* 해당 신청매물에 대한 회원정보 가져오기 */
				$.ajax({
					url:"<%=request.getContextPath()%>/agent/userInfo",
					method:"get",
					data:{userSrNo},
					success:function(result){
						var html = "";
						if(result != null){
							html = "<tr><th scope='row'>매물종류</th>";
							html += "<td>" + result.roomType + "</td></tr>";
							html += "<tr><th scop='row'>건물유형</th>";
							html += "<td>" + result.buildingType + "</td></tr>";
							html += "<tr><th scop='row'>위치 정보</th>";
							html += "<td>" + result.address + "</td></tr>";
							html += "<tr><th scop='row'>거래종류</th>";
							html += "<td>" + result.dealType + "</td></tr>";
							html += "<tr><th scop='row' rowsPan='2'>신청자 정보</th>";
							html += "<td>" + result.userName + "</td></tr>";
							html += "<tr><td>" + result.phone + "</td></tr>";
							html += "<input type='hidden' name='userSrNo' value='"+ result.userSrNo +"'/>"
							
						}
						
						$(".type05").html(html);
							
						$("#requestSubmit").click(function(){
							sendMessage4(result.refUno, result.refRuno, result.dealType);
						});
					},
					error:function(){
						consoel.log("에러 발생");
					}
				})
			}else if(e.target.value == "승인"){
				swal("", "이미 승인 완료된 매물입니다.", "info");
			}
			
			
		});
		
		
		$(document).mouseup(function (e){
			if($("#modalWrap").has(e.target).length === 0){
				$("#modalWrap").hide();
			}
		});
		
		
	});
	
</script>
</html>