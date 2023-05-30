<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	/* border: 1px solid black; */
	font-family: 'Noto Sans KR', sans-serif;
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

.selectHouseGuide {
	display: flex;
	justify-content: center;
}

.category_swipperWrap {
	display: flex;
	justify-content: center;
	width: 1200px;
}

.category_swipper {
	width: 100%;
	margin: 0px;
	box-sizing: content-box;
}

.category_swiper>button:focus {
	outline: none;
}

.category_button {
	padding: 9px;
	background: rgba(226, 226, 226, 0.7);
	border: 1.5px solid rgb(255, 255, 255);
	border-radius: 20px 20px 0px 0px;
	font-style: normal;
	font-size: 15px;
	line-height: 23px;
	text-align: center;
	color: rgb(102, 102, 102);
	white-space: nowrap;
	min-width: 392px;
}

.category_button:hover {
	background-color: #326CF9;
	color: white;
}

.houseAnswerWrap {
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
}

.answerSearchWrap {
	display: flex;
	justify-content: center;
	padding: 40px 0px;
}

.answerSearchWrap>div {
	display: flex;
	align-items: center;
	width: 345px;
	height: 48px;
	text-align: left;
	border: 1px solid rgb(209, 209, 209);
}

.searchKeywordInput {
	width: 311px;
	height: 100%;
	font-size: 15px;
	color: rgb(34, 34, 34);
	border-width: initial;
	border-style: none;
	border-color: initial;
	outline: none;
	padding: 0px 14px;
}

.answerSearchWrap .bi-search {
	cursor: pointer;
}

.answerList {
	margin: 0px;
	padding: 0px;
	border: 0px;
	font: inherit;
	vertical-align: baseline;
	border-top: 1px solid rgb(34, 34, 34);
	margin-top: 25px;
	margin-bottom: 150px;
}

.listA {
	cursor: pointer;
	color: rgb(34, 34, 34);
	border-bottom: 1px solid rgba(221, 221, 221, 0.7);
}

.listAnswer {
	color: rgb(34, 34, 34);
	user-select: none;
	border-bottom: 1px solid rgba(221, 221, 221, 0.7);
	cursor: pointer;
}

.Hquestion>div>span {
	display: inline-block;
	margin-right: 20px;
}

.Hquestion {
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 82px;
	line-height: 82px;
	font-size: 18px;
	padding: 0px 20px;
	color: rgb(34, 34, 34);
}

.Hquestion>div {
	display: flex;
}

.active svg {
	transform: rotate(180deg);
	transition: transform 300ms ease-out 0s;
}

.Hanswer {
	padding: 40px 50px;
	background-color: rgba(245, 246, 248, 0.5);
	color: rgb(102, 102, 102);
	user-select: text;
	cursor: default;
	display: none;
}

.answerPoint {
	display: inline-block;
	margin-right: 20px;
	font-size: 14px;
	width: 66px;
}

.supplyTarget {
	table-layout: fixed;
	width: 100%;
	color: rgb(68, 68, 68);
	border-collapse: collapse;
	border-spacing: 0px;
	font-size: 15px;
	line-height: 22px;
}

.supplyTarget thead {
	text-align: center;
}

.supplyTarget thead tr {
	background-color: rgb(237, 237, 237);
}

.supplyTarget thead tr th {
	height: 33px;
	vertical-align: middle;
	padding: 0px 8px;
	border: 1px solid rgb(221, 221, 221);
}

.supplyTarget tbody tr td {
	height: 33px;
	vertical-align: middle;
	text-align: center;
	padding: 0px 8px;
	border: 1px solid rgb(221, 221, 221);
}

.strategyTable {
	width: 100%;
	color: rgb(68, 68, 68);
	border-collapse: collapse;
	border-spacing: 0px;
}

.strategyTable thead {
	text-align: center;
	font-size: 15px;
	line-height: 22px;
}

