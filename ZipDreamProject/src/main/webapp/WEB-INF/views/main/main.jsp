<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
.s_image {
	width: 100%;
	height: 800px;
	object-fit: cover;
}

/* body {
	overflow-x: hidden;
} */

.slider {
	position: relative;
	width: 40%;
	margin: auto;
}
.news_slider{
	
	position: relative;
	width: 40%;
	margin: auto;

}

.slider .slick-list,  .news_slider .slick-list{
	margin: 0 -20px;
}

.slider .slick-slide, .news_slider .slick-slide{
	margin: 0 20px;
}

.notice_list {
	height: 300px;
	background: rgb(36, 43, 106);
	border-radius: 10px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	color: white;
	position: relative;
	margin-bottom: 20px;
	cursor: pointer;
}

.news {
	height: 300px;
	background: rgb(236, 236, 236);
	color: black;
	margin-bottom: 20px;
	cursor: pointer;
	position: relative;
	padding: 10px 20px 5px 20px;
}

.news:after {
	z-index: -1;
	position: absolute;
	content: "";
	bottom: 15px;
	right: 10px;
	left: auto;
	width: 50%;
	top: 80%;
	max-width: 400px;
	background: #777;
	-webkit-box-shadow: 0 15px 10px #777;
	-moz-box-shadow: 0 15px 10px #777;
	box-shadow: 0 15px 10px #777;
	-webkit-transform: rotate(3deg);
	-moz-transform: rotate(3deg);
	-o-transform: rotate(3deg);
	-ms-transform: rotate(3deg);
	transform: rotate(3deg);
}

.nlist_inner, .news_inner {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
}

.nlist, .news_list {
	position: relative;
	width: 100%;
	height: 100%;
}

.notice_text {
	width: 100%;
	height: 400px;
	margin: auto;
	text-align: center;
	line-height: 400px;
	font-size: 30px;
	font-weight: 600;
	font-size: 30px;
	color: #1F4B6B;
}

.nlist_text {
	text-align: center;
	height: 300px;
	width: 100%;
	padding-left: 20px;
	padding-right: 20px;
	font-weight: 600;
	position: absolute;
	top: 30%;
}

.pin {
	position: absolute;
	right: 10px;
	top: 5px;
	width: 20px;
	height: 20px;
}

.main_ad {
	position: relative;
}

.main_text {
	position: absolute;
	top: 30%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	font-weight: 600;
}

.search {
	margin-top: 150px;
	height: 400px;
	width: 100%;
	background-color: #1F4B6B;
}

#s_top {
	height: 200px;
	line-height: 250px;
	width: 100%;
	color: white;
	margin: auto;
	text-align: center;
	font-size: 30px;
	font-weight: 600;
}

#s_bottom {
	width: 50%;
	height: 50px;
	background: #FFFFFF;
	box-shadow: inset 0px 4px 12px rgba(0, 0, 0, 0.75);
	border-radius: 50px;
	margin: auto;
}

#s_text {
	width: 90%;
	margin: auto;
}

#s_icon {
	width: 10%;
	align: right;
}

#s_input {
	width: 100%;
	border: none;
}

#s_input:focus {
	outline: none;
	!
	important;
}

#s_bottom_inner>div {
	float: left;
	height: 90%;
}

#s_bottom_inner {
	width: 90%;
	height: 70%;
	padding-top: 14px;
	margin: auto;
	position: relative;
}

#s_icon_image {
	width: 26px;
	height: 27px;
	position: absolute;
	top: 14px;
	right: 0px;
}

@media only screen and (max-width: 900px) {
	#s_bottom {
		width: 80%;
		height: 50px;
		background: #FFFFFF;
		box-shadow: inset 0px 4px 12px rgba(0, 0, 0, 0.75);
		border-radius: 50px;
		margin: auto;
	}
}

.news_title {
	font-weight: 500;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	font-size: 20px;
}


