<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	height: 450px;
}

.recentContent>div {
	display: flex;
	flex-direction: column;
	min-height: 400px;
	padding: 50px 10px 150px;
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

.usebtn {
	margin: 0 auto;
}

/*모달창*/
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	/* background: rgba( 69, 139, 197, 0.70 ); */
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	width: 700px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
/*모달 css*/
.seller_contect_modal, .seller_contect_modal2, .finish_apply {
	border: 1px solid black;
	width: 70%;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-color: #EEF1FF;
}

.seller_contect_modal {
	height: 26rem;
}

.radius {
	border-radius: 30px;
}

.modal_header1 {
	height: 20%;
	text-align: center;
}

.modal_header1>p {
	font-size: 2rem;
	font-weight: 900;
}

.modal_header2 {
	margin-top: 35px;
	font-size: 0.8rem;
	line-height: 5px;
	height: 15%;
	text-align: center;
}

.modal_body {
	margin-top: 25px;
	height: 25%;
	text-align: center;
	font-weight: 600;
	line-height: 10px;
}

.modal_footer {
	height: 5%;
	margin-top: 25px;
}

.hr {
	width: 350px;
	border: 1px solid gray;
}

.no {
	margin-right: 30px;
}
#useBtn{
    border-color: #09addb;
    background-color: #09addb;
    padding: 10px 20px;
    line-height: 10px;
    font-size: 17px;
    min-height: 40px;
   	margin-top: 20px;
   	width: 100%;
}
</style>
</head>
<body>
	<jsp:include page="mypage.jsp"/>
	<script>
		$(function() {
			console.log('${couponList}');
		});
	</script>
	
	
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
		                      <div class="card h-100">
		                        <img src="<%=request.getContextPath() %>${coupon.couponPath }" class="card-img-top">
		                        <div class="card-body">
		                          	<h5 class="card-title">${coupon.couponTitle }</h5>
		                          	<p class="card-text">${coupon.couponContent }</p>
		                          	<div class="d-grid gap-2">
									  <button class="btn btn-primary" id="useBtn" type="button">사용하기</button>
									</div>
		                        </div>
		                      </div>
		                    </div>
	                	</c:forEach>
	                  </div>
	            </div>
        	</c:if>  
            
        </div>
    </div>
	
	   <div id="modal" class="modal-overlay" style="display:none;">
        <div class="modal-window">
            <div class="seller_contect_modal radius" > 
                <div class="modal_header1">
                    <img src="https://ifh.cc/g/XDbNvq.png" width="80px" height="50px" style="vertical-align: bottom;">
                    <p class="coupon_name">첫 가입 10%할인 쿠폰</p>
                </div>
                <div class="modal_header2">
                    <p>해당 쿠폰을 사용하실 경우,</p>
                    <p>중개보수비용의 10%를 할인받을 수 있습니다.</p>
                <hr class="hr">
                </div>
                <div class="modal_body">
                    <p id="copon_advice">쿠폰 사용을 원하실 경우</p>
                    <p id="copon_advice"">담당 공인중개사의 코드를 입력하고 사용하기를 눌러주세요</p>
                    <input type="text" placeholder="공인중개사 코드 입력" size="20">
                </div>
                <div class="modal_footer">
                    <input type="button" class="no" value="사용안함">
                    <input type="button" class="okay" value="사용하기">
                </div>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
<script type="text/javascript">
$(function(){
	$(".coupon").on("click",function(){
		$(".modal-overlay").show();
	})
	
	$(".no, .okay").on("click", function(){
		$(".modal-overlay").hide();
	})
})
</script>
</html>