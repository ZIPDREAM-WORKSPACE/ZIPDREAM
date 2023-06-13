<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pi" value="${map.pi }"/>
<c:set var="couponList" value="${map.couponList }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.recentContent {
	width: 100%;

	min-height: 450px;

}

.recentContent>div {
	display: flex;
	flex-direction: column;
	min-height: 400px;
	/* 	padding: 50px 10px 150px; */
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding-left: 50px;
	padding-right: 50px;
}

.emptyContent {
	flex: 0 0 auto;
	padding: 100px 0px 50px;
}

.emptyContent>p {
	color: rgb(174, 174, 174);
	font-size: 16px;
	font-weight: 400;
	line-height: 24px;
	text-align: center;
}

.sliderinfor {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	margin-bottom: 20px;
}

.sliderinfor>p {
	color: rgb(174, 174, 174);
	font-size: 14px;
	font-weight: 400;
	line-height: 20px;
}

.card {
	background-color: #fff;
	border: 1px solid #ededed;
	box-shadow: 0 2px 12px 0 #ededed;
	border-radius: 10px;

}

.card-body {
	text-align: center;
}

.card-title {
	font-weight: 700;
}

.card-text {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	font-size: 13px;
	margin-bottom: 0px;
}

.paging {
	display: flex;
	flex-direction: column;
	width: 1200px;
	margin: 0px auto;
	align-items: center;
}

.btnArea {
	align-items: center;
	text-align: center;
}

#useBtn {
	border-color: #09addb;
	background-color: #09addb;
	padding: 10px 20px;
	line-height: 10px;
	font-size: 17px;
	min-height: 40px;
	margin-top: 20px;
	width: 100%;
}

.pagination {
	justify-content: center;
	margin-top: 30px;
}

.card-img-top {
	height: 200px;
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
	/* display: none; */
}

#modal-dialog {
	width: 400px;
	height: 450px;
	padding: 30px 30px;
	margin: 0 auto;
	border: 1px solid #777;
	background-color: #fff;
	border-radius: 20px;
}

.modalContent {
	width: 100%;
}

.modalHeader {
	text-align: center;
	border-bottom: 1px solid #777;;
}

.modalHeader>h4 {
	font-size: 24px;
	font-weight: 600;
}

.modalHeader>div {
	font-size: 20px;
	font-weight: 500;
	margin-bottom: 10px;
}

.modalBody {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100%;
	overflow: auto;
}

.modalBody>div {
	margin-top: 10px;
	text-align: center;
	font-weight: 500;
}

.modalBody>input {
	width: 90%;
	margin-top: 20px;
}

.modalHeader>img {
	width: 200px;
}

.btnArea {
	margin: 30px 0px;
	display: flex;
	align-items: center;
	justify-content: space-evenly;

}
</style>
</head>
<body>

	<jsp:include page="mypage.jsp" />


	<div class="recentContent">
		<div>
			<!-- 쿠폰이 없을 경우 -->
			<c:if test="${empty couponList}">
				<div class="emptyContent">
					<p>발급된 쿠폰이 없습니다.</p>
				</div>
			</c:if>
			<c:if test="${!empty couponList }">
				<div class="recentRoomList">
					<div class="row row-cols-1 row-cols-md-4 g-4">
						<c:forEach items="${couponList }" var="coupon">
							<div class="col">
								<div class="card h-100" data-couponno="${coupon.couponNo }">
									<img src="<%=request.getContextPath() %>${coupon.couponPath }" class="card-img-top">
									<div class="card-body">
										<h5 class="card-title">${coupon.couponTitle }</h5>
										<p class="card-text">${coupon.couponContent }</p>
										<div class="d-grid gap-2">
											<button class="btn btn-primary" id="useBtn" type="button" onclick="showModal('${coupon.couponNo }','${coupon.couponPath }','${coupon.couponTitle }','${coupon.couponContent }');">사용하기</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>

			<!-- 페이지네이션 구현 -->
			<c:set var="url" value="/zipdream/mypage/couponlist?cpage=" />
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
						<li class="page-item"><a class="page-link"
							href="${url}${item }">${item }</a></li>
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

	<!-- 모달 창  -->
	<div id="modalWrap" tabindex="-1">
		<div id="modal-dialog">
			<div class="modalContent">
				<div class="modalHeader">
					<!-- <img src="resource/img/20off.png" />
					<h4>쿠폰제목</h4>
					<div>쿠폰내용</div> -->
				</div>
				<div class="modalBody">
					<div>
						쿠폰을 사용하실 경우<br>담당 공인중개사의 아이디를 입력해주세요.
					</div>
					<input type="text">
				</div>
				<div class="btnArea">
					<button class="btn btn-secondary bb" type="button" id="cancel">취소</button>
					<button class="btn btn-outline-primary bb" type="button" id="use">사용하기</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		const modal = document.getElementById('modalWrap');
		var html = "";
		const pathname = "/" + window.location.pathname.split("/")[1] + "/";
		const origin = window.location.origin;

		const contextPath = origin + pathname;
		function showModal(no, path, title, content) {
			/* console.log(no + path + title + content); */
			modal.style.display = 'block';
			
			html = "<img src='"+ contextPath + path + "'/><h4>" + title + "</h4><div>" + content + "</div>";
			
			$(".modalHeader").html(html);
			$(".btn").attr("value", no);
		}
		
		$(document).mouseup(function (e){
			if($("#modalWrap").has(e.target).length === 0){
				$("#modalWrap").hide();
			}
		});
		
		$(function(){
			$(".bb").on("click", function(e){
				/* console.log(e.target.id); */
				$("#modalWrap").hide();
				if(e.target.id == "use"){
					let couponNo = e.target.value;
					let userNo = "${loginUser.userNo}";
					swal({
						title:"사용하시겠습니까?",
					 	buttons: ["취소", "삭제"],
					  	buttons: true,
					  	dangerMode: true,
					})
					.then((willDelete) => {
						if(willDelete){
							$.ajax({
								url:"<%=request.getContextPath()%>/myroomsell/deleteuUserCoupon",
								method:"get",
								data:{couponNo, userNo},
								success:function(){
									swal({
										text:"사용완료되었습니다.",
										icon:"success",
										button:"확인"
									}).then(function(){
										location.href = "<%=request.getContextPath()%>/mypage/couponlist";
									})
								},
								error:function(){
									console.log("에러발생");
								}
							})
						}
					})
				}
			})
		});
	</script>

	

	

	<jsp:include page="../common/footer.jsp" />
</body>
</html>