.strategyTable thead tr {
	background-color: rgb(237, 237, 237);
}

.strategyTable thead tr th {
	height: 33px;
	vertical-align: middle;
	padding: 0px 8px;
	border: 1px solid rgb(221, 221, 221);
}

.strategyTable tbody tr td {
	height: 33px;
	vertical-align: middle;
	text-align: left;
	padding: 0px 8px;
	border: 1px solid rgb(221, 221, 221);
}
.current{
	background-color: #326CF9;
	color: white;
}
.category_swiper>a:hover{
	text-decoration:none;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<script>
	    $(document).ready(function() {
	        if(location.href.indexOf('<%=request.getContextPath()%>/sales/faq') > -1){ 
	            $('#faq').addClass('current');
	        }
	        if(location.href.indexOf('<%=request.getContextPath()%>/sales/term') > -1) {
				$('#term').addClass('current');
			}
			if (location.href.indexOf('<%=request.getContextPath()%>/sales/guide') > -1){ 
	        	$('#guide').addClass('current');
	        }   
	        
	    });
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
			<h1 class="sellHouseTitle">분양가이드</h1>
		</div>
		<div class="selectHouseGuide">
			<div class="category_swipperWrap mt-5">
				<div class="category_swiper">
					<a href="<%=request.getContextPath()%>/sales/guide" class="category_button" type="button" id="guide">주택청약가이드</a>
				</div>
				<div class="category_swiper">
					<a href="<%=request.getContextPath()%>/sales/term" class="category_button" type="button" id="term">분양용어</a>
				</div>
				<div class="category_swiper">
					<a href="<%=request.getContextPath()%>/sales/faq"  class="category_button" type="button" id="faq">자주하는질문</a>
				</div>
			</div>
		</div>
		<div class="houseAnswerWrap">
			<div class="answerSearchWrap">
				<div>
					<input class="searchKeywordInput" id="search" type="text"
						onkeyup="filter();" placeholder="궁금한 사항을 입력해보세요.">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg>
				</div>
			</div>
			<div class="answerList">
				<div class="listA">
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">청약가점제</span> <span
									class="questionTitle">청약가점제란 무엇인가요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 청약신청자의 3가지 조건에 따라 가산점을 부여하여 분양주택의 당첨자를 결정하는 제도를 말합니다. 청약
								가점은 부양가족수 5~35점, 무주택기간 2~32점, 청약통장 가입기간 1~17점으로 최고 점수는 84점으로
								합산하여 계산됩니다.</p>
							<p>▪ 부양가족수는 1명이 늘 때마다 5점씩, 무주택기간은 1년이 경과할 때마다 2점씩, 청약통장 가입기간은
								1년이 경과할 때마다 1점씩 올라가는 식으로, 점수가 높을수록 청약에 유리한 방식입니다.</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">청약가점제</span> <span
									class="questionTitle">무주택기간은 어떻게 산정하나요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 무주택자에 대한 무주택 기간은 청약 신청자 본인 및 배우자를 기준으로 합니다.</p>
							<p>▪ 청약신청자의 배우자가 결혼 전 소유했다 처분한 주택 제외</p>
							<p>▪ 혼인신고일: 혼인신고서 제출한 날</p>
							<p>▪ 무주택자가 된 날: 건물 등기부등본 등기 접수일</p>
							<br>
							<p>※ 주택을 소유한 적이 없을 때</p>
							<p>- 만 30세 이전에 결혼한 청약신청자: 혼인신고일 ~ 입주자 모집공고일</p>
							<p>- 만 30세 이전에 결혼하지 않은 청약신청자: 만 30세 ~ 입주자 모집공고일</p>
							<p>※ 주택을 소유한 적이 있을 때</p>
							<p>- 만 30세 이전에 결혼한 청약신청자: 혼인신고일과 무주택자가 된 날 중 늦은 날 ~ 입주자 모집공고일</p>
							<p>- 만 30세 이전에 결혼하지 않은 청약신청자: 만 30세가 된 날과 무주택자가 된 날 중 늦은 날 ~
								입주자 모집공고일</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">청약가점제</span> <span
									class="questionTitle">청약가점제에서 무주택자의 기준은 어떻게 되나요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 항상 개인이 기준이 아닌 '세대원 전원'이 기준이 됩니다. 즉, 배우자, 직계존비속 모두 주택을
								소유하지 않아야 무주택자로 인정됩니다. 단, 부모님이 만 60세가 넘으신 경우는 예외입니다.</p>
							<p>(일부 공공분양이나 특별공급의 경우 만 60세 이상의 직계존속의 주택 소유도 유주택으로 간주하는 경우가
								있으니 분양공고문을 꼭 확인해야 합니다.)</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">청약가점제</span> <span
									class="questionTitle">부양가족수의 기준은 어떻게 되나요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p style="font-weight: 600;">청약신청자와 동일한 주민등록본에 기재된 세대원 중 아래의
								경우에 해당됩니다.</p>
							<p>▪ 배우자</p>
							<p>▪ 직계존속</p>
							<p>- 청약신청자가 세대주여야 하며 3년이상 동일 주민등록본에 등재된 직계존속</p>
							<p>- 청약신청자의 배우자가 동일한 주민등록표상에 등재되어 있지 않은 배우자 분리세대</p>
							<p>▪ 직계비속</p>
							<p>- 미혼 자녀(만 30세 이상 입주자모집공고일 기준으로 최근 1년이상 계속해서 동일한 주민등록등본 상에
								등재시에만 부양가족으로 인정)</p>
							<p>- 부모가 모두 사망한 경우 미혼인 손자녀 포함</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">청약가점제</span> <span
									class="questionTitle">유주택자가 무주택 자격으로 청약을 넣을 수 있는 경우도
									있나요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 유주택자가 무주택 자격으로 청약을 넣을 수 있는 경우는 다음과 같습니다.</p>
							<p>- 청약 당첨 부적격자로 통보를 받은 날부터 3개월이내에 상속박은 공유지분을 처분한 경우</p>
							<p>( 단, 단독 상속은 유주택자로 간주)</p>
							<p>- 면의 행정구역(수도권 제외)의 사용 승인 후 20년이상 경과 또는 85m²이하 단독주택</p>
							<p>
								<span>- 주택 분양을 완료하였거나, 청약 당첨 부적격자로 통보를 받은 날부터</span> <span
									style="font-weight: 600;">3개월 이내</span> <span>처분한 경우</span>
							</p>
							<p>(개인에 한함)</p>
							<p>- 근로자의 숙소 소유(개인에 한함)</p>
							<p>- 1호 또는 1세대 20m²이하의 주택 소유</p>
							<p>- 만 60세 이상의 직계존속이 주택 소유</p>
							<p>- 공부상 주택에 등재돼 있으나 주택 이외의 용도로 사용되고 있는 경우로 청약 당첨 적격자로 통보 받은
								날로부터 3개월 이내에 정리한 경우</p>
							<p>- 무허가 건물 소유</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">공급대상</span> <span
									class="questionTitle">신혼부부 특별공급이 뭔가요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 대상주택 : 전용면적 85m² 이하의 분양주택</p>
							<p>▪ 공급물량 : 민영주택 20%, 국민주택 30%</p>
							<p>▪ 대상자 : 입주자모집공고일 기준 혼인기간이 7년 이내인 분</p>
							<p>※ 국민주택은 예비 신혼부부(혼인 계획중이며, 주택 입주전까지 혼인사실 증명 가능) 포함</p>
							<p>▪ 청약자격</p>
							<p>- 동일 주민등록본 상 세대주 및 세대원 전원이 무주택인 경우</p>
							<table class="supplyTarget">
								<thead>
									<tr>
										<th rowspan="2">분양가</th>
										<th colspan="2">소득요건</th>
									</tr>
									<tr>
										<th>우선(75%)</th>
										<th>일반(25%)</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="text-align: center;">6억 이하</td>
										<td style="text-align: center;">100% (맞벌이 120%)</td>
										<td style="text-align: center;">120% (맞벌이 130%)</td>
									</tr>
									<tr>
										<td rowspan="2">6억 ~9억</td>
										<td rowspan="2">100% (맞벌이 120%)</td>
										<td>120% (맞벌이 130%)</td>
									</tr>
									<tr>
										<td>생애최초 130% (맞벌이 140%)</td>
									</tr>
								</tbody>
							</table>
							<P>* 20년 도시근로자 월평균 소득 100% : (2인가구)437만원, (3인가구) 562만원,
								(4인가구) 622만원</P>
							<P>[공급분양]</P>
							<p>- 우선공급(70%): 해당 세대의 월평균 소득이 전년도 도시근로자 가구당 월평균 소득의 100% 이하인
								분</p>
							<p>- 일반공급(30%): 해당 세대의 월평균 소득이 전년도 도시근로자 가구당 월평균 소득의 130% 이하인
								분</p>
							<p>[민영주택]</p>
							<p>- 우선공급(70%): 해당 세대의 월평균 소득이 전년도 도시근로자 가구당 월평균 소득의 160% 이하인
								분</p>
							<p>- 일반공급(30%): 해당 세대의 월평균 소득이 전년도 도시근로자 가구당 월쳥균 소득의 160% 이하인
								분</p>
							<p>▪ 신혼부부 소득요건</p>
							<p>- 청약저축에 가입하여 6개월 후 매월 약정 납입일에 월 납일금 6회 이상 납입한 경우</p>
							<p>※ 당첨자 발표일이 동일한 주택에 대하여 1세대당 1인 신청 가능</p>
							<p>▪ 순위산정 : 1순위(입주자모집공고일 기준 미성년인 자녀가 있는 경우)</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">공급대상</span> <span
									class="questionTitle">다자녀 특별공급이 뭔가요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 대상주택 : 국민주택, 민영주택</p>
							<p>▪ 공급물량 : 건설량의 10% 내 (입주자모집 승인권자가 승인하는 경우 최대 15%)</p>
							<p>▪ 대상자 : 입주자모집공고일 기준 미성년인 자녀 3명 이상을 둔(태아, 입양자녀 포함)</p>
							<p>※ 국민주택은 예비 신혼부부(혼인 계획중이며, 주택 입주전까지 혼인사실 증명 가능) 포함</p>
							<p>▪ 청약자격</p>
							<p>- 동일 주민등록본 상 세대주 및 세대원 전원이 무주택인 경우</p>
							<p>- 국민주택의 경우, 해당 세대의 월 평균 소득이 전년도 도시근로자 가구당 월 평균 소득의 120%
								이하여야한다. 민영주택은 소득기준 미적용</p>
							<p>- 청약저축에 가입하여 6개월 경과 후 매월 약정 납입일에 월 납입금 6회 이상 납입한 경우</p>
							<p>※ 당첨자 발표일이 동일한 주택에 대하여 1세대당 1인 신청 가능</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">공급대상</span> <span
									class="questionTitle">기관추처 특별공급이 뭔가요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 대상주택</p>
							<p>- 전용면적 85m² 이하의 분양주택</p>
							<p>- 한부모가족, 국군포로, 위아부피해자, 철거주택세입자 기관 추천 경우 공공임대 주택</p>
							<p>▪ 공급물량 : 국민주택 10%, 민영주택 10%(시,도지사 승인 시 초과 공급 가능)</p>
							<p>▪ 대상자 : 국가유공자, 보훔대상자, 5.18유공자, 특수임무유공자, 참전유공자, 장기복무(제대)군인,
								북한이탈주민, 납북피해자, 일본군위안부, 장애인, 영구귀국과학자, 올림픽 등 입상자, 중소기업근무자, 공공사업 등
								철거 주택 소유자 또는 거주자, 의사상자 등</p>
							<p>▪ 청약자격</p>
							<p>- 동일 주민등록본 상 세대주 및 세대원 전원이 무주택인 경우</p>
							<p>- 청약저축에 가입하여 6개월 경과 후 매월 약정 납입일에 월 납일금 6회 이상 납입한 경우</p>
							<p>※ 당첨자 발표일이 동일한 주택에 대하여 1세대당 1인 신청 가능</p>
							<p>▪ 순위산정 : 관련기관의 장이 정하는 우선순위에 따라 결정</p>
							<p>※ 단, 이 경우에도 해당지역 거주자가 우선됨</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">공급대상</span> <span
									class="questionTitle">노부모부양 특별공급이 뭔가요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 대상주택 : 국민주택, 민영주택</p>
							<p>▪ 공급물량 : 국민주택 5%, 민영주택 3%</p>
							<p>▪ 대상자</p>
							<p>- 일반공급 1순위에 해당하는 자로서 만 65세 이상의 직계존속을 3년 이상 계속하여 부양(깥은
								주민등록등본 등재)하고 있는 세대주</p>
							<p>- 무주택 세대주만이 신청 가능</p>
							<p>▪ 청약자격</p>
							<p>- 1순위 세대주만 청약 가능</p>
							<p>- 동일 주민등록본 상 세대주 및 세대원 전원이 무주택인 경우</p>
							<p>- 해당 세대의 월평균 소득이 전년도 도시근로자 가구당 월평균 소득의 120% 이하인 분</p>
							<p>- 주택별 청약 가능한 청약통장에 가입한지 24개월 (지역 및 주택에 따라 6~24개월)이 경과하고 매월
								약정납입일에 월 납입금을 24회(지역에 따라 6~24회)이상 납입한 분</p>
							<p>※ 당첨자 발표일이 동일한 주택에 대하여 1세대당 1인 신청 가능</p>
							<p>※ 수도권 이외의 지역은 6~12개월 기간으로 시/도지사가 정하는 기간을 충족하는 경우</p>
							<p>▪ 순위산정 : 국민주택은 순차제이며</p>
							<p>- 전용면적 40m² 이하 주택인 경우 무주택기간이 3년 이상 / 납입횟수가 많은 자</p>
							<p>- 전용면적 40m² 초과 주택인 경우 무주택기간이 3년 이상 / 저축 총액이 많은 자</p>
							<p>- 민영주택은 가점제로 순위가 산정됨</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">공급대상</span> <span
									class="questionTitle">생애최초 주택구입 특별공급이 뭔가요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 대상주택 : 국민주택</p>
							<p>▪ 공급물량 : 건설량의 25%내</p>
							<p>- 85m² 이하 민영주택 중 공공택지는 분양물량의 15%, 민간택지는 7%를 배정</p>
							<p>▪ 대상자 : 생애 최초(세대원 모두 과거 주택을 소유한 사실이 없는 경우)로 주택 구입을 하며, 아래
								요건을 충족하는 경우</p>
							<p>- 일반공급 1순위인 무주택 세대의 세대원, 세대주로서 저축액이 600만원 이상인 분</p>
							<p>- 입주자모집공고일 기준 혼인 중, 자녀가 있는 분</p>
							<p>- 임주자모집공고일 기준 근로자, 자영업자로 5년이상 소득세 납부한 분</p>
							<p>▪ 청약자격 : 동일 주민등록등본 상 세대주 및 세대원 전원이 무주택자인 경우</p>
							<p>- 청약저축에 가입하여 12개월 경과 후 매월 약정 납입일에 월 납입금 12회 이상 납입한 경우</p>
							<p>* 20년 도시근로자 월평균 소득 100% : (2인가구)437만원, (3인가구) 562만원,
								(4인가구)622만원</p>
							<p>[공공분양]</p>
							<p>- 우선공급(70%): 해당 세대의 월평균 소득이 전년도 도시근로자 가구당 월평균 소득의 100%이하인
								분</p>
							<p>- 일반공급(30%): 해당 세대의 월평균 소득이 전년도 도시근로자 가구당 월평균 소득의 130%이하인
								분</p>
							<p>[민영주택]</p>
							<p>- 우선공급(70%): 해당 세대의 월평균 소득이 전년도 도시근로자 가구당 월평균 소득의 130%이하인
								분</p>
							<P>- 일반공급(30%): 해당 세대의 월평균 소득이 전년도 도시근로자 가구당 월평균 소득의 160%이하인
								분</P>
							<p>▪ 신혼부부 소득요건</p>
							<p>- 생애최초 구입자의 경우 130% (맞벌이 140%)이하인 분</p>
							<p>- 민영주택(신혼특별공급)과 공공분양(신혼희망타운)만 해당</p>
							<p>※ 당첨자 발표일이 동일한 주택에 대하여 1세대당 1인 신청 가능</p>
							<p>※ 수도권 이외의 지역은 6~12개월 기간으로 시/도지사가 정하는 기간을 충족하는 경우</p>
							<p>▪ 순위산정 :경쟁이 있을 경우 추첨으로 선정</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">공급대상</span> <span
									class="questionTitle">이전기관종사자 등 특별공급이 뭔가요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 대상주택 : 행정중심복합도시(세종시), 도청이전신도시, 혁신도시 등 비수도권으로 이전하는
								공공기관·학교·의료연구기관 기업이 종사자, 이전하는 주한미군기지의 고용원, 산업단지 및 기업도시 종사자 등에게
								공급하는 분양 및 임대주택</p>
							<p>▪ 청약자격 : 입주자모집공고일 현재 해당기과 종사자로서 해당기관에서 '주택 특별공급대상자 확인서'를
								발급받은 분</p>
							<p>▪ 순위산정 : 경쟁이 있을 경우 추첨으로 선정 단, 행정줌심복합도시 이전 기관 종사자 등 특별공급은
								관련 기준에 따라 무주택자에게 50%를 우선공급하며, 2주택 이상 소유한 세대에 속한 자는 신청할 수
								없음('20.12.1부터')</p>
							<p>▪ 제한사항 : 세종시, 산업단지, 기업도시, 혁신도시, 주한미군 이전도시의 경우 특별공급 대상인
								종사자와 그 세대헤 속한 자(배우자 분리 세대 포함)가 해당 주택겅설지역에 주택을 소유하고 있는 경우와 해당
								지역에서 공급한 주택의 일반 공급에 당첨된 사실이 있는 경우에는 특별공급 대상자에서 제외됨</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">공급대상</span> <span
									class="questionTitle">외국인 특별공급이 뭔가요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 대상주택 : 외국인에게 공급하는 분양 및 임대주택</p>
							<p>▪ 청약자격 : 입주자모집공고일 기준 시도지사가 정한 외국인 중 무주택자</p>
							<p>▪ 순위산정 : 경쟁이 있을 경우 추첨으로 선정</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">청약전략</span> <span
									class="questionTitle">청약 1순위가 되려면 어떤 조건이여야 하나요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 국민주택 : 투기과열지구 및 청약과열지역은 2년의 가입기간이 경과해야합니다. 투기과열지구 및
								청약과열지역 외 수도권지역은 가입 후 1년이 경과해야하고 비수도권 지역은 가입 후 6개월이 경과해야합니다.
								투기과열지구 및 청약과열지역은 24회, 투기과열지구 및 청약과열지역 외 수도권 12회, 비수도권 6회를 매월 연체
								없이 납입해야합니다.</p>
							<br>
							<p>▪ 민영주택 : 투기과열지구 및 청약과열지역은 2년의 가입기간이 경과해야합니다. 투기과열지구 및
								청약과열지역 외 수도권지역은 가입 후 1년이 경과해야하고 비수도권 지역은 가입 후 6개월이 경과해야합니다.
								국민주택과 달리 아래 표와 같이 지역별 예치금 이상이면 1순위 조건에 맞춰집니다.</p>
							<br>
							<table class="strategyTable">
								<thead>
									<tr>
										<th>구분</th>
										<th>서울/부산</th>
										<th>기타광역시</th>
										<th>기타 시/군</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>85m² 이하</td>
										<td>300만원</td>
										<td>250만원</td>
										<td>200만원</td>
									</tr>
									<tr>
										<td>102m² 이하</td>
										<td>600만원</td>
										<td>400만원</td>
										<td>300만원</td>
									</tr>
									<tr>
										<td>135m² 이하</td>
										<td>1000만원</td>
										<td>700만원</td>
										<td>400만원</td>
									</tr>
									<tr>
										<td>모든 면적</td>
										<td>1500만원</td>
										<td>1000만원</td>
										<td>500만원</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">청약전략</span> <span
									class="questionTitle">주택청약 당첨이 어떤 경우에 취소되나요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 청약 가점을 잘못 계산해서 당첨 무효가 되는 경우</p>
							<p>▪ 청약 당첨자 발표일이 같은 경우 이중당첨으로 당첨 취소</p>
							<p>▪ 청약에 당첨되었으나 계약을 하지 않은 경우</p>
							<p>▪ 재당첨제한 기간에 청약한 경우</p>
							<p>▪ 청약 신청 시 제출한 서류가 사실과 다름이 판명된 경우</p>
							<p>▪ 주민등록법령 위반, 청약관련서류 변조 및 도용, 공급 신청서 기재사항 허위 및 청약통장 등을
								타인명의로 가입한 자의 청약통장 등을 사실상 양도 받아 주택공급신청 및 계약한 경우</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerPoint">청약전략</span> <span
									class="questionTitle">청약시 해당 지역 거주자에게 혜택이 있나요?</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p>▪ 주택청약은 원칙적으로 거주지를 기준을 '해당 주택건설지역(해당지역)' 및 '인근지역(기타지역)'의
								거주자만 청약 시청할 수 있습니다. 주택 공급은 해당지역에 거주하는 청약신청자에게 우선적으로 공급하고, 잔여세대가
								있는 경우 기타지역에 거주하는 청약신청자에게 공급합니다.</p>
							<p>▪ 공급 예정 물량이 많은 곳으로 이사를 가서 분양 예정 단지 청약을 위한 거주 요건을 충족시켜 놓는
								것도 좋은 전략입니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
        $(document).ready(function(){
            var question = $(".Hquestion");
            var answer = $("Hanswer");

            question.on('click', function(e){

                //활성화된 class 제거
                question.removeClass('active');
                // answer 내용 숨기기
                answer.slideUp('normal');
                
                if($(this).next().is(':hidden') == true){
                    $(this).addClass('active');
                    $(this).next().slideDown(200);
                    $(this).css({"color":"rgb(50, 108, 249)"});
                
                } else{
                    $(this).removeClass('active');
                    $(this).next().slideUp(200);
                    $(this).css({"color":"rgb(34, 34, 34)"});
                }

            });
        });

        function filter(){
            let search = document.getElementById("search").value.toLowerCase();
            let question = document.getElementsByClassName("Hquestion");
            let title = document.getElementsByClassName("questionTitle");

            for(let i = 0; i < question.length; i++){
                if(title[i].innerHTML.toLowerCase().includes(search)){
                    question[i].style.display = "flex";
                }else{
                    question[i].style.display = "none";
                }
            }
        };
    </script>





	<jsp:include page="../common/footer.jsp" />
</body>
</html>