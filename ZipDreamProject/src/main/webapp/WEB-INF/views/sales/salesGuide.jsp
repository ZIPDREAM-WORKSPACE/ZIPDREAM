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

.answerTitle {
	font-size: 15px;
	line-height: 22px;
	color: rgb(34, 34, 34);
	margin: 0px;
	padding: 0px;
}

.answerText {
	font-size: 15px;
	line-height: 22px;
	margin: 0px;
	padding: 0px;
}

.table_base {
	width: 100%;
	color: rgb(68, 68, 68);
	border-collapse: collapse;
	border-spacing: 0px;
	font-size: 15px;
	line-height: 22px;
	height: 33px;
	vertical-align: middle;
}

.table_base thead {
	text-align: center;
}

.table_base thead tr {
	background-color: rgb(237, 237, 237);
}

.table_base thead tr th {
	height: 33px;
	vertical-align: middle;
}

.table_base th, .table_base td {
	padding: 0px 8px;
	border: 1px solid rgb(221, 221, 221);
}

.tableJustify {
	text-align: right;
}

.answerText>span {
	text-decoration: underline;
	font-weight: 700;
}

.noticeTable {
	width: 100%;
	color: rgb(68, 68, 68);
	border-collapse: collapse;
	border-spacing: 0px;
	margin: 0px;
	padding: 0px;
	border: 0px;
	vertical-align: baseline;
}

.noticeTable thead th {
	color: rgb(60, 100, 191);
	background-color: rgb(239, 247, 255);
}

.noticeTable th, .noticeTable td {
	height: 33px;
	padding: 0px 8px;
	border: 1px solid rgb(221, 221, 221);
	text-align: left;
	vertical-align: middle;
}

.requiredTable {
	width: 100%;
	color: rgb(68, 68, 68);
	border-collapse: collapse;
	border-spacing: 0px;
}

.requiredTable li {
	list-style: circle;
}

