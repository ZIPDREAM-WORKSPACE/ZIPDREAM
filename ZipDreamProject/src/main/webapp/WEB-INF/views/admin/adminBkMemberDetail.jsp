<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
	<section class="content-section">
		<div class="content-title">
			<h1>공인중개사 승인</h1>
		</div>
		<div class="content-bk-title">
			<input id="bk-userNo" type="hidden" value="${member.userNo }">	
			<h2 class="bk-userName">${member.userName}</h2>
			<div class="bk-enrollDateTime">${member.enrollDateTime}</div>
			<button class="btn btn-lg btn-primary">승인</button>
			<button class="btn btn-lg btn-danger">거절</button>
		</div>
		<div style="object-fit:contain;">
			<div id="bk-img-slick">
				<div id="bk-img0" class="bk-images" style="background-image: url('<%=request.getContextPath() %>${attachment[0].filePath.replace('\\','/')}${attachment[0].changeName}')"></div>
				<div id="bk-img1" class="bk-images" style="background-image: url('<%=request.getContextPath() %>${attachment[1].filePath.replace('\\','/')}${attachment[1].changeName}')"></div>
				<div id="bk-img2" class="bk-images" style="background-image: url('<%=request.getContextPath() %>${attachment[2].filePath.replace('\\','/')}${attachment[2].changeName}')"></div>
			</div>
		</div>
		<div class="bk-info-1">
			<p>공인중개사 이름</p>
			<p>주소</p>
			<input type="text" value="${member.office}" readonly>
			<input type="text" value="${member.address}" readonly>	
			<p>아이디</p>
			<p>핸드폰 번호</p>	
			<input type="text" value="${member.userId }" readonly>
			<input type="text" value="${member.phone }" readonly>
		</div>
	</section>
	
	<section class="content-side">
		<div id="bk-list-slick">
			<c:forEach items="${list}" var="user">
				<div>
					<div class="content-main-apply-item bk-user-list" data-uno="${user.userNo}">
						<div class="apply-item-wrap" style="margin:0px;">
							<div class="apply-item-circle"></div>
							<div class="apply-item-line" style="height:50px;"></div>
						</div>
						<div style="margin-top: 10px;">
							<h5>${user.userName }</h5>
							<p class="text-gray">${user.applyDateTime }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</section>

<script>
$(function() {
	$('#bk-img-slick').slick({
		slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
		infinite : true, //무한 반복 옵션	 
		slidesToShow : 1, // 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
		speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, // 옆으로 이동하는 화살표 표시 여부
		dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
		autoplay : false, // 자동 스크롤 사용 여부
		autoplaySpeed : 3000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : false, // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false, // 세로 방향 슬라이드 옵션
		prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-next'>Next</button>",	 	// 다음 화살표 모양 설정
		draggable : true, //드래그 가능 여부 
	});
	
	$('#bk-list-slick').slick({
		slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
		infinite : true, //무한 반복 옵션	 
		slidesToShow : 10, // 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
		speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : false, // 옆으로 이동하는 화살표 표시 여부
		dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
		autoplay : false, // 자동 스크롤 사용 여부
		autoplaySpeed : 3000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : false, // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : true, // 세로 방향 슬라이드 옵션
		verticalSwiping: true,
		draggable : true //드래그 가능 여부 
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />