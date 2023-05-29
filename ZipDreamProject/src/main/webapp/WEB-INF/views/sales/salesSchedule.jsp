<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<style>
* {
	margin: 0;
	padding: 0;
	vertical-align: middle;
}

.sellHouseNavWrap {
	flex: 0 0 auto;
	width: 100%;
	height: 60px;
	z-index: 1;
}

.sellHouseNavi {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
	min-width: 1200px;
	height: 60px;
	background-color: rgb(255, 255, 255);
	box-shadow: rgba(0, 0, 0, 0.2) 0px 3px 1px -2px;
}

.sellHouseNavi>li {
	list-style: none;
	height: 14px;
	padding: 0px 20px;
}

.sellHouseNavi>li>a {
	color: rgb(34, 34, 34);
	font-size: 14px;
	font-weight: 200;
	line-height: 20px;
	outline: none;
	text-decoration: none;
}

.sellHouseNavi>li>a:hover {
	color: #326CF9;
}

.sellHouseTitleWrap {
	display: flex;
	width: 100%;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	height: 100px;
	position: relative;
	box-shadow: rgba(0, 0, 0, 0.2) 0px 3px 1px -2px;
}

.sellHouseTitle {
	color: rgb(34, 34, 34);
	font-size: 33px;
	font-weight: 400;
	line-height: 49px;
}

.sellHouseCalendar {
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
}

.calendar {
	text-align: center;
}

.calendar-yearmonth {
	display: inline-block;
	font-size: 30px;
	font-weight: 300;
	line-height: 45px;
	vertical-align: middle;
	margin: 40px 50px;
}

.calendar-header img {
	width: 30px;
	height: 30px;
	cursor: pointer;
}

.calendar-header {
	vertical-align: middle;
}

#calendar {
	display: flex;
	margin: 0;
	padding: 0px;
	background-color: rgb(248, 248, 248);
	height: 80px;
	text-align: center;
	align-items: center;
	justify-content: space-around;
}

#calendar>table>thead th {
	padding-right: 50px;
}

#calendar>table>tbody td {
	padding-right: 50px;
}

.calendar-day {
	cursor: pointer;
}

.sellHouseListWrap {
	margin-top: 40px;
	margin: 0px auto;
	padding: 0px 10px;
	width: 1200px;
	display: flex;
	justify-content: center;
}

.sellHouseListTable {
	width: 100%;
}

.sellHouseTable {
	width: 100%;
	margin-top: 13px;
	border-top: 1px solid rgb(34, 34, 34);
	border-bottom: 1px solid rgb(231, 231, 231);
	border-collapse: collapse;
	border-spacing: 0px;
}

.sellHouseTable>thead {
	margin: 0px;
	font: inherit;
}

.sellHouseTable>thead th {
	color: rgb(101, 101, 101);
	font-size: 14px;
	font-weight: 400;
	height: 52px;
	line-height: 52px;
	text-align: center;
	background-color: rgb(248, 248, 248);
}

.sellHouseTable>tbody td {
	font-size: 14px;
	font-weight: 400;
	height: 120px;
	vertical-align: middle;
	text-align: center;
	color: rgb(101, 101, 101);
}

.tagAccept {
	font-size: 13px;
	font-weight: 400;
	width: 62px;
	height: 24px;
	margin: 0px auto;
	line-height: 24px;
	border-radius: 2px;
	color: #E45A64;
	border: 1px solid #E45A64;
}

.tagPublish {
	font-size: 13px;
	font-weight: 400;
	width: 62px;
	height: 24px;
	margin: 0px auto;
	line-height: 24px;
	border-radius: 2px;
	color: rgb(34, 34, 34);
	border: 1px solid rgb(34, 34, 34);;
}

.appInfo {
	display: flex;
	flex-grow: 1px;
	flex-direction: column;
	justify-content: center;
	text-align: left;
}

.appInfo>p {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 100%;
	height: 20px;
	line-height: 20px;
}

.appInfoTitle {
	font-weight: 700;
}

