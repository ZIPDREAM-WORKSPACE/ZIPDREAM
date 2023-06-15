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
	min-width: 300px;
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

.answerBox {
	padding-bottom: 20px;
	border-bottom: 1px solid rgb(221, 221, 221);
}

.answerBox>span {
	font-weight: 700;
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
								<span class="answerNumber">01</span> <span class="questionTitle">분양공고문</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<div class="answerBox">
								<span>공급면적</span>
								<p>실 주거면적과 주거공용면적(E/V, 계단, 복도)을 합한 면적</p>
							</div>
							<div class="answerBox">
								<span>공용면적</span>
								<p>공동으로 사용하는 장소의 면적</p>
							</div>
							<div class="answerBox">
								<span>주거전용면적</span>
								<p>각 가구가 독립적으로 사용하는 면적</p>
							</div>
							<div class="answerBox">
								<span>주거공용면적</span>
								<p>공동으로 사용하는 공간을 세대 수로 나눈 면적</p>
							</div>
							<div class="answerBox">
								<span>기타공용면적</span>
								<p>관리사무소, 노인정 등 아파트 입주민들의 공용 사용 면적</p>
							</div>
							<div class="answerBox">
								<span>계약면적</span>
								<p>공급면적과 공용면적을 모두 합한 면적</p>
							</div>
							<div class="answerBox">
								<span>대지면적</span>
								<p>집을 지을 땅의 수평면상 넓이</p>
							</div>
							<div class="answerBox">
								<span>공유대지면적</span>
								<p>아파트 단지의 놀이터나 도로 등으로 사용되는 면적</p>
							</div>
							<div class="answerBox">
								<span>특별공급</span>
								<p>다자녀 가구, 신혼부부 가구 등 신청시 자격조건이 있는 공급유형</p>
							</div>
							<div class="answerBox">
								<span>일반공급</span>
								<p>특별공급에 해당사항이 없는 일반적인 공급방식</p>
							</div>
							<div class="answerBox">
								<span>대지지분</span>
								<p>아파트 전체 단지의 대지면적을 가구수로 나눠 등기부에 표시되는 면적</p>
							</div>
							<div class="answerBox">
								<span>예치금</span>
								<p>정기적으로 통장에 예치해 두는 금액</p>
							</div>
							<div class="answerBox">
								<span>계약금</span>
								<p>청약한 아파트에 당첨되어 계약을 할 때 지불해야하는 금액</p>
							</div>
							<div class="answerBox">
								<span>중도금</span>
								<p>분양가격을 중간 중간 나누어 지불하는 돈</p>
							</div>
							<div class="answerBox">
								<span>잔금</span>
								<p>분양가격 중 가장 나중에 지불하는 나머지 금액</p>
							</div>
							<div class="answerBox">
								<span>발코니</span>
								<p>건축물 외벽에 돌출하여 부가적으로 설치되는 공간</p>
							</div>
							<div class="answerBox">
								<span>베란다</span>
								<p>건물의 1,2층의 면적차로 생긴 일부 공간을 활용하고자 하여 생긴 공간</p>
							</div>
							<div class="answerBox">
								<span>테라스</span>
								<p>실내 바닥 높이보다 20cm가량 낮은 곳에 전용정원 형태로 만든 공간</p>
							</div>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerNumber">02</span> <span class="questionTitle">대출용어</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<div class="answerBox">
								<span>LTV(주택탐보대출비율)</span>
								<p>은행에서 거래예정인 주택을 담보로 빌릴 수 있는 대출가능한도. 아파트 소재지역이 투기지역 또는
									투기과열지구에 해당된다면 LTV(주택담보인정비율)는 40%, 조정대상지연은 60%, 그 밖의 지역은 70%가
									적용되며, 서민 실수요자는 LTV비율 제한을 10% 완화한다.</p>
							</div>
							<div class="answerBox">
								<span>DTI(총부채상환비율)</span>
								<p>개인의 수입에 따라 채무상환능력을 책정하는 비율 대툴상환액이 소득의 일정 비율을 넘지 않도록 제한하기
									위한 비율. 기존 DTI는 기존 주택담보대출의 경우 '이자'만 반영했지만 신DTI는 '원리금'까지 합산한다는
									특징이 있다.</p>
								<p>산정방식 = (모든 주식담보대출 원리금 + 기타대출이자) ÷ 연소득</p>
							</div>
							<div class="answerBox">
								<span>DSR(총부채원리금상환비율)</span>
								<p>개인이 보유한 신규 및 기존 전체 대출의 원리금을 연간 소득으로 나눈값. DSR 산정 기준 부채에는
									주담대는 물론 신용대출, 학자금대출, 할부금, 마이너스통장 등이 모두 포함된다.</p>
								<p>산정방식 = 모든 가계대출원리금 ÷ 연소득</p>
							</div>
							<div class="answerBox">
								<span>공시지가</span>
								<p>매년 1월 1일을 기준으로 국토교통부 장관이 발표하는 전국의 땅 값.</p>
							</div>
							<div class="answerBox">
								<span>기준시가</span>
								<p>땅과 그 위에 지어진 건물까진 합친 값. 기준시가는 단독주택, 공동주택, 토지 등 세가지로 구분된다.</p>
							</div>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerNumber">03</span> <span class="questionTitle">주택용어</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<div class="answerBox">
								<span>Bay</span>
								<p>아파트의 Bay(베이)란 건물의 기둥과 기둥 사이의 공간으로, 이들 공간 중에서도 햇볕이 들어오는
									공간으로 베이의 수를 결정한다.</p>
							</div>
							<div class="answerBox">
								<span>2Bay</span>
								<p>햇볕이 들어오는 방향에 거실1+방1개가 있는 경우</p>
							</div>
							<div class="answerBox">
								<span>3Bay</span>
								<p>햇볕이 들어오는 방향에 거실1+방2개가 있는 경우</p>
							</div>
							<div class="answerBox">
								<span>4Bay</span>
								<p>햇볕이 들어오는 방향에 거실1+방3개가 있는 경우</p>
							</div>
							<div class="answerBox">
								<span>분양권</span>
								<p>일반적으로 청약통장을 통해 주택에 당첨된 경우 분양권을 가지게 된다.</p>
							</div>
							<div class="answerBox">
								<span>입주권</span>
								<p>재개발/재건축 조합원이 새 집에 입주할 수 있는 권리로 분양권에 비해 저렴한 가격으로 주택 매입이
									가능하다.</p>
							</div>
							<div class="answerBox">
								<span>분양권 전매</span>
								<p>주택을 분양받은 사람이 그 지위를 다른 사람에게 넘겨주어 입주자를 변경하는 것</p>
							</div>
							<div class="answerBox">
								<span>조망권</span>
								<p>건축물 등과 같은 특정한 위치의 내부에서 밖을 바라볼 때 보여지는 경관에 대한 권리</p>
							</div>
							<div class="answerBox">
								<span>일조권</span>
								<p>일반적으로 햇볕을 향유할 수 있는 권리를 말하며 건축물의 높이제한 기준의 하나로 사용된다.</p>
							</div>
							<div class="answerBox">
								<span>재건축</span>
								<p>일반적으로 주거환경 개선을 위해 노후주택을 헐고 새로운 주택을 건축하는 것을 말한다.</p>
							</div>
							<div class="answerBox">
								<span>재개발</span>
								<p>노후 주택 뿐만 아니라 거주지 주변의 편의 및 공공시설까지 함께 개발하는 것을 말한다.</p>
							</div>
							<div class="answerBox">
								<span>뉴타운</span>
								<p>여러 개의 재개발구역을 묶어 개발하는 것을 말한다</p>
							</div>
						</div>
					</div>
					<div class="listAnswer">
						<div class="Hquestion">
							<div>
								<span class="answerNumber">04</span> <span class="questionTitle">건축물용어</span>
							</div>
							<svg id="toggle" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" fill="currentColor" class="bi bi-caret-down-fill"
								viewBox="0 0 16 16">
                                <path
									d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
						</div>
						<div class="Hanswer">
							<div class="answerBox">
								<span>용적률</span>
								<p>건물의 높이를 어느 정도까지 지을 수 있는지 정해두는 제한율이다.</p>
							</div>
							<div class="answerBox">
								<span>건폐율</span>
								<p>대지면적에 대한 건축할 수 있는 1층 부분의 면적으로, 국토 균형 개발을 위한 수평적인 제한율을
									말한다.</p>
							</div>
							<div class="answerBox">
								<span>시행사</span>
								<p>부지 매입부터 각종 인허가는 물론 공사의 전 과정을 관리하는 회사</p>
							</div>
							<div class="answerBox">
								<span>시공사</span>
								<p>시행사로부터 발주를 받아 실제로 공사를 담당하는 회사</p>
							</div>
							<div class="answerBox">
								<span>투기지역</span>
								<p>주택가격 및 토지가격이 급등하는 지역의 양도소득세를 기준시가 대신 실거래가액으로 부과하기 위해
									기획재정부 장관이 지정하는 지역</p>
							</div>
							<div class="answerBox">
								<span>투기과열지구</span>
								<p>주택가격의 안정을 위하여 필요한 경우에 건설교통부장관 또는 시장·도지사가 지정하는 지구</p>
							</div>
							<div class="answerBox">
								<span>조정대상지역</span>
								<p>주택 가격 상승률이 물가 상승률의 2배 이상이거나 청약경쟁률이 5 대 1 이상인 지역</p>
							</div>
							<div class="answerBox">
								<span>양도소득세</span>
								<p>토지나 건물 등 소유권 양도에 따라 생기는 양도소득에 대해 부과하는 조세</p>
							</div>
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