.news_content{
	padding:5px 0px 5px 0px;
	display: flex;
	height:70%;
	width: 100%;
	justify-content: center;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	text-align: left;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 8;
	-webkit-box-orient: vertical;
	
}
.news_image{
	height:100%;
	width:48%;
	margin-right:2%;
}
.news_image>img{
	height:100%;
	width:100%;
	object-fit:cover;
}
.news_name{
	font-size:12px;
	text-align: right;
	color:grey;
}
.hr_color{
	background: grey;
	padding:0;
	margin-top:9px;
	margin-bottom:9px;
}
#more{
	width:43%;
	height:30px;
	text-align:right;
	margin: auto;
	cursor: pointer;
}
@keyframes move {
  0% {
    margin-left: 1px;
  }
  50% {
    margin-left: 6px;
  }
  100% {
    margin-left: 1px;
  }
}
#more_text{
	width:50px;
	height:26px;
	border: 2px solid black;
	margin-left:90%;
	text-align: center;
	border-radius: 6px;
}
#arrow{
	width:18px;
	height:18px;
	padding-bottom: 3px;
	 animation: move 0.7s ease-in-out infinite;
}
.main_ad2{
	height:700px;
	width:100%;
	background: #F4F9FF;
	
}
.main_ad_inner{
	height:700px;
	width:55%;
	margin: auto;
	display: flex;
	align-items:center;
}
.main_ad_text{
	height:700px;
	width:50%;
	padding-top:20%;
	
}
.main_ad_text>h1{
	font-weight: 600;
	
}
.more_btn{
	height:45px;
	width:135px;
	border: 3px solid black;
	font-weight: 600;
	border-radius: 30px;
	text-align: center;
	font-size:20px;
	cursor: pointer;
	padding-top:5px;
}
.more_btn:hover{
	border: 3px solid rgb(169, 192, 212);
	color:rgb(169, 192, 212);
	transition : 0.2s;
}
.mImage>img{
	width:100%;
	height:100%;
	object-fit:cover;
}
.mImage{
	width:100%;
	height:100%;
}
.main_ad_image{
	width:50%;
	height:40%;
	background: black;
	box-shadow: rgba(17, 17, 26, 0.1) 0px 8px 24px, rgba(17, 17, 26, 0.1) 0px 16px 56px, rgba(17, 17, 26, 0.1) 0px 24px 80px;
}
.main_h5{
	color:rgb(62, 44, 168);
}
.main_login{
	height:500px;
	width:100%;
	background: black;
	color:white;
}
.login_inner{
	width:40%;
	height:150px;
	margin: auto;
	text-align: center;
	padding-top:80px;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div style="padding: 0; background-color: white;">
		<div id="slider-div">
			<div class="main_ad">
				<img class="s_image" src='https://ifh.cc/g/oJ1bpk.jpg' border='0'>
				<h1 class="main_text" style="font-size: 50px">집드림이 드리는 혜택</h1>
			</div>
			<div class="main_ad">
				<img class="s_image"
					src="<%=request.getContextPath()%>/resources/images/main2.png"
					border='0'>
				<h1 class="main_text" style="font-size: 50px">집드림이 드리는 혜택</h1>
			</div>
			<div class="main_ad">
				<img class="s_image"
					src="<%=request.getContextPath()%>/resources/images/main3.png"
					border='0'>
				<h1 class="main_text" style="font-size: 50px">집드림이 드리는 혜택</h1>
			</div>

		</div>
	</div>

	<div class="notice">
		<div class="notice_text" data-aos="fade-up"  data-aos-duration="2000"> 집드림의 부동산 가이드</div>
		<div class="slider">
			<div class="notice_list">
				<img class="pin"
					src="<%=request.getContextPath()%>/resources/images/pin.png">
				<div class="nlist">
					<div class="nlist_inner">
						<div class="nlist_text">알아두면 좋은 부동산 용어!</div>
					</div>
				</div>
			</div>
			<div class="notice_list">
				<img class="pin"
					src="<%=request.getContextPath()%>/resources/images/pin.png">
				<div class="nlist">
					<div class="nlist_inner">
						<div class="nlist_text">임대차 계약</div>
					</div>
				</div>
			</div>
			<div class="notice_list">
				<img class="pin"
					src="<%=request.getContextPath()%>/resources/images/pin.png">
				<div class="nlist">
					<div class="nlist_inner"></div>
				</div>
			</div>
			<div class="notice_list">
				<img class="pin"
					src="<%=request.getContextPath()%>/resources/images/pin.png">
				<div class="nlist">
					<div class="nlist_inner"></div>
				</div>
			</div>
			<div class="notice_list">
				<img class="pin"
					src="<%=request.getContextPath()%>/resources/images/pin.png">
				<div class="nlist">
					<div class="nlist_inner"></div>
				</div>
			</div>
			<div class="notice_list">
				<img class="pin"
					src="<%=request.getContextPath()%>/resources/images/pin.png">
				<div class="nlist">
					<div class="nlist_inner"></div>
				</div>
			</div>
		</div>

	</div>

	<div class="search">
		<div id="s_top" data-aos="fade-up"  data-aos-duration="2000">어떤 집을 찾으시나요?</div>
		<div id="s_bottom">
			<div id="s_bottom_inner">
				<div id="s_text">
					<input type="text" id="s_input" placeholder="지역, 또는 아파트명을 입력하세요.">
				</div>
				<div id="s_icon">
					<a href='#'><img id="s_icon_image"
						src='https://ifh.cc/g/4amlfg.png' border='0'></a>
				</div>
			</div>
		</div>
	</div>


	<div class="notice">
		<div class="notice_text" data-aos="fade-up"  data-aos-duration="3000">집드림의 부동산 뉴스</div>
		<div class="news_slider">
			<div class="news">
				<div class="news_list">
					<div class="news_inner">
						<div class="news_title">서울보다 지방이 더 올랐다…분양가 고공행진, 집값 기름붓나</div>
						<div class="news_content">
							<div class="news_text">
							알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어!
							알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어!알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어!
							알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어!
							알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어</div>
							</div>
							<hr class="hr_color">
						<div class="news_name">신용수
							기자&nbsp;&nbsp;|&nbsp;&nbsp;23-05-06</div>
					</div>
				</div>
			</div>
			<div class="news">
				<div class="news_list">
					<div class="news_inner">
						<div class="news_title">서울보다 지방이 더 올랐다…분양가 고공행진, 집값 기름붓나</div>
						<div class="news_content">
							알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어!
							알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어!알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어!
							알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어!
							알아두면 좋은 부동산 용어! 알아두면 좋은 부동산 용어
							</div>
							<hr class="hr_color">
						<div class="news_name">신용수
							기자&nbsp;&nbsp;|&nbsp;&nbsp;23-05-06</div>
					</div>
				</div>
			</div>
			<div class="news">
				<div class="news_list">
					<div class="news_inner">
						<div class="news_text">알아두면 좋은 부동산 용어!</div>
					</div>
				</div>
			</div>
			<div class="news">
				<div class="news_list">
					<div class="news_inner">
						<div class="news_text">알아두면 좋은 부동산 용어!</div>
					</div>
				</div>
			</div>
			<div class="news">
				<div class="news_list">
					<div class="news_inner">
						<div class="news_text">알아두면 좋은 부동산 용어!</div>
					</div>
				</div>
			</div>
		</div>
		<div id="more">
			<div id="more_text"><span><img id="arrow" src='https://ifh.cc/g/whCxm8.png' border='0'></span></div>
		</div>
	</div>
	<div class="main_ad2" style="margin-top:200px;">
		<div class="main_ad_inner">
			<div class="main_ad_text"><h1 data-aos="fade-down-right" data-aos-duration="1500"
     				data-aos-offset="100" data-aos-easing="ease-in-sine">원하는<br>분양이 나오면<br>바로 알려드려요!</h1><br>
					<h5 class="main_h5" data-aos="flip-up" >싸고 좋은 매물, 제일 먼저 확보하세요</h5><br>
					<div class="more_btn" data-aos="zoom-in-up">더 알아보기</div>
				</div>
			<div class="main_ad_image" data-aos="fade-down"
								     data-aos-easing="linear"
								     data-aos-duration="1500">
				<div class="mImage"><img src="<%=request.getContextPath()%>/resources/images/main4.png"></div>
			</div>
		</div>
		
	</div>
	<div class="main_ad2" >
		<div class="main_ad_inner">
			<div class="main_ad_image" data-aos="fade-down"
					     data-aos-easing="linear"
					     data-aos-duration="1500">
				<div class="mImage"><img src="<%=request.getContextPath()%>/resources/images/main4.png"></div>
			</div>
			<div class="main_ad_text" style="text-align:right;">
					<h1 data-aos="fade-down-left" data-aos-duration="1500"
     				data-aos-offset="100" data-aos-easing="ease-in-sine" >다양한 이벤트를<br>만나보세요.</h1><br>
					<h5 class="main_h5" data-aos="flip-up">첫 가입시 10% 복비 할인</h5>
					<h5 class="main_h5" data-aos="flip-up"> 첫 거래시 복비 할인 쿠폰</h5><br>
					<div class="more_btn" style="position:absolute; right:22%;" data-aos="zoom-in-up">더 알아보기</div>
				</div>
		</div>
		
	</div>
	<div class="main_ad2">
		<div class="main_ad_inner">
			<div class="main_ad_text"><h1 data-aos="fade-down" data-aos-duration="1500"
     				data-aos-offset="100" data-aos-easing="ease-in-sine">지역 내 베테랑 부동산이<br>당신의 거래를 책임집니다.</h1><br>
					<h5 class="main_h5" data-aos="flip-up">집드림과 지역 전문 중개사들이</h5><h5 class="main_h5" data-aos="flip-up">함께합니다.</h5><br>
					<div class="more_btn" data-aos="zoom-in-up">더 알아보기</div>
				</div>
			<div class="main_ad_image"  data-aos="fade-left"
									     data-aos-easing="linear"
									     data-aos-duration="1500">
				<div class="mImage"><img src="<%=request.getContextPath()%>/resources/images/main4.png"></div>
			</div>
		</div>
	</div>
	<div class="main_login">
		<div class="login_inner">
			<div id="login_text"><h1>이 모든 놀라운 기능을</h1><h1>지금 이용해보세요.</h1></div>
			<div id="login_ani"></div>
			<div id="login_btn"></div>
		</div>
	</div>

	<script>
	  
	
		$(function() {
		
			
			$('#slider-div').slick({
				slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
				infinite : true, //무한 반복 옵션	 
				slidesToShow : 1, // 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
				speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : false, // 옆으로 이동하는 화살표 표시 여부
				dots : true, // 스크롤바 아래 점으로 페이지네이션 여부
				autoplay : true, // 자동 스크롤 사용 여부
				autoplaySpeed : 3000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
				pauseOnHover : false, // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
				vertical : false, // 세로 방향 슬라이드 옵션
				// prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
				//nextArrow : "<button type='button' class='slick-next'>Next</button>",	 	// 다음 화살표 모양 설정
				dotsClass : "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
				draggable : true, //드래그 가능 여부 

			});

			$('#slider-div').slick('slickPlay');
			$('.slick-dots').css('bottom', '-15px');

			$('.slider').slick({
				// centerMode: true,
				// centerPadding: '60px',
				slidesToShow : 3,
				responsive : [ {
					breakpoint : 1100,
					settings : {
						arrows : false,
						centerMode : true,
						centerPadding : '10px',
						slidesToShow : 2
					}
				}, {
					breakpoint : 800,
					settings : {
						arrows : false,
						centerMode : true,
						centerPadding : '10px',
						slidesToShow : 1
					}
				} ]
			});
			
			$('.news_slider').slick({
				// centerMode: true,
				// centerPadding: '60px',
				slidesToShow : 2,
				responsive : [ {
					breakpoint : 1100,
					settings : {
						arrows : false,
						centerMode : true,
						centerPadding : '10px',
						slidesToShow : 1
					}
				} ]
			
			});
			 AOS.init();
			 
			
		})
		
	</script>

	<jsp:include page="../common/footer.jsp" />