.sellHousealarm {
	width: 25px;
	cursor: pointer;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	
	<script>
		$(function(){
			
			/* let today = new Date();
			
			console.log(today); */
			$.ajax({
				url:"<%=request.getContextPath()%>/sales/apiData",
				method:"get",
				/* data:{today}, */
				dataType:"text",
				contentTYpe :"text.plain; charset:UTF-8",
				success:function(result){
					data = JSON.parse(result).data;
					
					resultHtml(data);
				},
				error:function(){
					console.log("에러발생");
				}
			})
		});
		
		function resultHtml(data){
			var html = "<tbody>"
			$.each(data, function(key, value){
				var houseCode = value.HOUSE_MANAGE_NO;
				
				html += "<tr>";
				html += "<td><p class='tagAccept'>접수</p></td>";
				html += "<td><p>" + value.HOUSE_SECD_NM + "</p></td>";
				html += "<td><p>"+value.HOUSE_DTL_SECD_NM + "</p></td>";
				html += "<td><div class='appInfo'><p class='appInfoTitle'><a href='"+value.PBLANC_URL+"'>"+ value.HOUSE_NM + "</a></p>";
				html += "<p class='appLocation'>" + value.HSSPLY_ADRES + "</p>";
				html += "<p class='appDday'>모집공고일 : "+ value.RCRIT_PBLANC_DE +"</p></div></td>";
				let p = aptPrice(houseCode);
				let s = aptSuply(houseCode);
				
				
				html += "<td><p>" + p + "</p></td>";
				html += "<td><p>" + s + "</p></td>";
				html += "<td><p>" + "" + "</p></td>";
				html += "<td><img class='sellHousealarm' src='https://ifh.cc/g/hqaYN5.png'></td></tr>";
			});
			
			html += "</tbody>"
			$(".sellHouseTable").append(html);
		}
		
		/* 아파트 가격 불러오기  */
		function aptPrice(houseCode){
			var aptPrice;
			$.ajax({
				url:"<%=request.getContextPath()%>/sales/houseInfo",
				method:"get",
				async: false,
				data:{houseCode},
				contentType:"text.plain; charset:UTF-8",
				success:function(result){
					/* console.log(result.data[0].LTTOT_TOP_AMOUNT); */
					aptPrice = result.data[0].LTTOT_TOP_AMOUNT;
					/* console.log(value.HOUSE_NM + " 가격은 : "+ aptPrice); */
					
				},
				error:function(){
					cosole.log("에러발생");
				}
			});
			return aptPrice;
		}
		
		function aptSuply(houseCode){
			var aptSuply;
			$.ajax({
				url:"<%=request.getContextPath()%>/sales/houseInfo",
				method:"get",
				ansyc: false,
				data:{housCode},
				contentType:"text.plain; charset:UTF-8",
				success:function(result){
					aptSuply = result.data[0].SPSPLY_HSHLDCO;
				},
				error:function(){
					console.log("에러발생");
				}
			});
			return aptSuply;
		}
	
	</script>
	

	<div class="sellHouseContentWrap">
		<div class="sellHouseNavWrap">
			<ul class="sellHouseNavi">
				<li><a href="<%=request.getContextPath()%>/sales/schedule">분양일정</a></li>
				<li><a>|</a></li>
				<li><a href="<%=request.getContextPath()%>/sales/guide">분양가이드</a></li>
			</ul>
		</div>
		<div class="sellHouseTitleWrap">
			<h1 class="sellHouseTitle">분양일정</h1>
		</div>
		<div style="margin-bottom: 100px;">
			<div class="sellHouseCalendar">
				<div class="calendar month">
					<div class="calendar-header">
						<!-- calendar-prev 클릭시 이전주로 이동 -->
						<span class="calendar-prev"><img
							src="https://ifh.cc/g/sjwW64.png"></span> <span
							class="calendar-yearmonth"> <!-- 여기는 오늘이 있는 연도와 월 표시-->

						</span>
						<!-- calendar-next 클릭시 다음주로 이동 -->
						<span class="calendar-next"><img
							src="https://ifh.cc/g/F1V8zo.png"></span>
					</div>
					<div id="calendar">
						<!-- 여기는 오늘이 포함된 이번주의 날짜들과 요일들이 표시 -->

					</div>
				</div>
			</div>
			<div class="sellHouseListWrap">
				<div class="sellHouseListTable">
					<table class="sellHouseTable">
						<thead>
							<tr>
								<th>단계</th>
								<th>건물유형</th>
								<th>공급유형</th>
								<th style="width: 200px; text-align: left;">단지명/위치</th>
								<th>분양가(단위:만원)</th>
								<th>세대수</th>
								<th>전용면적</th>
								<th>찜하기</th>
							</tr>
						</thead>
						<!-- <tbody>
							<tr>
								<td><p class="tagAccept">접수</p></td>
								<td><p>아파트</p></td>
								<td><p>민간유형</p></td>
								<td>
									<div class="appInfo">
										<p class="appInfoTitle">시흥 센터럴헤센</p>
										<p class="appLocation">경기도 시흥시 월곶동</p>
										<p class="appDday">23.05.16 1순위 청약</p>
									</div>
								</td>
								<td><p>4억</p></td>
								<td><p>38세대</p></td>
								<td><p>59m²/84m²</p></td>
								<td><img class="sellHousealarm"
									src="https://ifh.cc/g/bNnQCj.png"></td>
							</tr>
							<tr>
								<td><p class="tagPublish">발표</p></td>
								<td><p>아파트</p></td>
								<td><p>민간유형</p></td>
								<td>
									<div class="appInfo">
										<p class="appInfoTitle">시흥 센터럴헤센</p>
										<p class="appLocation">경기도 시흥시 월곶동</p>
										<p class="appDday">23.05.16 1순위 청약</p>
									</div>
								</td>
								<td><p>4억</p></td>
								<td><p>38세대</p></td>
								<td><p>59m²/84m²</p></td>
								<td><img class="sellHousealarm"
									src="https://ifh.cc/g/hqaYN5.png"></td>
							</tr>
						</tbody> -->
					</table>
				</div>


			</div>
		</div>
	</div>



	<!-- 주간 캘린더 날짜 생성 함수 -->
	<script>
		// 이전 주로 이동하는 함수
		function goToPreviousWeek() {
			var today = new Date();
			today.setDate(today.getDate() - 7);
			generateWeeklyCalendar(today);
		}

		// 다음 주로 이동하는 함수
		function goToNextWeek() {
			var today = new Date();
			today.setDate(today.getDate() + 7);
			generateWeeklyCalendar(today);
		}

		// 주간 캘린더 날짜 생성 함수
		function generateWeeklyCalendar(today) {
			// 오늘 날짜가 주어지지 않은 경우, 기본적으로 현재 날짜 사용
			if (!today) {
				today = new Date();
			}

			// calendar 요소 선택
			var calendarElement = document.getElementById("calendar");

			// 이번주의 첫 번째 날짜를 계산
			var firstDayOfWeek = new Date(today.getFullYear(),
					today.getMonth(), today.getDate() - today.getDay());

			// 날짜와 요일을 표시할 HTML 문자열
			var html = "";

			// 요일 문자열 배열
			var weekdays = [ "일", "월", "화", "수", "목", "금", "토" ];

			// 이번주의 날짜와 요일 생성
			for (var i = 0; i < 7; i++) {
				var currentDate = new Date(firstDayOfWeek.getFullYear(),
						firstDayOfWeek.getMonth(), firstDayOfWeek.getDate() + i);
				var day = currentDate.getDate();
				var weekday = weekdays[currentDate.getDay()];

				// 오늘인 경우 'today' 클래스 추가 및 '오늘' 텍스트와 파란색 스타일 적용
				var dayClass = "";
				var dayText = day;
				var dayStyle = "";
				// if (currentDate.toDateString() === today.toDateString()) {
				//     dayClass = "today";
				//     dayStyle = "color: blue;";
				// }

				// 날짜와 요일을 HTML 문자열에 추가
				html += "<div class='calendar-day " + dayClass + "' style='" + dayStyle + "'>"
						+ dayText + "<br>" + weekday + "</div>";
			}

			// calendar 요소에 HTML 삽입
			calendarElement.innerHTML = html;

		}

		// 페이지 로드 시 주간 캘린더 생성
		window.addEventListener("load", function() {
			generateWeeklyCalendar();

			// calendar-prev 클릭 시 이전 주로 이동
			var prevButton = document.querySelector(".calendar-prev");
			prevButton.addEventListener("click", goToPreviousWeek);

			// calendar-next 클릭 시 다음 주로 이동
			var nextButton = document.querySelector(".calendar-next");
			nextButton.addEventListener("click", goToNextWeek);
		});

		var date = new Date();
		$(".calendar-yearmonth").html(
				date.getFullYear() + "년" + (date.getMonth() + 1) + "월");
	</script>



	<jsp:include page="../common/footer.jsp" />
	
	
</body>
</html>