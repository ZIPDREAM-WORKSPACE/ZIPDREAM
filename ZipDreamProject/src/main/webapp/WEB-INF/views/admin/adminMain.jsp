<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp" />
<section class="content">
	<div class="content-header">
		<h2>집드림 현황</h2>
		<p>항상 집드림을 위해 일하시는 여러분께 감사드리며 오늘 하루도 화이팅!</p>
	</div>
	<div class="content-view">
		<div class="content-view-item">
			<div class="donut" data-percent="${countNumbers.licenseUserCount.percent}"></div>
			<div>
				<p class="text-gray">공인중개사</p>
				<h4>${countNumbers.licenseUserCount.num}</h4>
			</div>
		</div>
		<div class="content-view-item">
			<div class="donut" data-percent="${countNumbers.userCount.percent}"></div>
			<div>
				<p class="text-gray">사용자</p>
				<h4>${countNumbers.userCount.num}</h4>
			</div>
		</div>
		<div class="content-view-item">
			<div class="donut" data-percent="${countNumbers.objectCount.percent}"></div>
			<div>
				<p class="text-gray">매물</p>
				<h4>${countNumbers.objectCount.num}</h4>
			</div>
		</div>
		<div class="content-view-item">
			<div class="donut" data-percent="${countNumbers.reportCount.percent}"></div>
			<div>
				<p class="text-gray">신고</p>
				<h4>${countNumbers.reportCount.num}</h4>
			</div>
		</div>
		<div class="content-view-item">
			<div class="donut" data-percent="${countNumbers.eventCount.percent}"></div>
			<div>
				<p class="text-gray">이벤트</p>
				<h4>${countNumbers.eventCount.num}</h4>
			</div>
		</div>
	</div>
	<div class="content-main">
		<div class="content-main-report">
			<h3 style="margin: 0px 25px 15px;">신고 현황</h3>
			<table class="rwd-table">
				<tbody>
					<tr>
						<th>신고자</th>
						<th>대상자</th>
						<th>내용</th>
						<th>타입</th>
						<th>처리 여부</th>
						<th>처리 내용</th>
					</tr>
					<tr>
						<td>UPS5005</td>
						<td>UPS</td>
						<td>ASDF19218</td>
						<td>06/25/2016</td>
						<td>12/25/2016</td>
						<td>$8,322.12</td>
					</tr>
					<tr>
						<td>UPS3449</td>
						<td>UPS South Inc.</td>
						<td>ASDF29301</td>
						<td>6/24/2016</td>
						<td>12/25/2016</td>
						<td>$3,255.49</td>
					</tr>
					<tr>
						<td>UPS3449</td>
						<td>UPS South Inc.</td>
						<td>ASDF29301</td>
						<td>6/24/2016</td>
						<td>12/25/2016</td>
						<td>$3,255.49</td>
					</tr>
					<tr>
						<td>UPS3449</td>
						<td>UPS South Inc.</td>
						<td>ASDF29301</td>
						<td>6/24/2016</td>
						<td>12/25/2016</td>
						<td>$3,255.49</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="content-main-event">
			<h3 style="margin: 0px 25px 15px;">현재 진행중 이벤트</h3>
			<table class="rwd-table">
				<tbody>
					<tr>
						<th>이벤트 번호</th>
						<th>카테고리</th>
						<th>이벤트 이름</th>
						<th>이벤트 시작일</th>
						<th>이벤트 종료일</th>
						<th>쿠폰 번호</th>
					</tr>
					<tr>
						<td>UPS5005</td>
						<td>UPS</td>
						<td>ASDF19218</td>
						<td>06/25/2016</td>
						<td>12/25/2016</td>
						<td>$8,322.12</td>
					</tr>
					<tr>
						<td>UPS3449</td>
						<td>UPS South Inc.</td>
						<td>ASDF29301</td>
						<td>6/24/2016</td>
						<td>12/25/2016</td>
						<td>$3,255.49</td>
					</tr>
					<tr>
						<td>UPS3449</td>
						<td>UPS South Inc.</td>
						<td>ASDF29301</td>
						<td>6/24/2016</td>
						<td>12/25/2016</td>
						<td>$3,255.49</td>
					</tr>
					<tr>
						<td>UPS3449</td>
						<td>UPS South Inc.</td>
						<td>ASDF29301</td>
						<td>6/24/2016</td>
						<td>12/25/2016</td>
						<td>$3,255.49</td>
					</tr>
					<tr>
						<td>UPS3449</td>
						<td>UPS South Inc.</td>
						<td>ASDF29301</td>
						<td>6/24/2016</td>
						<td>12/25/2016</td>
						<td>$3,255.49</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="content-main-chat">
			<div style="text-align: center;">
				<b class="content-main-chat-no">${countNumbers.chattingCount.chatRoom}</b> <br> <span
					class="text-gray">현재 채팅 문의</span>
			</div>
			<div style="border-right: 1px solid gray;"></div>
			<div style="text-align: center;">
				<b class="content-main-chat-no">${countNumbers.chattingCount.chattingRoom}</b> <br> <span
					class="text-gray">답변 중인 문의</span>
			</div>
		</div>

		<div class="content-main-apply">
			<h3 style="margin-bottom: 32px;">공인중개사 신청</h3>
			
			<c:forEach var="apply" items="${applyList}">
				<div class="content-main-apply-item">
					<div class="apply-item-wrap">
						<div class="apply-item-circle"></div>
						<div class="apply-item-line"></div>
					</div>
					<div style="margin-top: 10px;">
						<h5>${apply.userName}</h5>
						<p class="text-gray">${apply.applyDateTime}</p>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>

</section>
<script>
	    let donuts = document.getElementsByClassName("donut");
	    
	    function donutAnimation(donut) {
	    	let total = donut.dataset.percent;
	        let number = 0;
	        let donutAnimation = setInterval(() => {
	            donut.dataset.percent = number;
	            if(number >= total){
	            	clearInterval(donutAnimation);	
	            }
	            number = (number+0.1).toFixed(12) * 1;
	            donut.style.background = `conic-gradient(#4F98FF 0 \${number}%, #DEDEDE \${number}% 100% )`;
	        }, 3);
	    }
	
	    for(let i = 0; i < donuts.length; i++){
	        donut = donuts.item(i);
	        donutAnimation(donut);
	    }
	</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />