<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    padding-left: 0px;
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
	min-width: 300px;
}

.category_button:hover {
	background-color: #326CF9;
	color: white;
}

.current {
	background-color: #326CF9;
	color: white;
}

.category_swiper>a:hover {
	text-decoration: none;
}

.calculatorWrap {
	width: 100%;
	flex-grow: 1;
}

.calculatorWrap>div {
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
}

.NoticeWrap {
	background-color: rgb(245, 246, 248);
	padding: 10px 0px;
	margin-top: 30px;
	border-radius: 3px;
	text-align: center;
	font-size: 15px;
}

.selectFamilyWrap {
	width: 470px;
	margin: 46px auto 0px;
	padding: 0px;
	border: 0px;
	font: inherit;
	vertical-align: baseline;
	
}

.selectFamilyWrap>h1 {
	color: rgb(34, 34, 34);
	font-size: 15px;
	font-weight: 700;
	margin-bottom: 13px;
	line-height: 20px;
	text-align: left;
	display: flex;
    gap: 5px;
    align-items: center;
}

.selectFamilyWrap>svg {
	position: relative;
	bottom: 1px;
	width: 18px;
	height: 18px;
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}

.option {
	font-weight: normal;
	display: block;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}

.selectFamily {
	height: 46px;
	padding: 0px 8px 0px 10px;
	color: rgb(76, 76, 76);
	font-size: 14px;
	border: 1px solid rgb(223, 223, 223);
	border-radius: 2px;
	box-sizing: border-box;
	background:
		url(https://www.dabangapp.com/static/media/select_arrow.95d6586e.svg)
		right 8px center/10px 6px no-repeat rgb(255, 255, 255);
	outline: none;
	appearance: none;
	width: 100%;
}

.nohomePeriod {
	width: 470px;
	margin: 46px auto 0px;
}

.nohomePeriod>h1 {
	color: rgb(34, 34, 34);
	font-size: 15px;
	font-weight: 700;
	margin-bottom: 13px;
	line-height: 20px;
	text-align: left;
	display: flex;
    gap: 5px;
    align-items: center;

}

.nohomePeriod>svg {
	position: relative;
	bottom: 1px;
	width: 18px;
	height: 18px;
	margin-left: 5px;
	vertical-align: middle;
}

.nohomePeriod>div {
	display: flex;
}

.joinWrap {
	width: 470px;
	margin: 46px auto 0px;
}

.joinWrap>h1 {
	color: rgb(34, 34, 34);
	font-size: 15px;
	font-weight: 700;
	margin-bottom: 13px;
	line-height: 20px;
	text-align: left;
	display: flex;
    gap: 5px;
    align-items: center;

}

.joinWrap>svg {
	position: relative;
	bottom: 1px;
	width: 18px;
	height: 18px;
	margin-left: 5px;
	vertical-align: middle;
}

.btnArea {
	width: 470px;
	margin: 46px auto 0px;
}

.btnArea>div {
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
}

*  svg {
	cursor: pointer;
}

.resultTable {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	text-align: center;
}

.resultTable th, .resultTable td {
	border-bottom: 1px solid #444444;
	border-left: 1px solid #444444;
	padding: 10px;
}

.resultTable th:first-child, .resultTabletd:first-child {
	border-left: none;
}

.resultTable thead th {
	color: rgb(60, 100, 191);
	background-color: rgb(239, 247, 255);
}

#finalContent {
	color: rgb(60, 100, 191);
	background-color: rgb(239, 247, 255);
}
.sellHouseContentWrap{
	margin-bottom:40px;
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
			if (location.href.indexOf('<%=request.getContextPath()%>/sales/calculator') > -1){ 
	        	$('#calculator').addClass('current');
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
				 <div class="category_swiper">
					<a href="<%=request.getContextPath()%>/sales/calculator"  class="category_button" type="button" id="calculator">청약가점계산기</a>
				</div>
			</div>
		</div>
		<div class="calculatorWrap">
			<div>
				<div class="NoticeWrap">
					<p style="margin-top: 16px;">청약가점제에 의해 청약신청 할 때에는 청약자 본인이 직접 소유주택수,무주택기간 및 부양가족수를 산정해야
						하므로</p>
					<p>신청 전에 청약 신청시 유의사항 및 가점제도 내용을 충분히 이해해야만 착오에 따른 불이익을 피할 수
						있습니다.</p>
				</div>
				<div class="selectFamilyWrap">
					<h1>
						부양가족수
						<div data-bs-toggle="modal" data-bs-target="#familyModal">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
								fill="currentColor" class="bi bi-question-circle-fill"
								viewBox="0 0 16 16" >
	                            <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z" />
	                        </svg>						
						</div>
					</h1>
					<select name="select1" class="selectFamily">
						<option value="0">인원선택</option>
						<option value="5">0명</option>
						<!--5점-->
						<option value="10">1명</option>
						<!--10점-->
						<option value="15">2명</option>
						<!--15점-->
						<option value="20">3명</option>
						<!--20점-->
						<option value="25">4명</option>
						<!--25점-->
						<option value="30">5명</option>
						<!--30점-->
						<option value="35">6명이상</option>
						<!--35점-->
					</select>
				</div>
				<div class="nohomePeriod">
					<h1>
						무주택기간
						<div data-bs-toggle="modal" data-bs-target="#nohouseModal">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
								fill="currentColor" class="bi bi-question-circle-fill"
								viewBox="0 0 16 16">
	                            <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z" />
	                        </svg>
                       </div>
					</h1>
					<select name="select2" class="selectFamily">
						<option value="0">기간선택</option>
						<option value="0">30세 미만 미혼 무주택자</option>
						<!--0점-->
						<option value="2">1년 미만</option>
						<!--2점-->
						<option value="4">1년 이상 ~ 2년 미만</option>
						<!--4점-->
						<option value="6">2년 이상 ~ 3년 미만</option>
						<!--6점-->
						<option value="8">3년 이상 ~ 4년 미만</option>
						<!--8점-->
						<option value="10">4년 이상 ~ 5년 미만</option>
						<!--10점-->
						<option value="12">5년 이상 ~ 6년 미만</option>
						<!--12점-->
						<option value="14">6년 이상 ~ 7년 미만</option>
						<!--14점-->
						<option value="16">7년 이상 ~ 8년 미만</option>
						<!--16점-->
						<option value="18">8년 이상 ~ 9년 미만</option>
						<!--18점-->
						<option value="20">9년 이상 ~ 10년 미만</option>
						<!--20점-->
						<option value="22">10년 이상 ~ 11년 미만</option>
						<!--22점-->
						<option value="24">11년 이상 ~ 12년 미만</option>
						<!--24점-->
						<option value="26">12년 이상 ~ 13년 미만</option>
						<!--26점-->
						<option value="28">13년 이상 ~ 14년 미만</option>
						<!--28점-->
						<option value="30">14년 이상 ~ 15년 미만</option>
						<!--30점-->
						<option value="35">15년 이상</option>
						<!--35점-->
					</select>
				</div>
				<div class="joinWrap">
					<h1>
						청약통장 가입기간
						<div data-bs-toggle="modal" data-bs-target="#periodModal">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
								fill="currentColor" class="bi bi-question-circle-fill"
								viewBox="0 0 16 16">
	                            <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z" />
	                        </svg>
                        </div>
					</h1>
					<div>
						<select name="select3" class="selectFamily">
							<option value="0">기간선택</option>
							<option value="1">만 6월 미만</option>
							<!--1점-->
							<option value="2">만 6월 이상 ~ 만 1년 미만</option>
							<!--2점-->
							<option value="3">만 1년 이상 ~ 2년 미만</option>
							<!--3점-->
							<option value="4">만 2년 이상 ~ 3년 이상</option>
							<!--4점-->
							<option value="5">만 3년 이상 ~ 4년 미만</option>
							<!--5점-->
							<option value="6">만 4년 이상 ~ 5년 미만</option>
							<!--6점-->
							<option value="7">만 5년 이상 ~ 6년 미만</option>
							<!--7점-->
							<option value="8">만 6년 이상 ~ 7년 미만</option>
							<!--8점-->
							<option value="9">만 7년 이상 ~ 8년 미만</option>
							<!--9점-->
							<option value="10">만 8년 이상 ~ 9년 미만</option>
							<!--10점-->
							<option value="11">만 9년 이상 ~ 10년 미만</option>
							<!--11점-->
							<option value="12">만 10년 이상 ~ 11년 미만</option>
							<!--12점-->
							<option value="13">만 11년 이상 ~ 12년 미만</option>
							<!--13점-->
							<option value="14">만 12년 이상 ~ 13년 미만</option>
							<!--14점-->
							<option value="15">만 13년 이상 ~ 14년 미만</option>
							<!--15점-->
							<option value="16">만 14년 이상 ~ 15년 미만</option>
							<!--16점-->
							<option value="17">만 15년 이상</option>
							<!--17점-->
						</select>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="btnArea d-grid gap-2">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#exampleModal" onclick="calculator();">계산하기</button>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">

			<div class="modal-dialog modal-dialog-centered">

				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight:700;">청약가점계산결과</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="resultTable">
							<thead>
								<tr>
									<th>가점항목</th>
									<th>선택내용</th>
									<th>취득점수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>부양가족수</th>
									<td id="familyContent"></td>
									<td id="familyScore"></td>
								</tr>
								<tr>
									<th>무주택기간</th>
									<td id="nohouseContent"></td>
									<td id="nohouseScore"></td>
								</tr>
								<tr>
									<th>청약통장가입기간</th>
									<td id="periodContent"></td>
									<td id="periodScore"></td>
								</tr>
								<tr>
									<th id="finalContent" colspan="2">총점</th>
									<td id="finalScore"></td>
								</tr>
							</tbody>

						</table>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 부양가족수 모달  -->
		<div class="modal fade" id="familyModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">

			<div class="modal-dialog modal-dialog-centered">

				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight:700;">부양가족수 적용기준</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>부양가족은 입주자모집공고일 현재 세대원 중에서 아래에 해당하는 경우입니다. (본인 제외)</p>
						<br>
						<p>배우자</p>
						<p>배우자 분리세대의 경우에도 포함<p>
						<p>직계존속(부모/조부모)배우자의 직계존속 포함</p>
						<p>청약신청자가 세대주여야 하며 3년이상 동일 주민등록등본에 등재된 직계존속 배우자 분리세대인 경우 배우자가 세대주여야 하며 3년이상 동일 주민등록등본에 등재된 직계존속</p>
						<p>직계존속(자녀/손자녀)</p>	
						<p>자녀 : 동일 주민등록등본에 등재된 만 30세 미만의 미혼 자녀(배우자 분리세대인 경우, 배우자와 동일한 주민등록표상에 등재되어있어야 함) 다만 만 30세 이상인 미혼자녀는 1년 이상 동일 주민등록등본에 등재된 경우에만 부양가족으로 인정</p>
						<p>손자녀 : 부모가 모두 사망한 경우 미혼인 손자녀</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 무주택기간 모달  -->
		<div class="modal fade" id="nohouseModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight:700;">무주택기간 산정</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>청약신청자 및 그 배우자를 기준으로 산정</p>
						<br>
						<p>1) 청약신청자 및 배우자가 주택을 소유한 적이 없는 경우</p>
						<p>청약신청자의 연령이 만 30세가 되는 날부터 주택의 모집공고일까지 기산함.</p>
						<p>다만, 만 30세가 되기 전에 혼인한 경우 혼인신고일로 등재된 날부터 기산함</p>
						<br>
						<p>2) 청약신청자 및 배우자가 주택을 소유한 적이 있는 경우</p>
						<p>그 주택을 처분한 후 무주택자가 된 날과 위의 1)번의 날 중 늦은 날부터 기산함.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 청약통장가입 모달  -->
		<div class="modal fade" id="periodModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">

			<div class="modal-dialog modal-dialog-centered">

				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight:700;">청약통장 가입기간 산정</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>입주자모집공고일 현재 청약자의 청약통장 가입기간을 기준으로하며, 청약통장 전환, 예치금액변경 및 명의변경을 한 경우에도 최초가입일(순위기산일)을 기준으로 가입기간을 산정합니다.</p>
						<br><br>
						<p>*실제 인터넷청약 시에는 은행에서 청약통장 가입기간 및 해당 점수를 자동 산정하여 부여함</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>

	<script>
        
        function calculator(){
            
            var familyScore = $("select[name=select1]").val();
            var nohouseScore = $("select[name=select2]").val();
            var periodScore = $("select[name=select3]").val();

            var familyContent = $("select[name=select1] option:selected").text();
            var nohouseContent = $("select[name=select2] option:selected").text();
            var periodContent = $("select[name=select3] option:selected").text();
            if(familyContent == "인원선택"){
                familyContent = "선택안함"; 
            }
            if(nohouseContent == "기간선택"){
                nohouseContent = "선택안함";
            }
            if(periodContent == "기간선택"){
                periodContent = "선택안함";
            }
    
            var finalScore = parseInt(familyScore)+parseInt(nohouseScore)+parseInt(periodScore);

            console.log(finalScore);

            $("#familyContent").text(familyContent);
            $("#nohouseContent").text(nohouseContent);
            $("#periodContent").text(periodContent);

            $("#familyScore").text(familyScore);
            $("#nohouseScore").text(nohouseScore);
            $("#periodScore").text(periodScore);

            $("#finalScore").text(finalScore);
 
        };
        
    </script>





	<jsp:include page="../common/footer.jsp" />
</body>
</html>