.requiredTable tbody tr td {
	border: 1px solid rgb(221, 221, 221);
	padding: 20px;
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
				<li><a href="<%=request.getContextPath()%>/sales/schedule">청약정보</a></li>
				<li><a>|</a></li>
				<li><a href="<%=request.getContextPath()%>/sales/guide">분양가이드</a></li>
				<li><a>|</a></li>
                <li><a href="<%=request.getContextPath()%>/sales/calender">분양일정</a></li>
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
								<span class="answerNumber">01</span> <span class="questionTitle">청약통장
									가입하기</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<h1 class="answerTitle">▪ 청약통장 선택</h1>
							<p class="answerText">2015년 9월 1일부터 청약예금, 청약부금, 청약저축 신규발급이
								중단되고, 3가지 통장의 기능을 모두 모은 주택청약종합저축으로 일원화 되었다.</p>
							<br>
							<p class="answerText">* 주택종류에 따라 청약자격, 입주자(당첨자) 선정방식, 재당첨 제한
								등이 다르게 적용됩니다.</p>
							<p class="answerText">* 주택의 종류에 따른 청약 가능 통장</p>
							<p class="answerText">- 국민주택 : 주택청약종합저축, 청약저축</p>
							<p class="answerText">- 민영주택 : 주택청약종합저축, 청약예금·부금</p>
							<br>
							<h1 class="answerTitle">▪ 예치금이란?</h1>
							<p class="answerText">필수적으로 청약통장에 예치되어 있어야 하는 금액</p>
							<p class="answerText">주택면적 / 건설지역 별로 기준금액이 달라진다</p>
							<br>
							<table class="table_base">
								<colgroup>
									<col width="40%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
										<th>구분</th>
										<th>서울/부산</th>
										<th>기타광역시</th>
										<th>기타</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>전용면적 85m² 이하</td>
										<td class="tableJustify">300만원</td>
										<td class="tableJustify">250만원</td>
										<td class="tableJustify">200만원</td>
									</tr>
									<tr>
										<td>102m²(약 30.8평) 이하</td>
										<td class="tableJustify">600만원</td>
										<td class="tableJustify">400만원</td>
										<td class="tableJustify">300만원</td>
									</tr>
									<tr>
										<td>102m²초과 ~ 135m² 이하</td>
										<td class="tableJustify">1,000만원</td>
										<td class="tableJustify">700만원</td>
										<td class="tableJustify">400만원</td>
									</tr>
									<tr>
										<td>135m²(약 40.8평) 초과</td>
										<td class="tableJustify">1,500만원</td>
										<td class="tableJustify">1,000만원</td>
										<td class="tableJustify">500만원</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerNumber">02</span> <span class="questionTitle">원하는
									주택 찾아보기</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<h1 class="answerTitle">▪ 민영주택이란 국민주택을 제외한 주택을 말한다.</h1>
							<h1 class="answerTitle">▪ 국민주택이란 국가,지방자치단체, LH 및 지방공사가 건설하거나
								국가, 지방자치단체의 재정 또는 주택도시기금(구 국민주택기금)의 지원을 받아 건설, 개량하는 주거전용면적
								85m²이하의 주택을 말한다.(단, 수도권 및 도시지역이 아닌 읍·면 지역은 주거전용면적 100m²이하)</h1>
							<br>
							<h1 class="answerTitle">민간분양</h1>
							<p class="answerText">민간기업의 주택건설사업자가 주택을 건설하여 분양하는 경우이며,
								입주자모집공고일 현재 해당 주택건설지역 또는 인근 지역에 거주하는 만 19세 이상인 자여야 신청가능하다.</p>
							<p class="answerText">단, 배우자 또는 직계존비속인 세대원이 있는 세대주는 만 19세 미만도
								청약가능하다.</p>
							<br>
							<h1 class="answerTitle">민간임대(공공지원민간임대주택)</h1>
							<p class="answerText">역세권·대학 인근 등에 건설되며 특별공급비율을 높여 공공성을 강화한
								민간임대주책이다.</p>
							<br>
							<h1 class="answerTitle">공공분양</h1>
							<p class="answerText">국가·지자체·LH(또는 지방공사)가 건설하여 공급하는 전용면적
								85제곱미터 이하의 주택으로 분양자에게 소유권을 이전하는 주택(통상 LH, SH, 경기도시공사 등이 공급하는
								분양주택을 뜻함)</p>
							<br>
							<h1 class="answerTitle">공공임대</h1>
							<p class="answerText">주변시세의 80-90%로 저렴하게 임대가 가능한 주택</p>
							<p class="answerText">▪ 공공임대 주택종류 > 영구임대, 국민임대, 5/10년 공공임대,
								행복주택 등</p>
							<br>
							<h1 class="answerTitle">1)영구임대</h1>
							<p class="answerText">사회적약자를 위한 임대주택으로 저렴한 임대조건으로 영구적으로 거주할 수
								있는 주택.</p>
							<br>
							<h1 class="answerTitle">2)국민임대</h1>
							<br>
							<h1 class="answerTitle">3)5년/10년 공공임대주택</h1>
							<p class="answerText">입주자 모집공공일 현재 당해 주택건설지역에 거주하며, 청약통장이 있는
								무주택자만 신청가능</p>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerNumber">03</span> <span class="questionTitle">내
									자격과 순위 확인하기</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<p class="answerText">
								<span>민영주택: </span> 최초 입주자모집공고일 현재 해당 주택건설지역 또는 인근지역에 거주하는 자로서
								민법에 따른 성년자(만19세 이상)와 아래의 어느 하나에 해당하는 세대주인 미성년자(주택청약 시 성년자로 인정) 만
								청약 신청 가능. 단, 아래의 자녀 및 형제자매는 세대주인 미성년자와 같은 세대별 주민등록표등본에 등재되어 있어야
								한다.
							</p>
							<p class="answerText">- 자녀를 양육하는 경우</p>
							<p class="answerText">- 직계존속의 사망, 실종선고 및 행방불명 등으로 형제자매를 부양하는
								경우</p>
							<p class="answerText">
								<span>제 1순위: </span>
								<p>①투기과열지구 및 청약과열지역은 가입 후 2년이 경과한 분</p>
                                <p>②위축지역은 가입 후 1개월이 경과한 분</p>
                                <p>③투기과열지구 및 청약과열지역, 위축지역 외</p>
                                <p>- 수도권 지역은 가입 후 1년이 경과한 분(다만, 필요한 경우 시·도지사가 24개월까지 연장 가능)</p>
                                <p>- 수도권 외 지역 : 가입 후 6개월이 경과한 분(다만, 필요한 경우 시·도지사가 12개월까지 연장 가능)</p>
                            </p>
                            <p class="answerText">
                                <span>제 2순위: </span>
                                1순위에 해당하지 않는 분(청약통장 가입자만 청약가능) (1순위 제한자 포함)
                            </p>
                            <br>
                            <p class="answerText">
                                <span>국민주택: </span>
                                최초 입주자모집공고일 현재 해당 주택 건설지역 또는 인근지역에 거주하는 자로서 민법에 따른 성년자(만19세 이상)와 아래의 어느 하나에 해당하는 세대주인 미성년자(주택청약 시 성년자로 인정)만 청약 신청할 수 있습니다. 단, 아래의 자녀 및 형제자매는 세대주인 미성년자와 같은 세대별 주민등록표등본에 등재되어 있어야 합니다.
                                
							<p>- 자녀를 양육하는 경우</p>
                                <p>- 직계존속의 사망, 실종선고 및 행방불명 등으로 형제자매를 부양하는 경우</p>
                                <p>- 동일한 주민등록표등본에 함께 등재된 세대[청약신청자의 배우자, 직계존속(배우자의 진계존속포함) 및 직계비속(직계비속의 배우자포함)] 전원이 주택 또는 분양권을 소유하고 있지 아니한 세대구성원(무주택세대구성원)은 국민주택에 청약신청할 수 있습니다.</p>
                                <p>* 다만 청약신청자의 배우자가 별도의 주민등록표등본에 등재되어 있는 경우에는(배우자분리세대) 그 배우자와 배우자의 주민등록표등본에 등재된 직계존·비속을 포합합니다.</p>
                            </p>  
                            <p class="answerText">
                                <span>제 1순위: </span>
                                
							<p>①투기과열지구 및 청약과열지역은 가입 후 2년이 경과한 분</p>
                                <p>②위축지역은 가입 후 1개월이 경과한 분</p>
                                <p>③투기과열지구 및 청약과열지역, 위축지역 외</p>
                                <p>- 수도권 지역은 가입 후 1년이 경과한 분(다만, 필요한 경우 시·도지사가 24개월까지 연장 가능)</p>
                                <p>- 수도권 외 지역 : 가입 후 6개월이 경과한 분(다만, 필요한 경우 시·도지사가 12개월까지 연장 가능)</p>
                            </p>
                            <p class="answerText">
                                <span>제 2순위: </span>
                                1순위에 해당하지 않는 분(청약통장 가입자만 청약가능) (1순위 제한자 포함)
                            </p>
                        </div>
                    </div>
                    <div class="listAnswer">
                        <div class="Hquestion">
                            <div>
                                <span class="answerNumber">04</span>
                                <span class="questionTitle">청약신청하기</span>
                            </div>
                            <svg id="toggle"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
                        </div>
                        <div class="Hanswer">
                            <p class="answerText">신청하고자 하는 주택의 청약사이트를 확인하기</p>
                            <p class="answerText">1. SH공사 인터넷 청약 > 서울주택도시공사에서 공급하는 주택</p>
                            <p class="answerText">2. LH 인터넷청약 > 한국토지주택공사에서 공급하는 주택</p>
                            <p class="answerText">3. 청약홈(한국감정원) > 공동인증서(은행보험용 또는 범용)을 보유한 청약통장 가입고객</p>
                            <p class="answerText">4. 삭제은행지점 청약신청 > 정보취약계층(고령자 및 장애인 등) 등에 한하여 은행지점에서 APT 1-2순위 청약신청 가능하며, 특별공급은 청약 불가</p>
                            <br>
                            <p class="answerText"
								style="font-weight: 400;">[인터넷 청약신청 방법]</p>
                            <p class="answerText">신청대상 : 공인인증서 소지</p>
                            <p class="answerText">청약시간 : 08:00 ~ 17:30(인터넷)</p>
                            <p class="answerText">청약방법 : 청약 Home, 국민은행, LH, SH 홈페이지</p>
                            <p class="answerText">청약취소 : 청약신청 당일, 청약신청기간 이내 가능</p>
                            <table class="noticeTable">
                                <thead>
                                    <tr>
                                        <th colspan="3">청약 지원 할 때 알아야할 주의사항</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>청약통장 재사용 금지</td>
                                        <td>발표일이 동일한 주택에 중복청약불가</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>청약신청 취소불가</td>
                                        <td>청약 신청 후 취소 및 정정불가(당일에만 가능)</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>청약순위 자격 확인</td>
                                        <td>청약통장의 월납입금, 연체이력, 예치금 등 사전확인</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>청약 시 서류 준비</td>
                                        <td>구비서류에 허위, 오류 누락된 사실이 없도록 정확히 청약</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>청약 1순위 자격제한</td>
                                        <td>1순위 청약제한 대상자 여부 확인 후 청약</td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>특별공급 유형 신청 시</td>
                                        <td>본인이 해당하는 특별공급 관련 서류 구비</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="listAnswer">
                        <div class="Hquestion">
                            <div>
                                <span class="answerNumber">05</span>
                                <span class="questionTitle">계약 시 필요서류</span>
                            </div>
                            <svg id="toggle"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
                        </div>
                        <div class="Hanswer">
                            <table class="requiredTable">
                                <tbody>
                                    <tr>
                                        <td>본인 및 배우자 계약시</td>
                                        <td>
                                            <li>계약금</li>
                                            <li>계약자의 인감도장 및 인감증명서 1통<br>
                                                (용도:아파트 계약용, 공고일 이후 발급분)
                                            </li>
                                            <li>주민등록증, 주민등록등본, 가족관계증명서</li>
                                            <li>주택공급신청서 접수증 (은행창구에 비치)</li>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>추가서류</td>
                                        <td>
                                            <li>무주택세대원 입증서류</li>
                                            <li>특별공급 유형에 맞는 증빙 서류</li>
                                            <li>(제3자 대리 계약시) 위임장</li>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                
                        </div>
                    </div>
                    <div class="listAnswer">
                        <div class="Hquestion">
                            <div>
                                <span class="answerNumber">06</span>
                                <span class="questionTitle">청약 후 납부단계</span>
                            </div>
                            <svg id="toggle"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
                        </div>
                        <div class="Hanswer">
                            <p class="answerText">※ 계약금, 중도금, 잔금의 납부 비율은 대상 주택에 따라 다를 수 있으므로 입주자모집공고를 필히 확인하여야한다.</p>
                            <br>
                            <h1 class="answerTitle">1) 계약금 치르기</h1>
                            <p class="answerText">통상 계약금은 분양가의 10%~20%이며, 계약금은 대출이 불가하여 사전 준비가 필요하다.</p>
                            <br>
                            <h1 class="answerTitle">2) 중도금 치르기</h1>
                            <p class="answerText">중도금은 납부 기간이 정해여 있는데 보통 정계약금을 치른 날로부터 1~6회로 나누어 분납 가능하다.</p>
                            <p class="answerText">중도금 대출은 주로 시공사나 시행사와 연계되어 있는 은행에서 취급한다.</p>
                            <br>
                            <h1 class="answerTitle">3) 잔금 치르기</h1>
                            <p class="answerText">아파트 공급금액에서 계약금, 중도금을 뺀 나머지 잔금으로 입주 전까지 납부하면 된다.</p>
                            <br>
                            <h1 class="answerTitle">4) 소유권 이전하기</h1>
                            <p class="answerText">소유권이전등기란 주택에 대한 명의를 본인의 이름으로 변경하는 단계이다.</p>
                            <br>
                            <h1 class="answerTitle">TIP.소유권 이전 후 납부해야 할 금액이 있나요?</h1>
                            <br>
                            <h1 class="answerTitle">* 취득세</h1>
                            <p class="answerText">동산이나 부동산 등의 자산을 취득한 이에게 부과되는 세금</p>
                            <p class="answerText">잔금을 치른 날로부터 60일 이내 납부하여야 한다.</p>
                            <p class="answerText">취득세에는 등록세가 포함되어있어 취득세만 내면 등록세는 따로 내지 않아도 된다.</p>
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